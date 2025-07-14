create table if not exists deliveries
(
    ordernumber   integer not null
        constraint deliveries_pk
            primary key
        constraint deliveries_orders_ordernumber_fk
            references orders,
    streetaddress varchar(100),
    state         varchar(100),
    city          varchar(100),
    zipcode       integer,
    driverid      integer
        constraint deliveries_drivers_driverid_fk
            references drivers
);

