CREATE PROCEDURE GenerateNotification
    @borrowID INT,
    @NotificationType NVARCHAR(100)
AS
BEGIN
    DECLARE @Message NVARCHAR(500);
    DECLARE @bookTitle NVARCHAR(100);
    DECLARE @due_date DATETIME;

    -- Lấy tên sách và ngày hết hạn từ bảng BorrowRecords
    SELECT @bookTitle = b.title, @due_date = br.due_date
    FROM BorrowRecords br
    JOIN Books b ON br.book_id = b.id
    WHERE br.id = @borrowID;

    -- Tạo thông báo dựa trên loại thông báo
    IF @NotificationType = N'Mượn tài liệu thành công'
    BEGIN
        SET @Message = N'Bạn đã mượn thành công tài liệu ' + @bookTitle + 
                       N'. Tài liệu được mượn đến hết ngày ' + 
                       CONVERT(NVARCHAR, @due_date, 103) + 
                       N', chúc Ptiter học tốt!';
    END
    ELSE IF @NotificationType = N'Trả sách thành công'
    BEGIN
        SET @Message = N'Cảm ơn bạn đã trả tài liệu ' + @bookTitle + 
                       N' đúng hạn. Hẹn gặp lại bạn trong những kỳ học sau';
    END
   
    -- Thêm thông báo vào bảng Notifications
    INSERT INTO Notifications (borrowID, NotificationType, Message, NotificationDate, IsRead)
    VALUES (@borrowID, @NotificationType, @Message, GETDATE(), 0);
END;