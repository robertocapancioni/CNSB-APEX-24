select json_object(
    'datiRigheDettaglio' is json_array(
        json_object(
            'numeroRiga' is 1,
            'codiceArticolo' is null,
            'totale' is 100.00,
            'descrizione' is 'Abbonamento Mensile Standard',
            'tipoArticolo' is 1,
            'quantita' is 1.0,
            'importoUnitario' is 100.00,
            'idCodiceIVA' is 17
        )
    ),
    'datiRiepilogo' is json_array(
        json_object(
            'idCodiceIVA' is 17,
            'aliquotaIVA' is 22.0,
            'imponibileIVA' is 100.00,
            'importoIVA' is 22.00,
            'arrotondamentoIVA' is 0.0,
            'totale' is 122.00,
            'tipoEsigibilitaIVA' is 0,
            'speseAccessorie' is 0.0
        )
    ),
    'datiTotali' is json_object(
        'totaleImponibile' is 100.00,
        'totaleIVA' is 22.00,
        'importoBollo' is 0.0,
        'flAddebitoBollo' is 'true' format json,
        'totaleDocumento' is 122.00,
        'totaleNettoPagare' is 122.00,
        'totaleRitenutaAcconto' is 0.0,
        'totaleRitenutaPrevidenziale' is 0.0,
        'totalePrimaCassa' is 0.0,
        'totaleSecondaCassa' is 0.0
    ),
    'tipoDocumento' is 3,
    'idCliente' is 6,
    'idProgressivo' is 13,
    'dataDocumento' is '2023-10-01T00:00:00+02:00',
    'idTipoPagamento' is 'MP08',
    'idModalitaPagamento' is 1,
    'flElettronica' is 'true' format json,
    'flPrezziIvati' is 'false' format json,
    'flAccompagnatoria' is 'false' format json,
    'flAcconto' is 'false' format json,
    'flScadenzeManuali' is 'false' format json,
    'datiFatturaElettronica' is json_object(
        'tipoDocumentoFE' is 'TD01',
        'regimeFiscale' is 'RF01',
        'causale' is null,
        'flArticolo73' is 'false' format json,
        'riferimentoAmministrativo' is null,
        'titoloCedente' is null
    ),
    'datiScadenze' is json_array(
        json_object(
            'dataScadenza' is '2023-10-01T00:00:00+02:00',
            'importo' is 122.00
        )
    )
) as json_output
from dual;
