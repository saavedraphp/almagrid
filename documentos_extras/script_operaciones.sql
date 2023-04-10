
select a.acta_id as acta, k.kard_id as kardex,e.empr_nombre as emrpresa,tm_codigo as movimiento,p.prod_sku as sku,p.prod_nombre as producto, k.kard_cantidad as cantidad, CONCAT(r.rack_nombre,' - ', rc.rc_nombre) as casilla,
date_format(a.created_at,'%d/%m/%Y') as fecha_registro, a.acta_comentario from empresas e
left join actas a on e.empr_id = a.empr_id
left join kardex k on a.acta_id = k.acta_id
left join racks_casillas rc on k.rc_id = rc.rc_id
left join racks r on r.rack_id = rc.rack_id
left join productos_x_empresa p  on p.prod_id = k.prod_id
where e.deleted_at is null  and e.empr_id =27
order by e.empr_nombre, a.acta_id asc

