create table Messages(
	Id int primary key identity,
	SenderID varchar(20) foreign key references users(username),
	ReceiverID varchar(20) foreign key references users(username),
	content nvarchar(max),
	Timestamp DATETIME DEFAULT GETDATE(),
	IsDeleted BIT DEFAULT 0
);


alter table messages
add is_read BIT DEFAULT 0
