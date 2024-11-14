create table Users (
	username varchar(20) primary key,
	password varchar(20) not null,
	name nvarchar(50),
	email varchar(100) unique,
	role varchar(10)
);

alter table users
add avatar varbinary(max)

alter table users
alter column avatar nvarchar(255);

create trigger trg_SetAvatar
on users
after insert
as
begin
	update u
	set u.avatar = 
		case
			when s.gender = 'Nam' then 'avatar.jpg'
			when s.gender = N'Nữ' then 'avatar_girl.jpg'
			else 'avatar.jpg'
		end
	from users u
	inner join inserted i on u.username = i.username
	inner join students s on s.student_code = i.username
end


alter trigger trg_SetAvatar
on users
after insert
as
begin
	update u
	set u.avatar = 
		case
			when s.gender = 'Nam' then './assets/img/avatar.jpg'
			when s.gender = N'Nữ' then './assets/img/avatar_girl.jpg'
		end
	from users u
	inner join inserted i on u.username = i.username
	inner join students s on s.student_code = i.username
end




