create table if not exists regions
(
    regionnumber   integer not null
        constraint regions_pk
            primary key,
    name           varchar(100),
    costmultiplier double precision,
    constraint regions_pk_2
        unique (name, costmultiplier)
);

