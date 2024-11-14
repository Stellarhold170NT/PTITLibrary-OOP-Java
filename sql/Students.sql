create table students (
	id int primary key identity(1, 1),
	full_name nvarchar(100),
	date_of_birth DATE,
	enrollment_year int,
	major nvarchar(10),
	email nvarchar(100),
	address nvarchar(255)
);

alter table students
add gender varchar(20)

insert into students(full_name, date_of_birth, enrollment_year, major, email, address, gender)
values (N'Lê Anh Tuấn', '2004-01-01', 2022, 'CNTT', 'TuanLA.B22CN755@stu.ptit.edu.vn', N'Hà Nội', N'Nam')