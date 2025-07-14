create table if not exists pizzas
(
    pizzanumber integer not null
        constraint pizzas_pk
            primary key,
    ordernumber integer
        constraint pizzas_orders_ordernumber_fk
            references orders,
    sizenumber  integer
        constraint pizzas_pizzasizes_sizenumber_fk
            references pizzasizes
);

