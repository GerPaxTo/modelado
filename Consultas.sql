select * from modelado.grupos;

select * from modelado.marcas;

Select modelado.marcas.id_marca, modelado.marcas.marca, modelado.grupos.id_grupo, modelado.grupos.grupo From 
modelado.marcas inner join modelado.grupos on modelado.marcas.id_grupo = modelado.grupos.id_grupo;

select * from modelado.monedas;

select * from modelado.aseguradoras;

select * from modelado.colores;

select modelado.modelos.id_modelo, modelado.modelos.id_marca, modelado.modelos.modelo, modelado.marcas.marca, modelado.grupos.grupo
from modelado.modelos, modelado.marcas, modelado.grupos
where modelado.modelos.id_marca = modelado.marcas.id_marca and modelado.marcas.id_grupo = modelado.grupos.id_grupo;

select modelado.autos.* from modelado.autos;

select modelado.autos.id_auto, modelado.modelos.modelo, modelado.marcas.marca, modelado.grupos.grupo, 
modelado.autos.matricula, modelado.colores.color, modelado.autos.dt_compra, 
modelado.autos.costo, modelado.autos.id_moneda
from modelado.autos, modelado.modelos, modelado.colores, modelado.marcas, modelado.grupos
where modelado.autos.id_modelo = modelado.modelos.id_modelo
and modelado.autos.id_color = modelado.colores.id_color
and modelado.autos.id_color = modelado.colores.id_color
and modelado.modelos.id_marca = modelado.marcas.id_marca
and modelado.marcas.id_grupo = modelado.grupos.id_grupo;

select modelado.polizas.* from modelado.polizas;

select modelado.polizas.id_poliza, modelado.polizas.id_auto, modelado.modelos.modelo, modelado.marcas.marca, 
modelado.grupos.grupo, modelado.autos.matricula, modelado.autos.dt_compra, modelado.autos.tot_kms, modelado.aseguradoras.aseguradora
from modelado.polizas inner join modelado.autos on modelado.polizas.id_auto = modelado.autos.id_auto
inner join modelado.modelos on modelado.autos.id_modelo = modelado.modelos.id_modelo
inner join modelado.marcas on modelado.modelos.id_marca = modelado.marcas.id_marca
inner join modelado.grupos on modelado.marcas.id_grupo = modelado.grupos.id_grupo
inner join modelado.aseguradoras on modelado.polizas.id_aseguradora = modelado.aseguradoras.id_aseguradora
where modelado.autos.dt_baja = '4000-01-01'; -- poner esta línea como comentario para ver todos los autos

select modelado.servicios.* from modelado.servicios;

select modelado.servicios.id_servicio, modelado.servicios.id_poliza, --modelado.polizas.id_auto, modelado.autos.id_modelo,
modelado.modelos.modelo, 
modelado.servicios.dt_ingreso, modelado.servicios.dt_salida, modelado.servicios.costo, modelado.servicios.kms_entrada 
from modelado.servicios inner join modelado.polizas on modelado.servicios.id_poliza = modelado.polizas.id_poliza
inner join modelado.autos on modelado.polizas.id_auto = modelado.autos.id_auto
inner join modelado.modelos on modelado.autos.id_modelo = modelado.modelos.id_modelo


