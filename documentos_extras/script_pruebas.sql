 

-- MOSTRAR LOS REPETIDOS--
SELECT prod_sku,  count(*) FROM productos_x_empresa 
     GROUP BY prod_sku
     HAVING COUNT(*)>1;
     

select prod_id, prod_nombre,prod_sku,prod_lote, prod_stock,prod_estado,deleted_at 
from productos_x_empresa  where empr_id = 27;


-- VERIFICAR STOCK DE PODUCTO CON MOVIMIENTO DE ACTA--
select k.prod_id, p.prod_nombre, p.prod_stock from actas a 
left join  kardex k on a.acta_id = k.acta_id
left join  productos_x_empresa p on p.prod_id = k.prod_id
where a.acta_id = 32 group by k.prod_id;
     
     
-- VALIDAR STOCK DE PRODUCTOS POR RACKS--     
select rc.rc_id, k.prod_id, r.rack_nombre,rc.rc_nombre, sum(kard_cantidad)as total 
FROM casillas_empresas ce
inner join racks_casillas as rc on ce.rc_id=rc.rc_id
inner join racks as r on rc.rack_id = r.rack_id
inner join kardex k on k.rc_id = rc.rc_id

where k.prod_id = 45 
and k.deleted_at IS NULL group by rc.rc_id ;



-- VALIDAR STOCK X RACK_CASILLA_ID--     
select ce.id , rc.rc_id,   r.rack_nombre,rc.rc_nombre, sum(kard_cantidad)as total 
FROM casillas_empresas ce
inner join racks_casillas as rc on ce.rc_id=rc.rc_id
inner join racks as r on rc.rack_id = r.rack_id
inner join kardex k on k.rc_id = rc.rc_id

where ce.id = 28 
and k.deleted_at IS NULL group by rc.rc_id, ce.id ;

select rc_id, sum(kard_cantidad)as total from kardex 
where rc_id = 20 and deleted_at is null
 
-- update kardex set kard_cantidad = (kard_cantidad*-1) where tipo_movimiento='DESPACHO'


-- VALIDAR STOCK DE PRODUCTOS POR RACKS sku--     
select rc.rc_id, k.prod_id,pe.prod_sku, r.rack_nombre,rc.rc_nombre, sum(kard_cantidad)as total 
FROM casillas_empresas ce
inner join racks_casillas as rc on ce.rc_id=rc.rc_id
inner join racks as r on rc.rack_id = r.rack_id
inner join kardex k on k.rc_id = rc.rc_id
inner join productos_x_empresa pe on pe.prod_id= k.prod_id

where pe.prod_sku = 'A102056'
and k.deleted_at IS NULL group by rc.rc_id,k.prod_id;

-- BUSCAR PROD_SKU
select * from productos_x_empresa where prod_stock =0;

-- BUSCAR PROD_ID
select * from kardex where prod_id = '58';


--  MOSTRAR CASILLAS POR EMPRESAS
select * from casillas_empresas where empr_id = '21';
     
select e.empr_id, e.empr_nombre, a.tipo_movimiento_codigo, a.created_at from empresas e
inner join actas a on a.empr_id = e.empr_id;


-- MOSTRAR DETALLE KARDEX DE ACTA_ID --

select a.acta_id, a.empr_id,k.kard_id,k.prod_id,p.prod_sku, p.prod_nombre, k.rc_id, k.kard_cantidad from actas a 
inner join kardex k on a.acta_id = k.acta_id
inner join productos_x_empresa p on k.prod_id = p.prod_id
where a.acta_id = 102;


 


