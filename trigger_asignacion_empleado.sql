CREATE OR ALTER TRIGGER asignacion_de_empleado on Asignacion for insert, update as
BEGIN 

	DECLARE @cantidadAsignacionesAnteriores as bigint;
	DECLARE last_inserted CURSOR FOR
		SELECT Fecha, Legajo, NroCaja, NroLocal, IdTurno FROM inserted;
	DECLARE @Fecha as date;
	DECLARE @Legajo as int;
	DECLARE @NroCaja as tinyint;
	DECLARE @NroLocal as tinyint;
	DECLARE @IdTurno as char(1);

	OPEN last_inserted;
	FETCH NEXT FROM last_inserted INTO @Fecha, @Legajo, @NroCaja, @NroLocal, @IdTurno;

	WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @cantidadAsignacionesAnteriores = (
			select count(*) from Asignacion 
				where (Fecha between (select dateadd(DD, -6, @Fecha)) AND @Fecha) AND
				Legajo = @Legajo
		);
		IF @cantidadAsignacionesAnteriores > 6
		BEGIN
			PRINT 'El empleado con legajo ' + CONVERT(varchar(10), @Legajo)  + ' ya tiene 6 asignaciones previas';
			ROLLBACK;
		END
		FETCH NEXT FROM last_inserted INTO @Fecha, @Legajo, @NroCaja, @NroLocal, @IdTurno;
	END;
	CLOSE last_inserted;
	DEALLOCATE last_inserted;
END;