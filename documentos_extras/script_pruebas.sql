
-- TOTAL DE PRODUCTOS POR EMPRESA
SELECT   pe.empr_id, count(1) as total_productos FROM productos_x_empresa pe
where pe.deleted_at is null
group by  pe.empr_id
 
having count(*)>1 ;



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
     
     
-- VALIDAR STOCK DE PRODUCTOS(prod_id = ) POR RACKS--     
select rc.rc_id, k.prod_id, r.rack_nombre,rc.rc_nombre, sum(kard_cantidad)as total 
FROM casillas_empresas ce
inner join racks_casillas as rc on ce.rc_id=rc.rc_id
inner join racks as r on rc.rack_id = r.rack_id
inner join kardex k on k.rc_id = rc.rc_id

where k.prod_id = 3 
and k.deleted_at IS NULL group by rc.rc_id ;



-- VALIDAR STOCK X RACK_CASILLA_ID--     
select ce.id , rc.rc_id,   r.rack_nombre,rc.rc_nombre, sum(kard_cantidad)as total 
FROM casillas_empresas ce
inner join racks_casillas as rc on ce.rc_id=rc.rc_id
inner join racks as r on rc.rack_id = r.rack_id
inner join kardex k on k.rc_id = rc.rc_id

where ce.id = 14 
and k.deleted_at IS NULL group by rc.rc_id, ce.id ;



select rc_id, sum(kard_cantidad)as total from kardex 
where rc_id = 20 and deleted_at is null;
 
-- update kardex set kard_cantidad = (kard_cantidad*-1) where tipo_movimiento='DESPACHO'


-- VALIDAR STOCK DE PRODUCTOS POR RACKS sku--     
select rc.rc_id, k.prod_id,pe.prod_sku, r.rack_nombre,rc.rc_nombre, sum(kard_cantidad)as total 
FROM casillas_empresas ce
inner join racks_casillas as rc on ce.rc_id=rc.rc_id
inner join racks as r on rc.rack_id = r.rack_id
inner join kardex k on k.rc_id = rc.rc_id
inner join productos_x_empresa pe on pe.prod_id= k.prod_id

where pe.prod_sku = 'EADC28CL'
and k.deleted_at IS NULL group by rc.rc_id,k.prod_id;

-- BUSCAR PROD_SKU
select * from productos_x_empresa where prod_stock =0;

-- BUSCAR PROD_ID
select * from kardex where prod_id = '100';


--  MOSTRAR CASILLAS POR EMPRESAS
select * from casillas_empresas where empr_id = '21';
     
select e.empr_id, e.empr_nombre, a.tipo_movimiento_codigo, a.created_at from empresas e
inner join actas a on a.empr_id = e.empr_id;


-- MOSTRAR DETALLE KARDEX DE ACTA_ID --

select a.acta_id, a.empr_id,k.kard_id,k.prod_id,p.prod_sku, p.prod_nombre, k.rc_id, k.kard_cantidad from actas a 
inner join kardex k on a.acta_id = k.acta_id
inner join productos_x_empresa p on k.prod_id = p.prod_id
where a.acta_id = 102;


 
-- VALIDACION PARA CAMBIAR SIGNO NEGATIVO A DESPACHO--- 

-- UPDATE  kardexxx--
-- SET     kard_cantidad = IF(DELTE_tipo_movimiento = 'DESPACHO', kard_cantidad*-1, kard_cantidad)
-- WHERE   kard_cantidad > 0;

-- UPDATE actas set tm_codigo = 'RECEPCION' WHERE tm_codigo = 'INGRESO';



 
SELECT p.prod_id,p.prod_nombre, k.kard_cantidad, k.rc_id, k.deleted_at FROM productos_x_empresa p 
left join kardex k on p.prod_id = k.prod_id
where p.prod_id = 100;



-- VERIFICACION DE DE STOCK  SUM(karde) == producto.producto_stock --
select p.prod_id, p.prod_nombre, k.prod_id, p.prod_stock,sum(kard_cantidad)as total_kardex
FROM productos_x_empresa p
inner join kardex k on p.prod_id= k.prod_id

where k.deleted_at IS NULL group by p.prod_id;


-- BUSCAR LAS CASILLAS DE LAS RECEPCIONES POR EMPRESA
SELECT k.rc_id , e.empr_id, e.empr_nombre,  CONCAT(r.rack_nombre,' - ', rc.rc_nombre) as casilla FROM almagri.empresas e
left join actas a on a.empr_id = e.empr_id
left join kardex k on a.acta_id = k.acta_id
left join racks_casillas rc on k.rc_id= rc.rc_id
left join racks  r on r.rack_id= rc.rack_id
where e.deleted_at is null and a.deleted_at is null and k.rc_id  is not null
group by e.empr_id, e.empr_nombre, k.rc_id
order by rc_id, empr_nombre;



-- PRODUCTOS CON 1 SOLA casillas_empresas
select p.empr_id, p.prod_id, count(k.rc_id) as nro_casillas, sum(k.kard_cantidad) as total from productos_x_empresa p
left join kardex k on p.prod_id = k.prod_id
where p.deleted_at is null and k.deleted_at is null
 
group by p.empr_id, p.prod_id,k.rc_id
having count(k.rc_id)=1;


-- ACTUALIZAR LA LISTA SALIDAS CASILLA_ID(rc_id)
select   p.empr_id, p.prod_id, k.rc_id, count(k.rc_id) as nro_casillas, sum(k.kard_cantidad) as total_stock, 
(select sum(ks.kard_cantidad)  from kardex ks 
where ks.prod_id = k.prod_id and ks.deleted_at is null and ks.kard_cantidad > 0 ) as total_entradas,
 
(select sum(ks.kard_cantidad) as total_salida from kardex ks 
where ks.prod_id = k.prod_id and ks.deleted_at is null and ks.kard_cantidad < 0 ) as total_salida


from productos_x_empresa p
left join kardex k on p.prod_id = k.prod_id
left join actas a on a.acta_id= k.acta_id
where p.deleted_at is null and k.deleted_at is null and a.deleted_at is null
 
group by p.empr_id, p.prod_id,k.rc_id
having count(k.rc_id)=1;


 
-- ULTIMA VALIDACION PARA LA ACTUALIZACION RC_ID DE  RACK  CONSULTA LAS ENTRADAS > 0 ALMACENADAS EN 1 SOLA CASILLA--
select  k.prod_id, count( distinct k.rc_id)as nro_casillas,
	(select rc_id  from kardex where prod_id = k.prod_id and kard_cantidad>0 and deleted_at is null group by  rc_id) as casilla
from kardex k 
  where k.rc_id is not null and  k.deleted_at is null and k.kard_cantidad >0
group by k.prod_id  having nro_casillas=1;


-- LISTA DE LAS SALIDAS CON PRODUCTOS EN MAS D E1 CASILLA
SELECT a.acta_id, e.empr_nombre, count(k.kard_id) as items, a.created_at
FROM almagri.empresas e
left join actas a on a.empr_id = e.empr_id
left join kardex k on a.acta_id = k.acta_id
 where k.rc_id is null and e.deleted_at is null and a.deleted_at is null and k.rc_id is null  
group by a.acta_id, e.empr_nombre having items >0 order by items desc;

-- DETALLE DEL ACTA_ID
SELECT k.kard_id,k.rc_id, k.prod_id, p.prod_nombre, k.deleted_at, k.updated_at
FROM kardex k
left join productos_x_empresa p  on p.prod_id = k.prod_id
where k.acta_id = 160;


 




