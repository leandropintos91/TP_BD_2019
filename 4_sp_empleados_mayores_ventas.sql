create or alter procedure empleados_mayores_ventas(@anio int, @mes int)
AS
BEGIN
select pe.*, pr.* from Asignacion as a
inner join 
	(select c.NroLocal as NroLocal, c.fecha as fecha, c.NroCaja as NroCaja, c.IdTurno as turno, c.montoTotal as montoTotal from Compra as c
	where c.montoTotal = 
		(select max(montoTotal) from Compra as c where MONTH(c.fecha) = @mes and YEAR(c.fecha) = @anio)) as comprasMayores on
	a.NroLocal = comprasMayores.NroLocal and
	a.Fecha = comprasMayores.fecha and
	a.NroCaja = comprasMayores.NroCaja and
	a.IdTurno = comprasMayores.turno

inner join Propio as pr on
	a.Legajo = pr.Legajo

inner join Personal as pe on
	pr.Legajo = pe.Legajo
END

-- exec empleados_mayores_ventas @anio = 2019, @mes = 10;




------------------------------------------------------------------------
------------------------------------------------------------------------
-- A PARTIR DE ACÁ ES SÓLO UNA ALTERNATIVA
------------------------------------------------------------------------
------------------------------------------------------------------------
GO;

create or alter view Venta as 
select c.IdCompra, min(c.NroLocal) as NroLocal, min(c.NroCaja) as NroCaja, min(c.IdTurno) as IdTurno, min(c.fecha) as fecha, sum(sla.precio * cll.Cantidad) * min(d.Porcentaje) as montoTotal  
from Compra as c -- falta agregar el descuento pero no sé cómo hacerlo.
left join Descuento as d on 
c.IdDescuento = d.IdDescuento
inner join Conlleva as cll on
c.IdCompra = cll.IdCompra
inner join SeLeAdjudica as sla on
cll.IdProducto = sla.IdProducto
inner join  ListaDePrecio as ldp on
sla.IdLista = ldp.IdListaPrecio
where c.fecha between ldp.FechaInicio and ldp.FechaFin
group by c.IdCompra;

GO;

create or alter procedure empleados_mayores_ventas_alternativa(@anio int, @mes int)
AS
BEGIN
select pe.*, pr.* from Asignacion as a
inner join 
	(select v.NroLocal as NroLocal, v.fecha as fecha, v.NroCaja as NroCaja, v.IdTurno as turno, v.montoTotal as montoTotal from Venta as v
	where v.montoTotal = 
		(select max(montoTotal) from Venta as v where MONTH(v.fecha) = @mes and YEAR(v.fecha) = @anio)) as ventasMayores on
	a.NroLocal = ventasMayores.NroLocal and
	a.Fecha = ventasMayores.fecha and
	a.NroCaja = ventasMayores.NroCaja and
	a.IdTurno = ventasMayores.turno

inner join Propio as pr on
	a.Legajo = pr.Legajo

inner join Personal as pe on
	pr.Legajo = pe.Legajo
END

go;

-- exec empleados_mayores_ventas_alternativa @anio = 2019, @mes = 10;