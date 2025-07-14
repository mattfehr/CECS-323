create table if not exists toppings
(
    pizzanumber      integer not null
        constraint toppings_pizzas_pizzanumber_fk
            references pizzas,
    ingredientnumber integer not null
        constraint toppings_ingredients_ingredientnumber_fk
            references ingredients,
    regionnumber     integer not null
        constraint toppings_regions_regionnumber_fk
            references regions,
    amountnumber     integer not null
        constraint toppings_toppingamounts_amountnumber_fk
            references toppingamounts,
    constraint toppings_pk
        primary key (pizzanumber, ingredientnumber, regionnumber, amountnumber)
);

