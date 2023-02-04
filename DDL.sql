create schema modelado authorization gerpax

-- Tabla de Grupos
create table modelado.grupos(
	id_grupo varchar(10) not null,
	grupo varchar(256) not null,
	description varchar(512) null
);
--pk 
alter table modelado.grupos
add constraint grupos_PK primary key(id_grupo);

-- Tabla de Marcas
create table modelado.marcas(
	id_marca varchar(10) not null,
	id_grupo varchar(10) not null,
	marca varchar(256) not null,
	description varchar(512) null
);
--pk 
alter table modelado.marcas
add constraint marcas_PK primary key(id_marca);
--FK
alter table modelado.marcas
add constraint marca_grupo_FK foreign key (id_grupo)
references modelado.grupos(id_grupo);

-- Tabla de Modelos
create table modelado.modelos(
	id_modelo varchar(10) not null,
	id_marca varchar(10) not null,
	modelo varchar(256) not null,
	description varchar(512) null
);
--pk 
alter table modelado.modelos
add constraint modelos_PK primary key(id_modelo);
--FK
alter table modelado.modelos
add constraint modelo_marca_FK foreign key (id_marca)
references modelado.marcas(id_marca);

-- Tabla de monedas
create table modelado.monedas(
	id_moneda varchar(10) not null,
	moneda varchar(256) not null
);
--pk 
alter table modelado.monedas
add constraint monedas_PK primary key(id_moneda);

-- Tabla de aseguradores
create table modelado.aseguradoras(
	id_aseguradora varchar(10) not null,
	aseguradora varchar(256) not null
);
--pk 
alter table modelado.aseguradoras
add constraint aseguradoras_PK primary key(id_aseguradora);

-- Tabla de colores
create table modelado.colores(
	id_color varchar(10) not null,
	color varchar(256) not null
);
--pk 
alter table modelado.colores
add constraint colores_PK primary key(id_color);

-- Tabla de Autos
create table modelado.autos(
	id_auto varchar(10) not null,
	id_modelo varchar(10) not null, --FK
	matricula varchar(50) null,
	dt_compra date not null,
	id_color varchar(10) not null,  --FK
	tot_kms varchar(10) not null,
	costo  float not null,
	id_moneda varchar(10) not null, -- FK
	dt_baja date not null default '4000-01-01'
);
--pk 
alter table modelado.autos
add constraint autos_PK primary key(id_auto);

alter table modelado.autos
add constraint auto_color_FK foreign key (id_color)
references modelado.colores(id_color);

alter table modelado.autos
add constraint auto_modelo_FK foreign key (id_modelo)
references modelado.modelos(id_modelo);

alter table modelado.autos
add constraint auto_moneda_FK foreign key (id_moneda)
references modelado.monedas(id_moneda);

-- Tabla de Pólizas
create table modelado.polizas(
	id_poliza varchar(50) not null,
	id_auto varchar(10) not null, -- FK
	dt_contrato date null,
	dt_fincontrato date null,
	costo  float not null,
	id_aseguradora varchar(10) not null, -- FK
	id_moneda varchar(10) not null -- FK
);
--pk 
alter table modelado.polizas
add constraint polizas_PK primary key(id_poliza);

alter table modelado.polizas
add constraint poliza_auto_FK foreign key (id_auto)
references modelado.autos(id_auto);

alter table modelado.polizas
add constraint poliza_aseguradora_FK foreign key (id_aseguradora)
references modelado.aseguradoras(id_aseguradora);

alter table modelado.polizas
add constraint poliza_moneda_FK foreign key (id_moneda)
references modelado.monedas(id_moneda);

-- Tabla de Servicios
create table modelado.servicios(
	id_servicio varchar(50) not null,
	id_poliza varchar(50) not null, -- FK
	dt_ingreso date null,
	dt_salida date null,
	costo  float not null,
	id_moneda varchar(10) not null, -- FK
	kms_entrada varchar(15) not null
);
--pk 
alter table modelado.servicios
add constraint servicios_PK primary key(id_servicio);

alter table modelado.servicios
add constraint servicio_poliza_FK foreign key (id_poliza)
references modelado.polizas(id_poliza);

alter table modelado.servicios
add constraint servicio_moneda_FK foreign key (id_moneda)
references modelado.monedas(id_moneda);





