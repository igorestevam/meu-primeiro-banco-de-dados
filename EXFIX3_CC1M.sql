create schema EXEFIX3_CC1M;

use EXEFIX3_CC1M;

create table if not exists espectadores(
espec_id int primary key,
espec_telefone varchar(20),
espec_email varchar(50) not null,
espec_nome varchar(100) not null,
espec_datanasc date not null
);

create table if not exists filmes(
filme_id int primary key,
filme_nome varchar(100) not null,
filme_distribuidor varchar(100) not null,
filme_tempo int not null,
filme_diretor varchar(50) not null
);

create table if not exists salas(
sala_id int primary key,
sala_nome varchar(50) not null,
sala_capac int not null
);

create table if not exists sessoes(
sessao_id int primary key,
sessao_filme int not null,
sessao_sala int not null,
constraint fk_filmes foreign key(sessao_filme)
references filmes(filme_id),
constraint fk_salas foreign key(sessao_sala)
references salas(sala_id)
);

create table if not exists ingressos(
ingresso_id int primary key,
ingresso_data date not null,
ingresso_hora time not null,
ingresso_sessao int not null,
ingresso_espec int not null,
constraint fk_sessao foreign key(ingresso_sessao)
references sessoes(sessao_id),
constraint fk_espectadores foreign key(ingresso_espec)
references espectadores(espec_id)
);