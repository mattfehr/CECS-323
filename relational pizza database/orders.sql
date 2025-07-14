create table if not exists orders
(
    ordernumber integer not null
        constraint orders_pk
            primary key,
    ordertime   timestamp,
    isonline    boolean,
    isdelivery  boolean,
    customerid  integer
        constraint orders_customers_customerid_fk
            references customers
);

