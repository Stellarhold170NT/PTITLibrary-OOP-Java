-- Trường hợp 1: Cập nhật những bản ghi đã đăng ký quá 3 ngày
UPDATE BorrowRecords
SET status = N'Đăng ký bị hủy'
WHERE status = N'Đang chờ' 
  AND DATEDIFF(DAY, borrow_date, GETDATE()) > 3;

-- Trường hợp 2: Cập nhật những bản ghi có ngày hết hạn đã trôi qua
UPDATE BorrowRecords
SET status = N'Quá hạn'
WHERE status = N'Đang mượn'
  AND due_date < GETDATE();