create table if not exists ingredients
(
    ingredientnumber integer not null
        constraint ingredients_pk
            primary key,
    name             varchar(100)
        constraint ingredients_pk_2
            unique,
    price            numeric,
    calories         integer
);

