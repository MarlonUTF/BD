SELECT SUM(valor) as total
FROM despesa
WHERE MONTH(dataDespesa) = 5;

SELECT SUM(valor) as total_intervalo
FROM despesa
WHERE dataDespesa BETWEEN '2024-05-14' AND '2024-06-30';

SELECT despesa.idInsumo, despesa.valor, insumo.idCategoria
FROM despesa, insumo
where despesa.idInsumo = insumo.idInsumo
group by idCategoria;

select sum(valor) as total, insumo.idCategoria
from despesa, insumo
where insumo.idCategoria = despesa.idCategoria;



