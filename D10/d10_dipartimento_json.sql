create table d11_dipartimento_json (
    id                             number generated by default on null as identity 
                                   constraint d11_dipartimento_j_id_pk primary key,
    dipartimento                   clob check (dipartimento is json)
)
;
 
/*
dipartimento_json
  dipartimento json 

# settings = { prefix: "d11", semantics: "CHAR", language: "EN", APEX: true }
*/

-- insert di json valido
insert into d11_dipartimento_json  (dipartimento) 
     values (
                '{"dipartimenti": [{ "name": "dipartimento1","label": "My dipartimento 1","value": "ABCD"},
                                   { "name": "dipartimento2","label": "My dipartimento 2","value": "XYZ"},
                                   { "name": "dipartimento3","label": "My dipartimento 3","value": "Y"}
                                  ]
                 }'
            );
            
-- insert di json NON valido
insert into d11_dipartimento_json  (dipartimento) 
     values (
                '{"dipartimenti": [{       : "dipartimento1","label": "My dipartimento 1","value": "ABCD"},
                                   { "name": "dipartimento2","label": "My dipartimento 2","value": "XYZ"},
                                   { "name": "dipartimento3","label": "My dipartimento 3","value": "Y"}
                                  ]
                 }'
            );

-- semplice query
select dipartimento 
 from d11_dipartimento_json;

-- query con dot notation ERRATA (mancano gli alias)
select dipartimento.dipartimenti 
 from d11_dipartimento_json;
 

-- query con dot notation CORRETTA (ci sono gli alias)
select d.dipartimento.dipartimenti 
 from d11_dipartimento_json d;
 
 select d.dipartimento.dipartimenti.name  as name,
       d.dipartimento.dipartimenti.label as label
  from d11_dipartimento_json d;
 