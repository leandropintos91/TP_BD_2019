create or alter view asignaciones_por_empleado
as
select pe.Legajo as Legajo, min(MONTH(a.Fecha)) as mes, min(YEAR(a.Fecha)) as anio, count(*) as cantidad from Asignacion as a
inner join Personal as pe on a.Legajo = pe.Legajo
group by pe.Legajo, MONTH(a.Fecha), YEAR(a.Fecha);

go;

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

where pe.Legajo in (
	select ca.Legajo from asignaciones_por_empleado as ca where ca.cantidad = (
		select min(cantidad) from asignaciones_por_empleado as ca where ca.mes = @mes and ca.anio = @anio
		)
		and ca.mes = @mes and ca.anio = @anio
	)
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

create or alter view suma_ventas_empleado_por_mes
as
select pe.Legajo as legajo, MIN(YEAR(v.fecha)) as anio, min(MONTH(v.fecha)) as mes, SUM(v.montoTotal) as sumatoria from Personal as pe
inner join Asignacion as a on
pe.Legajo = a.Legajo
inner join Venta as v on
a.IdTurno = v.IdTurno and
a.NroCaja = v.NroCaja and
a.NroLocal = v.NroLocal and
a.Fecha = v.fecha
group by pe.Legajo, YEAR(v.fecha), MONTH(v.fecha);

go;

create or alter procedure empleados_mayores_ventas_alternativa(@anio int, @mes int)
AS
BEGIN
select * from Personal as pe
where pe.Legajo = (
		select ca.Legajo from asignaciones_por_empleado as ca where ca.cantidad = (
			select min(cantidad) from asignaciones_por_empleado as ca where ca.mes = @mes and ca.anio = @anio
			)
			and ca.mes = @mes and ca.anio = @anio
	)
	and
	pe.Legajo = (
		select suma.Legajo from suma_ventas_empleado_por_mes as suma 
		where suma.sumatoria = (
			select max(suma.sumatoria) from suma_ventas_empleado_por_mes as suma where suma.mes = @mes and suma.anio = @anio
		)
	)
END

go;

-- exec empleados_mayores_ventas_alternativa @anio = 2019, @mes = 9;