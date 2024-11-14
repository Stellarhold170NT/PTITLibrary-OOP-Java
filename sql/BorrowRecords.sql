create table BorrowRecords (
	id int primary key identity(1,1),
	student_id varchar(20) foreign key references users(username),
	book_id int foreign key references books(id),
	borrow_date datetime,
	status nvarchar(50),
)

alter table borrowRecords
add constraint chk_unique_borrow unique(student_id, book_id)

ALTER TABLE BorrowRecords
ADD due_date AS DATEADD(MONTH, 5, borrow_date);

alter table BorrowRecords
add borrow_code as ('BRC' + format(id, '000'))

ALTER TABLE BorrowRecords
DROP CONSTRAINT chk_unique_borrow;

CREATE UNIQUE INDEX idx_unique_borrow
ON BorrowRecords (student_id, book_id)
WHERE status <> N'Đăng ký bị hủy' AND status <> N'Đã trả';

