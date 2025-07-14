create table if not exists featuredtags
(
    tagnumber integer not null
        constraint featuredtags_pk
            primary key,
    title     varchar(100)
        constraint featuredtags_pk_2
            unique
);

