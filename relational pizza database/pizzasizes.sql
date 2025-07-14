create table if not exists pizzasizes
(
    sizenumber     integer not null
        constraint pizzasizes_pk
            primary key,
    size           varchar(100),
    costmultiplier double precision,
    constraint pizzasizes_pk_2
        unique (size, costmultiplier)
);

