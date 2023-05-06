insert into convenio (nome,cnpj,numero_convenio)
    values
		('Allianz','21722371000157','10020'),
		('Porto Seguro','86416964000130','20010'),
		('Notre Dame','45883331000155','30020'),
		('Azul','74315806000105','40010');
    
insert into tipo_quarto (descricao,valor_diaria)
	values
		('Apartamento','250.00'),
        ('Quarto duplo','90.00'),
        ('Enfermaria','60.00');
        
insert into quarto (numero_quarto,tipo_quarto_id_tipo_quarto)
	values
		('100',1),
		('101',2),
		('102',3);
        
insert into especialidade (especialidade)
	values
		('Clínico Geral'),
		('Pediatria'),
		('Gastroenterologia'),
		('Cardiologia'),
		('Dermatologia'),
		('Oncologia'),
		('Ortopedia');
        
insert into medicos (nome,crm)
	values
		('Júlia Camarinho','124511'),
		('Alisson Sacramento','321511'),
		('Alberto Veríssimo','951811'),
		('Suéli Simão Pegado','125411'),
		('Gael Milheiro Lemes','224411'),
		('Tito Carqueijeiro','578111'),
		('Ezequiel Pestana Henriques','338951'),
		('Anny Quintanilha','117812'),
		('Lívia Veloso','587978'),
		('Nelson Anjos Palmeira','983211');
        
insert into medico_especialidade (medicos_id,especialidade_id_especialidade)
	values
		(1,1),
        (2,7),
        (3,3),
        (4,5),
        (5,1),
        (6,2),
        (7,4),
        (8,6),
        (9,2),
        (10,7);    
        
insert into pacientes (nome,data_nascimento,endereco,telefone,email,cpf,rg,convenios_id)
    values
		('Luan Giovanni Cardoso','1990-10-24','Rua Flores, 45','(11)9458-5632','luan.giovanni.cardoso@vitalliimoveis.com','473.772.865-98','13.554.374-5',1),
        ('Zilda Gomide Osório','1955-01-02','Rua Barra do Tarrachil, 74','(11)9658-7416','zildagosorio@gmail.com','584.943.763-06','14.397.099-9',1),
        ('Ester Ayla Luna Souza','1989-11-04','Rua Marcassita, 553','(11)98321-8388','ester_ayla_souza@santarte.com','124.165.645-28','29.756.454-7',2),
        ('Benjamin Geraldo Rodrigo da Paz','1974-03-15','Rua Angra dos Reis, 234','(11)99164-8831','benjamin_geraldo_dapaz@caocarinho.com.br','516.711.833-63','45.694.046-7',4),
        ('Alexandre Vicente Bernardo Dias','2004-07-03','Avenida Pinheiro Machado, 1050','(11)98690-7840','alexandrevicentedias@genesyslab.com','298.899.453-63','25.803.095-1',2),
        ('Isabella Luzia Aurora Rocha','1957-04-26','Rua Chácara dos Poderes, 500','(11)8351-7836','isabella.l.rocha@kantoferramentaria.com.br','809.570.912-30','18.327.561-5',3),
        ('Rosa Rafaela Nogueira','1960-12-25','Rua Reverendo Almir Pereira Bahia, 17','(13)99758-0441','rosa_rafaela_nogueira@psq.med.br','204.082.643-22','10.425.157-8',1),
        ('Camila Letícia Márcia da Mata','1993-01-19','Rua Leonildo Stecca, 20','(11)99217-8139','camila.leticia.damata@whgames.com.br','219.915.411-47','34.423.529-4',4),
        ('Noah Marcelo Ryan Castro','1980-10-26','Rua 101, 54','(11)99351-1361','noah_marcelo_castro@jmmarcenaria.com.br','457.615.506-79','11.905.525-9',2),
        ('Carolina Manuela Melo','1995-02-14','Passagem Santa Rita, 556','(11)9996-29861','carolina-melo93@portoweb.com.br','760.647.236-02','23.268.548-4',4);
        
 insert into consultas (medicos_id,especialidade_id_especialidade,pacientes_id,data_hora)
	values
		(1,1,1,'2019-12-01 07:50:50'),
        (2,7,9,'2017-06-05 15:30:12'),
        (3,3,7,'2020-09-02 14:02:54'),
        (4,5,5,'2022-11-16 08:46:10'),
        (5,1,4,'2018-06-24 09:37:05'),
        (6,2,8,'2018-06-19 10:30:15'),
        (7,4,2,'2022-05-15 11:25:47'),
        (8,6,6,'2019-04-08 11:30:39'),
        (9,3,7,'2020-05-09 14:40:26'),
        (10,7,8,'2022-01-02 15:02:24');       
        
insert into receitas (medicamento_qtde,consultas_id)
	values
		('Dipirona 1x ao dia',1),
        ('Paracetamol 3x ao dia',7),
        ('Aspirina 1x ao dia',2),
        ('Azitromicina 1x ao dia',3),
        ('Fluoxetina 1x ao dia',4),
        ('Ibuprofeno 1x ao dia',5),
        ('Captopril 2x ao dia e Dipirona 1x ao dia',6),
        ('Paracetamol 2x ao dia e Aspirina 1x ao dia',9);
        
insert into enfermeiro (nome,cpf,cre)
	values
		('Jennifer Andrea da Luz','239.639.016-32','128411'),
        ('Yuri Elias Theo Pires','581.781.289-42','218711'),
        ('Joaquim Roberto Lopes','245.282.648-03','598711'),
        ('Marcos João Pereira','417.107.793-14','517811'),
        ('Bryan Murilo Viana','043.408.968-02','657811'),
        ('João Siqueira de Andrade','390.150.620.02','314911');
        
insert into enfermeiro_internacao (enfermeiro_id_enfermeiro,internacao_id_internacao)
	values
		(2,1),
        (4,2),
        (1,3),
        (4,4),
        (3,5),
        (5,6),
        (7,7);        
        
insert into internacao (quarto_id_quarto,pacientes_id,data_entrada,procedimento,data_prev_alta,data_alta)     
	values
		(3,1,'2022-11-30','Cirurgia','2022-12-10','2022-12-08'),
		(2,4,'2018-01-20','Cirurgia','2018-01-25','2018-01-25'),
		(3,5,'2019-07-15','Cirurgia','2019-07-22','2019-07-21'),
		(1,1,'2021-04-05','Cirurgia','2021-04-08','2021-04-08'),
		(1,4,'2020-06-06','Cirurgia','2020-06-10','2020-06-09'),
		(3,8,'2022-09-10','Cirurgia','2022-09-18','2022-09-18'),
		(2,2,'2017-05-08','Cirurgia','2017-05-14','2017-05-14');
            
alter table consultas add column valor_consultas real;
update consultas set valor_consultas = '250.00' where id=1;
update consultas set valor_consultas = '150.00' where id=2;
update consultas set valor_consultas = '170.00' where id=3;
update consultas set valor_consultas = '100.00' where id=4;
update consultas set valor_consultas = '230.00' where id=5;
update consultas set valor_consultas = '250.00' where id=6;
update consultas set valor_consultas = '230.00' where id=7;
update consultas set valor_consultas = '240.00' where id=8;
update consultas set valor_consultas = '140.00' where id=9;
update consultas set valor_consultas = '140.00' where id=10;

update consultas set convenio_id =1  where id=1;
update consultas set convenio_id =1  where id=2;
update consultas set convenio_id =null where id=3;
update consultas set convenio_id =null where id=4;
update consultas set convenio_id =2 where id=5;
update consultas set convenio_id =3  where id=6;
update consultas set convenio_id =1  where id=7;
update consultas set convenio_id =null  where id=8;
update consultas set convenio_id =null  where id=9;
update consultas set convenio_id =null  where id=10; 

alter table consultas add column receitas_id int;
alter table consultas add constraint fk_receitas foreign key (receitas_id) references receitas (id) ;


 