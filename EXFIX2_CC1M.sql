create schema EXFIX2_CC1M;

use EXFIX2_CC1M;

create table if not exists grupos(
grupo_id int primary key,
grupo_nome varchar(100) not null,
grupo_desc text not null
);

create table if not exists usuarios(
usuario_id int primary key,
usuario_nome varchar(100) not null,
usuario_sobrenome varchar(100) not null,
usuario_email varchar(20)
);

create table if not exists postagens(
post_id int primary key,
post_texto text,
post_img blob,
post_datahora datetime not null,
post_usuario int not null,
constraint fk_usuarios foreign key(post_usuario)
references usuarios(usuario_id)
);

create table if not exists comentarios(
coment_id int primary key,
coment_texto text not null,
coment_datahora datetime not null,
coment_usuario int not null,
coment_post int not null,
constraint coment_fk_usuarios foreign key(coment_usuario)
references usuarios(usuario_id),
constraint fk_postagens foreign key(coment_post)
references postagens(post_id)
);

create table if not exists usuarios_grupos(
usgr_usuario int not null,
usgr_grupo int not null,
primary key(usgr_usuario, usgr_grupo),
constraint usgr_fk_usuarios foreign key(usgr_usuario)
references usuarios(usuario_id),
constraint usgr_fk_grupos foreign key(usgr_grupo)
references grupos(grupo_id)
);

create table if not exists seguidores_usuarios(
sgus_usuario int not null,
sgus_seguidor int not null,
primary key(sgus_usuario, sgus_seguidor),
constraint sgus_fk_usuarios foreign key(sgus_usuario)
references usuarios(usuario_id),
constraint segus_fk_usuarios foreign key(sgus_seguidor)
references usuarios(usuario_id)
);










