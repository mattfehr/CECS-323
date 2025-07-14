create table if not exists inventories
(
    ingredientnumber integer not null
        constraint inventories_pk
            primary key
        constraint inventories_ingredients_ingredientnumber_fk
            references ingredients,
    count            integer,
    nextdelivery     date
);

