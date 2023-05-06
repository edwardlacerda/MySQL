alter table medicos add em_atividade bit default (1);
 
update medicos set em_atividade = 0 WHERE id= 2 or id = 4;

update internacao set data_alta= data_entrada+3 where quarto_id_quarto = 1;

alter table consultas drop foreign key consultas_ibfk_2;

alter table consultas add foreign key (convenio_id) references convenio(id) on delete cascade;

update pacientes set convenios_id = not null where convenios_id= 4;

delete from convenio where id=4;