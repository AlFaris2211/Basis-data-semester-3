SELECT * FROM employee1;
-- membuat table employee1
CREATE TABLE employee1 (
	id_emp varchar(5),
    name_emp varchar(50),
    age int);
SELECT * FROM employee1;
-- input data coloumn
insert into employee1(
	id_emp, name_emp, age)
values ('123','Budi',21);
select * from employee1;
-- jalankan perintah 2 kali
insert into employee1(
	id_emp, name_emp, age)
values ('123','Budi',21);
select * from employee1;
-- update duplikat data
update employee1 
set id_emp = '123', name_emp = 'Budi', age = 21
where id_emp = '234' and name_emp = 'Dani' and age = 23
Limit 1;
select * from employee1;
-- mengubah id menjadi primary key
alter table employee1
add primary key (id_emp);
select * from employee1;
-- menambahkan data
insert into employee1(
	id_emp, name_emp, age)
values 
('134', 'Arief','24'),
('144', 'Intan','20'),
('155', 'Ayu','21');
select * from employee1;
-- menghapus beberapa data
delete from employee1 
where id_emp = '123'
	or name_emp = 'Intan'
    or age = 21;
select * from employee1;
-- menambahkan kembali beberapa data
insert into employee1(
	id_emp, name_emp, age)
values 
('211', 'Mulya','21'),
('212', 'Dewi','22'),
('213', 'Ayu','23');
select * from employee1;
-- menghapus semua data dan membatalkan penghapusan
START TRANSACTION;
DELETE FROM employee1;
-- Membatalkan penghapusan
ROLLBACK;
select * from employee1;
-- menghapus semua data
delete from employee1;
select * from employee1;
-- menginput data baru
insert into employee1(
	id_emp, name_emp, age)
values 
('123', 'Budi B', '21'),
('234', 'Dani', '23'),
('134', 'Budi A', '24'),
('144', 'Intan', '20'),
('155', 'Budi W', '25');
select * from employee1;
-- menampilkan nama budi diatas 21 thn
select * from employee1 
where name_emp like 'Budi%' and age > 21;
-- menampilkan usia antara 22-24
select * from employee1
where age between 22 and 24;
-- menambahkan kolom gol 
alter table employee1 
add column gol varchar (5);
update employee1
set gol =
	case
		when id_emp = '123' Then 'I'
		when id_emp = '234' then 'II'
		when id_emp = '134' then 'III'
		when id_emp = '144' then 'I'
		when id_emp = '155' then 'II'
		when id_emp = '234' then 'I' 
        else null
    end;
select * from employee1;
-- membuat table golongan 
CREATE TABLE golongann (
    gol varchar (5),
    Gol_name varchar (25)
);
select * from golongann;
-- input data pada tabel golongann
insert into golongann (
	gol, Gol_name)
    values 
    ('I', 'Golongan I'),
	('II', 'Golongan II'),
	('III', 'Golongan III'),
    ('IV', 'Golongan IV');
select * from golongann; 
describe golongann;
alter table golongann
add primary key (gol);
alter table employee1
add constraint fk_golongan
foreign key (gol) references golongann(gol);
select e.id_emp, e.name_emp, e.age, g.Gol_name
from employee1 e
join golongann g on e.gol = g.gol;
