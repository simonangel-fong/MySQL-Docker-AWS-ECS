/* This is a script to initialize database. */
CREATE DATABASE empdb;

use empdb;

create table emp(
    empID int not null auto_increment,
    firstname varchar(100) not null,
    lastname varchar(100) not null,
    primary key (empID)
);

insert into
    emp(firstname, lastname)
values
    ("John", "Andersen"),
    ("Emma", "Smith");