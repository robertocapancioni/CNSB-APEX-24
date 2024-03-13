create or replace view d03_acquisto_vw as
select a.id,
       a.fornitore_id,
       f.fornitore,
       f.zona,  
       a.prodotto_id,
       p.prodotto,
       p.tipo_prodotto_id,
       tp.tipo_prodotto,
       a.data,
       a.quantita,
       a.quantita * p.prezzo_acquisto valore
  from d03_acquisto a
  join d03_fornitore f      on a.fornitore_id     = f.id
  join d03_prodotto p       on a.prodotto_id      = p.id
  join d03_tipo_prodotto tp on p.tipo_prodotto_id = tp.id;

create or replace view d03_vendita_vw as
select v.id,
       v.cliente_id,
       c.cliente,
       c.zona,  
       v.prodotto_id,
       p.prodotto,
       p.tipo_prodotto_id,
       tp.tipo_prodotto,
       v.data,
       v.quantita,
       v.quantita * p.prezzo_vendita valore
  from d03_vendita v
  join d03_cliente c      on v.cliente_id     = c.id
  join d03_prodotto p       on v.prodotto_id      = p.id
  join d03_tipo_prodotto tp on p.tipo_prodotto_id = tp.id;