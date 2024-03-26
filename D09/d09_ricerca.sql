-- drop objects
drop table d09_dipendente cascade constraints;
drop table d09_cliente cascade constraints;
drop table d09_attivita cascade constraints;

-- create tables
create table d09_dipendente (
    id                             number generated by default on null as identity 
                                   constraint d09_dipendente_id_pk primary key,
    dipendente                     varchar2(9 char)
                                   constraint d09_dipendente_dipendente_unq unique not null,
    email                          varchar2(19 char) not null,
    tariffa                        number not null
)
;

create table d09_cliente (
    id                             number generated by default on null as identity 
                                   constraint d09_cliente_id_pk primary key,
    cliente                        varchar2(10 char)
                                   constraint d09_cliente_cliente_unq unique not null,
    citta                          varchar2(7 char) not null
)
;

create table d09_attivita (
    id                             number generated by default on null as identity 
                                   constraint d09_attivita_id_pk primary key,
    dipendente_id                  number
                                   constraint d09_attivita_dipendente_id_fk
                                   references d09_dipendente not null,
    cliente_id                     number
                                   constraint d09_attivita_cliente_id_fk
                                   references d09_cliente not null,
    attivita                       varchar2(15 char) not null,
    descrizione                    varchar2(50 char) not null,
    data                           date not null,
    ore                            number not null
)
;

-- table index
create index d09_attivita_i1 on d09_attivita (cliente_id);
create index d09_attivita_i82 on d09_attivita (dipendente_id);

-- load data
 
insert into d09_dipendente (
    id,
    dipendente,
    email,
    tariffa
) values (
    1,
    'FRANCESCA',
    'FRANCESCA@GMAIL.COM',
    200
);

insert into d09_dipendente (
    id,
    dipendente,
    email,
    tariffa
) values (
    2,
    'ANNA',
    'ANNA@GMAIL.COM',
    150
);

insert into d09_dipendente (
    id,
    dipendente,
    email,
    tariffa
) values (
    3,
    'MARCO',
    'MARCO@GMAIL.COM',
    100
);

commit;

alter table d09_dipendente
modify id generated always as identity restart start with 4;
 
-- load data
-- load data
 
insert into d09_cliente (
    id,
    cliente,
    citta
) values (
    1,
    'CLIENTE_01',
    'MILANO'
);

insert into d09_cliente (
    id,
    cliente,
    citta
) values (
    2,
    'CLIENTE_02',
    'ROMA'
);

insert into d09_cliente (
    id,
    cliente,
    citta
) values (
    3,
    'CLIENTE_03',
    'FIRENZE'
);

commit;

alter table d09_cliente
modify id generated always as identity restart start with 4;
 
-- load data
 
insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    1,
    'Vestibulum',
    'Convallis Sollicitudin Elementum Nulla',
    3,
    3,
    sysdate - 90,
    18
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    2,
    'Dictum',
    'Quis Consectetur Mi Venenatis',
    2,
    1,
    sysdate - 16,
    13
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    3,
    'Elit',
    'Rhoncuscras Vulputate Porttitor Ligula',
    3,
    1,
    sysdate - 88,
    46
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    4,
    'Quis',
    'Rhoncus Nonmolestie Sit Amet',
    3,
    2,
    sysdate - 73,
    62
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    5,
    'Sit',
    'Ligula Nam Semper Diam',
    1,
    1,
    sysdate - 91,
    74
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    6,
    'Risusphasellus',
    'Sapien Suscipit Tristique Ac',
    3,
    2,
    sysdate - 36,
    92
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    7,
    'Ac',
    'Vitae Ligula Commodo Dictum',
    3,
    1,
    sysdate - 77,
    52
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    8,
    'Rhoncuscras',
    'Placerat Iaculis Aliquam Vestibulum',
    3,
    1,
    sysdate - 62,
    93
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    9,
    'Ipsumprimis',
    'Id Nulla Ac Sapien',
    1,
    3,
    sysdate - 64,
    6
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    10,
    'Amet',
    'Proin Vulputate Placerat Pellentesque',
    1,
    3,
    sysdate - 43,
    86
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    11,
    'Ac',
    'Luctus Et Ultrices Posuere',
    3,
    1,
    sysdate - 28,
    7
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    12,
    'Iaculis',
    'Luctus Et Ultrices Posuere',
    2,
    3,
    sysdate - 83,
    37
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    13,
    'Et',
    'Diam Suscipit Elementum Sodales',
    3,
    2,
    sysdate - 47,
    69
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    14,
    'Elit',
    'Ligula Nam Semper Diam',
    2,
    3,
    sysdate - 71,
    32
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    15,
    'Luctus',
    'Massa Pharetra Id Mattis',
    3,
    2,
    sysdate - 79,
    3
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    16,
    'Commodo',
    'Ultrices Posuere Cubilia Curae;',
    1,
    3,
    sysdate - 97,
    49
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    17,
    'Vestibulum',
    'Commodo Dictum Lorem Sit',
    2,
    2,
    sysdate - 15,
    46
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    18,
    'Amet',
    'In Faucibus Orci Luctus',
    2,
    1,
    sysdate - 50,
    90
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    19,
    'Orci',
    'Eget Rhoncus Nonmolestie Sit',
    2,
    3,
    sysdate - 19,
    65
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    20,
    'Ac',
    'Imperdiet Ex Etiam Cursus',
    1,
    3,
    sysdate - 25,
    84
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    21,
    'Vestibulum',
    'Ante Ipsumprimis In Faucibus',
    2,
    1,
    sysdate - 86,
    96
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    22,
    'Nec',
    'Eu Lorem Commodo Ullamcorperinterdum',
    2,
    2,
    sysdate - 79,
    46
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    23,
    'Cubilia',
    'Sapien Suscipit Tristique Ac',
    1,
    2,
    sysdate - 34,
    48
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    24,
    'Risusphasellus',
    'Et Ultrices Posuere Cubilia',
    2,
    3,
    sysdate - 15,
    16
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    25,
    'Tristique',
    'Etiam Cursus Porttitor Tincidunt',
    3,
    2,
    sysdate - 71,
    44
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    26,
    'Sit',
    'Consectetur Mi Venenatis Nec',
    3,
    2,
    sysdate - 34,
    12
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    27,
    'Mattis',
    'Sit Amet Lectus Nulla',
    1,
    3,
    sysdate - 94,
    23
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    28,
    'Sit',
    'Suscipit Tristique Ac Volutpat',
    3,
    1,
    sysdate - 77,
    9
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    29,
    'Semper',
    'Id Mattis Risus Rhoncuscras',
    1,
    1,
    sysdate - 26,
    14
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    30,
    'Viverra',
    'Porttitor Tincidunt Vestibulum Ante',
    2,
    2,
    sysdate - 93,
    83
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    31,
    'Id',
    'Lorem Commodo Ullamcorperinterdum Et',
    1,
    2,
    sysdate - 43,
    64
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    32,
    'Nec',
    'Placerat Pellentesque Proin Viverra',
    2,
    3,
    sysdate - 8,
    88
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    33,
    'Suscipit',
    'Convallis Sollicitudin Elementum Nulla',
    1,
    1,
    sysdate - 60,
    34
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    34,
    'In',
    'Vulputate Placerat Pellentesque Proin',
    2,
    2,
    sysdate - 88,
    26
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    35,
    'Dictum',
    'Proin Viverra Lacinialectus Quis',
    2,
    2,
    sysdate - 80,
    53
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    36,
    'Vestibulum',
    'Porttitor Tincidunt Vestibulum Ante',
    1,
    3,
    sysdate - 76,
    16
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    37,
    'Fames',
    'Massa Pharetra Id Mattis',
    3,
    3,
    sysdate - 33,
    26
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    38,
    'Et',
    'Risus Rhoncuscras Vulputate Porttitor',
    3,
    3,
    sysdate - 13,
    33
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    39,
    'Amet',
    'Vulputate Porttitor Ligula Nam',
    2,
    1,
    sysdate - 5,
    10
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    40,
    'Id',
    'Ante Ipsum Primis In',
    2,
    3,
    sysdate - 6,
    69
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    41,
    'Sapien',
    'Elementum Sodales Proin Sit',
    1,
    1,
    sysdate - 9,
    91
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    42,
    'Dictum',
    'Eget Rhoncus Nonmolestie Sit',
    1,
    3,
    sysdate - 42,
    45
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    43,
    'In',
    'Mi Venenatis Nec Donec',
    3,
    3,
    sysdate - 81,
    76
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    44,
    'Vitae',
    'Cursus Porttitor Tincidunt Vestibulum',
    2,
    2,
    sysdate - 94,
    84
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    45,
    'Donec',
    'Id Nulla Ac Sapien',
    1,
    1,
    sysdate - 50,
    81
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    46,
    'Proin',
    'Commodo Ullamcorperinterdum Et Malesuada',
    1,
    3,
    sysdate - 84,
    52
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    47,
    'Ut',
    'Proin Viverra Lacinialectus Quis',
    3,
    3,
    sysdate - 25,
    77
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    48,
    'Tristique',
    'Proin Vulputate Placerat Pellentesque',
    3,
    2,
    sysdate - 62,
    82
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    49,
    'Vulputate',
    'Elementum Sodales Proin Sit',
    2,
    1,
    sysdate - 46,
    18
);

insert into d09_attivita (
    id,
    attivita,
    descrizione,
    dipendente_id,
    cliente_id,
    data,
    ore
) values (
    50,
    'Massa',
    'Ante Ipsum Primis In',
    1,
    2,
    sysdate - 26,
    6
);

commit;

alter table d09_attivita
modify id generated always as identity restart start with 51;
 
 
-- Generated by Quick SQL Lunedì Dicembre 19, 2022  10:57:22
 
/*
dipendente /insert 3
  dipendente vc50 /nn /values francesca,anna,marco /unique
  email vc50 /nn /values francesca@gmail.com,anna@gmail.com,marco@gmail.com
  tariffa num /nn /values 200,150,100

cliente /insert 3
  cliente vc50 /nn /values cliente_01,cliente_02,cliente_03 /unique
  citta vc30 /nn /values Milano,Roma,Firenze


attivita /insert 50
  attivita vc15 /nn 
  descrizione vc50 /nn
  dipendente_id /nn
  cliente_id /nn
  data d /nn
  ore num /nn
#ondelete:restrict
#drop:true

# settings = { prefix: "d09", onDelete: "RESTRICT", semantics: "CHAR", drop: true, language: "EN", APEX: true }
*/
