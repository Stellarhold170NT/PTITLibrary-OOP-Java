create table books (
	id int primary key identity(1,1),
	book_code as ('BK' + format(id, '000')),
	title nvarchar(25),
	author nvarchar(255),
	published_year int,
	total_copies int,
	copies_available int,
	publisher nvarchar(25)
)

alter table books
add constraint chk_copies_available check(copies_available >= 0)