create database aula03;

use aula03;

show tables;

create table tropaads (
	id int primary key,
	primeiroNome varchar(255) not null,
	ultimoNome varchar(255) not null,
	cargo varchar(255)
);

create table Livros (
	ID int primary key,
	Titulo varchar(255) not null,
	ISBN varchar(255) not null,
	AnoPublicacao int not null
);

alter table Livros
modify column AnoPublicacao int;

alter table Livros
add constraint fk_autor
foreign key (autorId) references Autores(id);



create table Autores (
	id int primary key auto_increment,
	autorNome varchar(100) not null
);


insert into Autores (autorNome)
values ('Franz Kafka');

insert into Livros values (2, "METAMORFOSE", "978-8571646858", 2024, 2);

select (Titulo) from Livros where AnoPublicacao > 2020;
 