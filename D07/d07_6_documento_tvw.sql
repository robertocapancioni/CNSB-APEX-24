create or replace view d07_documento_tvw as
select 
 id,
 tipo_documento_id,
 codice,
 data_documento,
 firma_yn,
 categoria
 from d07_documento;

create or replace trigger d07_documento_tvw_itrg 
instead of insert on d07_documento_tvw 
for each row 
begin 
        d07_documento_api.insert_row (
            p_id                          => id                     ,
            p_tipo_documento_id           => tipo_documento_id      ,
            p_codice                      => codice                 ,
            p_data_documento              => data_documento         ,
            p_firma_yn                    => firma_yn               ,
            p_categoria                   => categoria              
            );
end; 
/

create or replace trigger d07_documento_tvw_utrg 
instead of update on d07_documento_tvw 
for each row 
begin 
        d07_documento_api.update_row (
            p_id                          => id                     ,
            p_tipo_documento_id           => tipo_documento_id      ,
            p_codice                      => codice                 ,
            p_data_documento              => data_documento         ,
            p_firma_yn                    => firma_yn               ,
            p_categoria                   => categoria              
            );
end; 
/

create or replace trigger d07_documento_tvw_dtrg 
instead of delete on d07_documento_tvw 
for each row 
begin 
        d07_documento_api.delete_row (
        p_id                           => id
    );
end; 
/
