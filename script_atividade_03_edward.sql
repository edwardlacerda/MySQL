create database hospital_db_edwardlacerda;

use hospital_db_edwardlacerda;


create table convenio
(
	id int not null auto_increment primary key,
    nome varchar (45) not null,
    cnpj char (18) not null,
    numero_convenio int not null
);

create table tipo_quarto
(
	id_tipo_quarto int not null auto_increment primary key,
    descricao varchar (45),
    valor_diaria real
);

create table quarto
(
	id_quarto int not null auto_increment primary key,
    numero_quarto int not null,
    tipo_quarto_id_tipo_quarto int,
    foreign key (tipo_quarto_id_tipo_quarto) references tipo_quarto (id_tipo_quarto)
);

create table especialidade
(
	id_especialidade int not null auto_increment primary key,
    especialidade varchar (45)
);

create table medicos
(
	id int not null auto_increment primary key,
    nome varchar (45),
    crm varchar (10)
);

create table medico_especialidade
(
	id int not null auto_increment primary key,
    medicos_id int,
    especialidade_id_especialidade int,
    foreign key (medicos_id) references medicos (id),
    foreign key (especialidade_id_especialidade) references especialidade (id_especialidade)
); 

create table pacientes
(
	id int not null auto_increment primary key,
	nome varchar (50) not null,
    data_nascimento date not null,
    endereco varchar (50) not null,
    telefone char (14) not null,
    email varchar (50) not null,
    cpf char (14) not null,
    rg char (12) not null,
    convenios_id int,
    foreign key (convenios_id) references convenio (id)
);

create table consultas
(
	id int not null auto_increment primary key,
    data_hora datetime not null,
    pacientes_id int,
    convenio_id int,
    especialidade_id_especialidade int,
    medicos_id int,
    valor_consultas real,
    foreign key (pacientes_id) references pacientes (id),
    foreign key (convenio_id) references convenio (id),
    foreign key (especialidade_id_especialidade) references medico_especialidade (especialidade_id_especialidade),
    foreign key (medicos_id) references medicos (id)
);

  create table receitas
  (
	id int not null auto_increment primary key,
    medicamento_qtde varchar (45),
    consultas_id int,
    foreign key (consultas_id) references consultas (id)
  );
  
  create table enfermeiro
(
	id_enfermeiro int not null auto_increment primary key,
    nome varchar (50) not null,
    cpf char (14) not null,
    cre char (6) not null
);

create table enfermeiro_internacao
(
	enfermeiro_id_enfermeiro int,
	internacao_id_internacao int,
    foreign key (enfermeiro_id_enfermeiro) references enfermeiro (id_enfermeiro),
    foreign key (internacao_id_internacao) references internacao (id_internacao)
);

create table internacao
(
	id_internacao int not null auto_increment primary key,
    data_entrada date not null,
    data_prev_alta date,
    data_alta date not null,
    procedimento varchar (50) not null,
    quarto_id_quarto int,
    pacientes_id int,
    foreign key (quarto_id_quarto) references quarto (id_quarto),
    foreign key (pacientes_id) references pacientes (id)
);

