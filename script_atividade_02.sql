create database hospital_db_edward;

use hospital_db_edward;

create table medicos
(
	id int not null auto_increment primary key,
    nome varchar (45),
    crm int
);

create table especialidade
(
	id_especialidade int not null auto_increment primary key,
    especialidade varchar (45)
);

create table medico_especialidade
(
	id int not null auto_increment primary key,
    medicos_id int,
    especialidade_id_especialidade int,
    foreign key (medicos_id) references medicos (id),
    foreign key (especialidade_id_especialidade) references especialidade (id_especialidade)
); 

create table convenio
(
	id int not null auto_increment primary key,
    nome varchar (45) not null,
    cnpj int not null,
    tempo_carencia date not null,
    numero_convenio int not null
);

create table pacientes
(
	id int not null auto_increment primary key,
	nome varchar (45) not null,
    data_nascimento date not null,
    endereco varchar (45) not null,
    telefone int not null,
    email varchar (45) not null,
    cpf int not null,
    rg int not null,
    convenios_id int,
    foreign key (convenios_id) references convenio (id)
);

create table consultas
(
	id int not null auto_increment primary key,
    data_hora datetime not null,
    medico_responsavel varchar (45) not null,
    pacientes_id int,
    convenio_id int,
    especialidade_id_especialidade int,
    medicos_id int,
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

create table enfermeiro
(
	id_enfermeiro int not null auto_increment primary key,
    nome varchar (45) not null,
    cpf int not null,
    cre int not null
);

create table internacao
(
	id_internacao int not null auto_increment primary key,
    data_entrada date not null,
    data_prev_alta date,
    data_alta date not null,
    procedimento varchar (45) not null,
    quarto_id_quarto int,
    medicos_id int,
    pacientes_id int,
    foreign key (quarto_id_quarto) references quarto (id_quarto),
    foreign key (medicos_id) references medicos (id),
    foreign key (pacientes_id) references pacientes (id)
);

create table enfermeiro_internacao
(
	enfermeiro_id_enfermeiro int,
    internacao_id_internacao int
);