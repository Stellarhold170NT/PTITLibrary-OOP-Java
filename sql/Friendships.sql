create table Friendships (
	id int primary key identity,
	UserID1 varchar(20) foreign key references Users(username),
	UserID2 varchar(20) foreign key references Users(username),
	Status nvarchar(30),
	Timestamp DATETIME DEFAULT GETDATE()
)