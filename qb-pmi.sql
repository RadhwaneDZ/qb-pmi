create table player_mdt
(
    id          int auto_increment
        primary key,
    char_id     varchar(11)  null,
    notes       varchar(255) null,
    mugshot_url varchar(255) null,
    bail        bit          null,
    fingerprint varchar(255) null
)
    charset = utf8;