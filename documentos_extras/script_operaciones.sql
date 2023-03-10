
select e.empr_id, e.empr_nombre,tm_codigo,k.rc_id, rc_nombre  , r.rack_nombre from empresas e
left join actas a on e.empr_id = a.empr_id
left join kardex k on a.acta_id = k.acta_id
left join racks_casillas rc on k.rc_id = rc.rc_id
left join racks r on r.rack_id = rc.rack_id
where tm_codigo = 'DESPACHO' AND e.deleted_at is null
group by  e.empr_id, e.empr_nombre,tm_codigo,k.rc_id
order by e.empr_nombre, r.rack_nombre asc

