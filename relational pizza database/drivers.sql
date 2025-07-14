create table if not exists drivers
(
    driverid  integer not null
        constraint drivers_pk
            primary key,
    firstname varchar(100),
    lastname  varchar(100),
    hiredate  date
);

