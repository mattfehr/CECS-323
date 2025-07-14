create table if not exists customers
(
    customerid  integer not null
        constraint customers_pk
            primary key,
    firstname   varchar(100),
    lastname    varchar(100),
    phonenumber varchar(100)
);

