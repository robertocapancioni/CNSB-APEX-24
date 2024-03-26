create or replace view d09_fattura_vw as
select d.id,
       t.anno,
       t.numero,
       d.riga,
       d.descrizione,
       d.quantita,
       d.importo,
       c.codice_cliente,
       c.ragione_sociale,
       c.piva
  from d09_fattura_dettaglio d
  join d09_fattura_Testata t on d.fattura_testata_id = t.id
  join d09_cliente c on t.cliente_id = c.id;