create table if not exists featuredtoppings
(
    featuredpizzanumber integer not null
        constraint featuredtoppings_featuredpizzas_featuredpizzanumber_fk
            references featuredpizzas,
    regionnumber        integer not null
        constraint featuredtoppings_regions_regionnumber_fk
            references regions,
    amountnumber        integer not null
        constraint featuredtoppings_toppingamounts_amountnumber_fk
            references toppingamounts,
    ingredientnumber    integer not null
        constraint featuredtoppings_ingredients_ingredientnumber_fk
            references ingredients,
    constraint featuredtoppings_pk
        primary key (featuredpizzanumber, regionnumber, amountnumber, ingredientnumber)
);

