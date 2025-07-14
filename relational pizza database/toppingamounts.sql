create table if not exists toppingamounts
(
    amountnumber integer not null
        constraint toppingamounts_pk
            primary key,
    name         varchar(100)
        constraint toppingamounts_pk_2
            unique
);

