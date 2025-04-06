-- 3.
SELECT DISTINCT e.nom_dpt,
	e.ciutat_dpt
FROM EMPLEATS e
WHERE e.num_proj IN (3, 4);