CREATE TABLE public.dim_aluno(
	"ID_aluno" varchar(12) NOT NULL,
	"Nome" varchar(45),
	"Idade" varchar(45),
	CONSTRAINT pk_aluno PRIMARY KEY ("ID_aluno")
);


CREATE TABLE public.dim_curso(
	"ID_curso" varchar(12) NOT NULL,
	"Descricao" varchar(45),
	CONSTRAINT pk_curso PRIMARY KEY ("ID_curso")
);


CREATE TABLE public.dim_tempo(
	"ID_tempo" varchar(12) NOT NULL,
	"Semestre" varchar(12),
	"Ano" varchar(4),
	CONSTRAINT pk_tempo PRIMARY KEY ("ID_tempo")
);



CREATE TABLE public.dim_disciplina(
	"ID_disciplina" varchar(12) NOT NULL,
	"Descricao" varchar(12),
	CONSTRAINT pk_diciplina PRIMARY KEY ("ID_disciplina")
);


CREATE TABLE public.fato_aulas(
	"Quant_aprovados" varchar(45),
	"Quant_reprovados" varchar(45),
	"Quant_alunos_curso" varchar(45),
	"Quant_disc_curso" varchar(45),
	"ID_aluno" varchar(12) NOT NULL REFERENCES public.dim_aluno("ID_aluno"),
	"ID_curso" varchar(12) NOT NULL REFERENCES public.dim_curso("ID_curso"),
	"ID_tempo" varchar(12) NOT NULL REFERENCES public.dim_tempo ("ID_tempo"),
	"ID_disciplina" varchar(12) NOT NULL REFERENCES public.dim_disciplina("ID_disciplina")
	
);
