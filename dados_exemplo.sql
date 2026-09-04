-- Exemplo mínimo de um frete.
-- Apague ou adapte antes de executar.

insert into public.fretes (
    cte, nf, origem, destino,
    peso_calculado, peso_utilizado,
    valor_merc_calculado, valor_merc_utilizado,
    frete_peso_calculado, frete_peso_utilizado,
    gris_adv_calculado, gris_adv_utilizado,
    pedagio_calculado, pedagio_utilizado,
    tx_tde_calculada, tx_tde_utilizado,
    taxa_cte_calculado, taxa_cte_utilizado,
    icms_calculado, icms_utilizado,
    total_calculado, total_utilizado
) values (
    '123456', '987654',
    'Jundiaí/SP', 'São Paulo/SP',
    100, 120,
    10000, 10000,
    500, 550,
    100, 120,
    80, 80,
    50, 50,
    30, 30,
    100, 100,
    860, 930
);
