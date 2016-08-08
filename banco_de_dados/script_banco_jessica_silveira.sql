-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.8.0-alpha1
-- PostgreSQL version: 9.3
-- Project Site: pgmodeler.com.br
-- Model Author: ---

SET check_function_bodies = false;
-- ddl-end --


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: novo_banco_de_dados | type: DATABASE --
-- -- DROP DATABASE novo_banco_de_dados;
-- CREATE DATABASE novo_banco_de_dados
-- ;
-- -- ddl-end --
-- 

-- object: public."Jogador" | type: TABLE --
-- DROP TABLE public."Jogador";
CREATE TABLE public."Jogador"(
	email varchar(255) NOT NULL,
	nome varchar(30) NOT NULL,
	sobrenome varchar(255) NOT NULL,
	apelido varchar(16) NOT NULL,
	endereco varchar(255) NOT NULL,
	carteira money,
	CONSTRAINT pkjogador PRIMARY KEY (email)

);
-- ddl-end --
-- object: public.amigos | type: TABLE --
-- DROP TABLE public.amigos;
CREATE TABLE public.amigos(
	"email_Jogador" varchar(255),
	email_amigo varchar(255) NOT NULL
);
-- ddl-end --
-- object: public.biblioteca | type: TABLE --
-- DROP TABLE public.biblioteca;
CREATE TABLE public.biblioteca(
	serial_jogo varchar(25) NOT NULL,
	"email_Jogador" varchar(255),
	id_jogo_pc varchar(12),
	id_jogo_android varchar(12),
	CONSTRAINT pkbiblioteca PRIMARY KEY (serial_jogo)

);
-- ddl-end --
-- object: "Jogador_fk" | type: CONSTRAINT --
-- ALTER TABLE public.biblioteca DROP CONSTRAINT "Jogador_fk";
ALTER TABLE public.biblioteca ADD CONSTRAINT "Jogador_fk" FOREIGN KEY ("email_Jogador")
REFERENCES public."Jogador" (email) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: public.conquistas | type: TABLE --
-- DROP TABLE public.conquistas;
CREATE TABLE public.conquistas(
	titulo varchar(30) NOT NULL,
	descricao text NOT NULL,
	id_jogo_pc varchar(12),
	CONSTRAINT pkconquistas PRIMARY KEY (titulo)

);
-- ddl-end --
-- object: public.progresso | type: TABLE --
-- DROP TABLE public.progresso;
CREATE TABLE public.progresso(
	horas_jogadas time,
	dados text,
	data_salvamento date NOT NULL,
	serial_jogo_biblioteca varchar(25)
);
-- ddl-end --
-- object: biblioteca_fk | type: CONSTRAINT --
-- ALTER TABLE public.progresso DROP CONSTRAINT biblioteca_fk;
ALTER TABLE public.progresso ADD CONSTRAINT biblioteca_fk FOREIGN KEY (serial_jogo_biblioteca)
REFERENCES public.biblioteca (serial_jogo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: public.lista_pedidos | type: TABLE --
-- DROP TABLE public.lista_pedidos;
CREATE TABLE public.lista_pedidos(
	data date NOT NULL,
	situacao varchar(15) NOT NULL,
	id_pedido varchar(12) NOT NULL,
	serial_jogo varchar(25),
	"email_Jogador" varchar(255),
	id_jogo_android varchar(12),
	id_jogo_pc varchar(12),
	CONSTRAINT pkpedidos PRIMARY KEY (id_pedido),
	CONSTRAINT situacaocheck CHECK (situacao IN ('aprovado', 'cancelado', 'processando'))

);
-- ddl-end --
-- object: public.jogo_android | type: TABLE --
-- DROP TABLE public.jogo_android;
CREATE TABLE public.jogo_android(
	id varchar(12),
	preco money NOT NULL,
	nome varchar(50) NOT NULL,
	descricao text,
	data date NOT NULL,
	link_download varchar(255) NOT NULL,
	promocao bool NOT NULL,
	freemium bool NOT NULL,
	compatibilidade varchar(10) NOT NULL,
	CONSTRAINT pkjogo1 PRIMARY KEY (id)

);
-- ddl-end --
-- object: public.lista_desejos | type: TABLE --
-- DROP TABLE public.lista_desejos;
CREATE TABLE public.lista_desejos(
	"email_Jogador" varchar(255),
	id_jogo_android varchar(12),
	id_jogo_pc varchar(12)
);
-- ddl-end --
-- object: public.jogo_pc | type: TABLE --
-- DROP TABLE public.jogo_pc;
CREATE TABLE public.jogo_pc(
	id varchar(12),
	preco money NOT NULL,
	nome varchar(50) NOT NULL,
	descricao text,
	data date NOT NULL,
	link_download varchar(255) NOT NULL,
	promocao bool NOT NULL,
	caracteristicas text,
	tipo varchar(6) NOT NULL,
	requisitos_minimos text,
	CONSTRAINT pkjogo2 PRIMARY KEY (id)

);
-- ddl-end --
-- object: public.screenshots | type: TABLE --
-- DROP TABLE public.screenshots;
CREATE TABLE public.screenshots(
	url_imagem smallint NOT NULL,
	id_jogo_android varchar(12),
	id_jogo_pc varchar(12)
);
-- ddl-end --
-- object: public.categoria | type: TABLE --
-- DROP TABLE public.categoria;
CREATE TABLE public.categoria(
	categoria varchar(20) NOT NULL,
	id_jogo_pc varchar(12)
);
-- ddl-end --
-- object: jogo_android_fk | type: CONSTRAINT --
-- ALTER TABLE public.screenshots DROP CONSTRAINT jogo_android_fk;
ALTER TABLE public.screenshots ADD CONSTRAINT jogo_android_fk FOREIGN KEY (id_jogo_android)
REFERENCES public.jogo_android (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: jogo_pc_fk | type: CONSTRAINT --
-- ALTER TABLE public.screenshots DROP CONSTRAINT jogo_pc_fk;
ALTER TABLE public.screenshots ADD CONSTRAINT jogo_pc_fk FOREIGN KEY (id_jogo_pc)
REFERENCES public.jogo_pc (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: jogo_pc_fk | type: CONSTRAINT --
-- ALTER TABLE public.categoria DROP CONSTRAINT jogo_pc_fk;
ALTER TABLE public.categoria ADD CONSTRAINT jogo_pc_fk FOREIGN KEY (id_jogo_pc)
REFERENCES public.jogo_pc (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: "Jogador_fk" | type: CONSTRAINT --
-- ALTER TABLE public.lista_desejos DROP CONSTRAINT "Jogador_fk";
ALTER TABLE public.lista_desejos ADD CONSTRAINT "Jogador_fk" FOREIGN KEY ("email_Jogador")
REFERENCES public."Jogador" (email) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: jogo_android_fk | type: CONSTRAINT --
-- ALTER TABLE public.lista_desejos DROP CONSTRAINT jogo_android_fk;
ALTER TABLE public.lista_desejos ADD CONSTRAINT jogo_android_fk FOREIGN KEY (id_jogo_android)
REFERENCES public.jogo_android (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: jogo_pc_fk | type: CONSTRAINT --
-- ALTER TABLE public.lista_desejos DROP CONSTRAINT jogo_pc_fk;
ALTER TABLE public.lista_desejos ADD CONSTRAINT jogo_pc_fk FOREIGN KEY (id_jogo_pc)
REFERENCES public.jogo_pc (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: "Jogador_fk" | type: CONSTRAINT --
-- ALTER TABLE public.lista_pedidos DROP CONSTRAINT "Jogador_fk";
ALTER TABLE public.lista_pedidos ADD CONSTRAINT "Jogador_fk" FOREIGN KEY ("email_Jogador")
REFERENCES public."Jogador" (email) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: "Jogador_fk" | type: CONSTRAINT --
-- ALTER TABLE public.amigos DROP CONSTRAINT "Jogador_fk";
ALTER TABLE public.amigos ADD CONSTRAINT "Jogador_fk" FOREIGN KEY ("email_Jogador")
REFERENCES public."Jogador" (email) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: jogo_android_fk | type: CONSTRAINT --
-- ALTER TABLE public.lista_pedidos DROP CONSTRAINT jogo_android_fk;
ALTER TABLE public.lista_pedidos ADD CONSTRAINT jogo_android_fk FOREIGN KEY (id_jogo_android)
REFERENCES public.jogo_android (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: jogo_pc_fk | type: CONSTRAINT --
-- ALTER TABLE public.lista_pedidos DROP CONSTRAINT jogo_pc_fk;
ALTER TABLE public.lista_pedidos ADD CONSTRAINT jogo_pc_fk FOREIGN KEY (id_jogo_pc)
REFERENCES public.jogo_pc (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: jogo_pc_fk | type: CONSTRAINT --
-- ALTER TABLE public.biblioteca DROP CONSTRAINT jogo_pc_fk;
ALTER TABLE public.biblioteca ADD CONSTRAINT jogo_pc_fk FOREIGN KEY (id_jogo_pc)
REFERENCES public.jogo_pc (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: jogo_android_fk | type: CONSTRAINT --
-- ALTER TABLE public.biblioteca DROP CONSTRAINT jogo_android_fk;
ALTER TABLE public.biblioteca ADD CONSTRAINT jogo_android_fk FOREIGN KEY (id_jogo_android)
REFERENCES public.jogo_android (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: jogo_pc_fk | type: CONSTRAINT --
-- ALTER TABLE public.conquistas DROP CONSTRAINT jogo_pc_fk;
ALTER TABLE public.conquistas ADD CONSTRAINT jogo_pc_fk FOREIGN KEY (id_jogo_pc)
REFERENCES public.jogo_pc (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


-- object: fkamigo | type: CONSTRAINT --
-- ALTER TABLE public.amigos DROP CONSTRAINT fkamigo;
ALTER TABLE public.amigos ADD CONSTRAINT fkamigo FOREIGN KEY (email_amigo)
REFERENCES public."Jogador" (email) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --



