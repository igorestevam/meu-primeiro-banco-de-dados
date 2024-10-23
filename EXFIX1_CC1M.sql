create schema EXFIX1_CC1M;

use EXFIX1_CC1M;

create table if not exists participantes(
part_numinsc int not null,
part_cpf varchar(20),
part_nome varchar(100) not null,
part_datanasc date not null,
part_empresa varchar(100),
primary key (part_numinsc, part_cpf)
);

create table if not exists eventos (
evento_id int primary key,
evento_nome varchar(100) not null,
evento_data date not null,
evento_entidade varchar(100) not null,
evento_local int
);

create table if not exists locais(
local_id int primary key,
local_nome varchar(100) not null,
local_log varchar(100) not null,
local_numlog int,
local_bairro varchar(100) not null,
local_cidade varchar(100) not null,
local_uf char(2) not null,
local_cep varchar(20) not null,
local_capac int not null
);

create table if not exists atividades(
ativ_id int primary key,
ativ_nome varchar(100) not null,
ativ_data date not null,
ativ_hora time not null,
ativ_evento int not null,
constraint fk_evento foreign key(ativ_evento)
references eventos(evento_id)
);

create table if not exists participantes_evento(
ptev_inscricao int not null,
ptev_cpf varchar(20) not null,
ptev_evento int not null,
primary key(ptev_inscricao, ptev_cpf, ptev_evento),
constraint ptev_fk_participantes foreign key(ptev_inscricao, ptev_cpf)
references participantes(part_numinsc, part_cpf),
constraint ptev_fk_eventos foreign key(ptev_evento)
references eventos(evento_id)
);

create table if not exists participante_atividade(
ptat_inscricao int not null,
ptat_cpf varchar(20) not null,
ptat_atividade int not null,
primary key(ptat_inscricao, ptat_cpf, ptat_atividade),
constraint ptat_fk_participantes foreign key(ptat_inscricao, ptat_cpf)
references participantes(part_numinsc, part_cpf),
constraint ptat_fk_atividades foreign key(ptat_atividade)
references atividades(ativ_id)
);








