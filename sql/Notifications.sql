create table notifications(
	id int primary key identity,
	borrowID int foreign key references borrowRecords(id),
	NotificationType NVARCHAR(100) Check(NotificationType IN (N'Mượn tài liệu thành công', N'Trả sách thành công',N'Thông báo!')),
	Message NVARCHAR(500),
	NotificationDate DATETIME DEFAULT GETDATE(),
	IsRead BIT DEFAULT 0
)

ALTER TABLE Notifications
ADD CONSTRAINT UC_Borrow_Notification UNIQUE (borrowID, NotificationType);