ALTER PROCEDURE NotifyBooksDueSoon
AS
BEGIN
    DECLARE @borrowID INT;
    DECLARE @bookTitle NVARCHAR(100);
    DECLARE @due_date DATETIME;
    DECLARE @Message NVARCHAR(500);

    -- Tìm các bản ghi có ngày hết hạn trong vòng 7 ngày tới và chưa được trả (giả sử status = 'Đang mượn')
    DECLARE due_soon_cursor CURSOR FOR
    SELECT br.id, b.title, br.due_date
    FROM BorrowRecords br
    JOIN Books b ON br.book_id = b.id
    WHERE br.due_date BETWEEN DATEADD(DAY, -1, GETDATE()) AND DATEADD(DAY, 7, GETDATE())
      AND br.status = N'Đang mượn';

    OPEN due_soon_cursor;

    FETCH NEXT FROM due_soon_cursor INTO @borrowID, @bookTitle, @due_date;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Tạo thông báo
        SET @Message = N'Tài liệu ' + @bookTitle + 
                       N' mà bạn đã mượn sẽ đến hạn trả vào ngày ' + 
                       CONVERT(NVARCHAR, @due_date, 103) + 
                       N'. Vui lòng trả sách đúng hạn để tránh phát sinh phí phạt';

        -- Thêm vào bảng Notifications
        INSERT INTO Notifications (borrowID, NotificationType, Message, NotificationDate, IsRead)
        VALUES (@borrowID, N'Thông báo!', @Message, GETDATE(), 0);

        FETCH NEXT FROM due_soon_cursor INTO @borrowID, @bookTitle, @due_date;
    END;

    CLOSE due_soon_cursor;
    DEALLOCATE due_soon_cursor;
END;
