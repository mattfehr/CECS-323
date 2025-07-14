create table if not exists featuredpizzatags
(
    tagnumber           integer not null
        constraint featuredpizzatags_featuredtags_tagnumber_fk
            references featuredtags,
    featuredpizzanumber integer not null
        constraint featuredpizzatags_featuredpizzas_featuredpizzanumber_fk
            references featuredpizzas,
    constraint featuredpizzatags_pk
        primary key (tagnumber, featuredpizzanumber)
);

