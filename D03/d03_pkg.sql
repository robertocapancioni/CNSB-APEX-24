create or replace package d03_pkg is

function get_vendita (
                      p_cliente_id   in number default null,
                      p_prodotto_id  in number default null
                    ) return clob sql_macro;

function get_acquisto (
                      p_fornitore_id in number default null,
                      p_prodotto_id  in number default null
                    ) return clob sql_macro;
end d03_pkg;
/

create or replace package body d03_pkg is

function get_vendita (
                      p_cliente_id   in number default null,
                      p_prodotto_id  in number default null
                    ) return clob sql_macro
                     is
begin
  RETURN q'{
            select v.id,
                v.cliente_id,
                c.cliente,
                v.prodotto_id,
                p.prodotto,
                p.tipo_prodotto_id,
                tp.tipo_prodotto,
                v.data,
                v.quantita
            from d03_vendita v
            join d03_cliente c on v.cliente_id = c.id
            join d03_prodotto p on v.prodotto_id = p.id
            join d03_tipo_prodotto tp on p.tipo_prodotto_id = tp.id
            where v.cliente_id  = nvl(p_cliente_id,v.cliente_id)
              and v.prodotto_id = nvl(p_prodotto_id,v.prodotto_id)
  }';
end get_vendita;

function get_acquisto (
                      p_fornitore_id in number default null,
                      p_prodotto_id  in number default null
                    ) return clob sql_macro
                     is
begin
  RETURN q'{
             select a.id,
                    a.fornitore_id,
                    f.fornitore,
                    a.prodotto_id,
                    p.prodotto,
                    p.tipo_prodotto_id,
                    tp.tipo_prodotto,
                    a.data,
                    a.quantita
                from d03_acquisto a
                join d03_fornitore f on a.fornitore_id = f.id
                join d03_prodotto p on a.prodotto_id = p.id
                join d03_tipo_prodotto tp on p.tipo_prodotto_id = tp.id
               where a.fornitore_id  = nvl(p_fornitore_id,a.fornitore_id)
                 and a.prodotto_id = nvl(p_prodotto_id,a.prodotto_id)
  }';
end get_acquisto;

end d03_pkg;
/