/* Atualização da tabela de consultas devido a não ter a coluna de valores */
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

/* Todos os dados e o valor médio das consultas do ano de 2020 realizadas SEM convênio; */
		/*Update com a data para a consulta seguinte*/
        update consultas set data_hora='2020-12-20 07:50:32' where id=2;
        
	select *, round((select avg (valor_consultas) from consultas where year (data_hora)= '2020'and convenio_id is null),2) as media from consultas where year(data_hora) = '2020' and convenio_id is null;	 

/* Todos os dados e o valor médio das consultas do ano de 2020 realizadas POR convênio; */

	select *, round((select avg (valor_consultas) from consultas where year (data_hora)= '2020'and convenio_id is not null),2) as media from consultas where year(data_hora) = '2020'and convenio_id is not null;

/* Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta. */

	select * from internacao where data_alta > data_prev_alta;

/* Receituário completo da primeira consulta registrada com receituário associado. */

	select * from receitas where consultas_id = (select min(consultas_id) from receitas);

/* Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio). */

	select * from consultas where convenio_id is null and valor_consultas= (select min(valor_consultas) from consultas where convenio_id is null) 
	or convenio_id is null and valor_consultas= (select max(valor_consultas) from consultas where convenio_id is null);

/* Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta. */

	select internacao.*, datediff(internacao.data_alta,internacao.data_entrada) as qtde_dias, 
	(datediff(internacao.data_alta,internacao.data_entrada)* tipo_quarto.valor_diaria) as valor_total
	from internacao join quarto
	on internacao.quarto_id_quarto=quarto.id_quarto
	join tipo_quarto on quarto.tipo_quarto_id_tipo_quarto=tipo_quarto.id_tipo_quarto;
    
/* Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”. */

    select internacao.data_entrada,internacao.data_prev_alta,internacao.data_alta,internacao.procedimento,quarto.numero_quarto
	from internacao join quarto on internacao.quarto_id_quarto=quarto.id_quarto and quarto.tipo_quarto_id_tipo_quarto=1;
    
/* Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.*/
			
            /*Update de pacientes para que tenham menos de 18 anos*/
            update pacientes set data_nascimento= '2010-05-16' WHERE ID= 5;
			update pacientes set data_nascimento= '2005-10-26' WHERE ID= 10;
    
    select pacientes.nome,consultas.data_hora,especialidade.especialidade, timestampdiff(YEAR,pacientes.data_nascimento,consultas.data_hora) as idade
	from pacientes join consultas on consultas.pacientes_id=pacientes.id
	join especialidade on consultas.especialidade_id_especialidade=especialidade.id_especialidade
	where ((timestampdiff(YEAR,pacientes.data_nascimento,consultas.data_hora) < 18) AND (especialidade.id_especialidade<>2))
	order by data_hora;
    
    
/* Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”. */    
			
            /*Adicionei a coluna medicos_id em internacao e povoei pois não havia feito anteriormente*/
			alter table internacao add column medicos_id int;
			alter table internacao add constraint fk_medicos foreign key (medicos_id) references medicos (id);
			update internacao set medicos_id=2 where id_internacao=29;
			update internacao set medicos_id=7 where id_internacao=30;
			update internacao set medicos_id=4 where id_internacao=31;
			update internacao set medicos_id=1 where id_internacao=32;
			update internacao set medicos_id=5 where id_internacao=33;
			update internacao set medicos_id=3 where id_internacao=34;
			update internacao set medicos_id=3 where id_internacao=35;
			
    select pacientes.nome as pacientes, medicos.nome as medicos, internacao.data_entrada as data_internacao ,internacao.procedimento as procedimento
	from internacao join pacientes on internacao.pacientes_id=pacientes.id
	join medicos on internacao.medicos_id=medicos.id
	join medico_especialidade on medicos.id=medico_especialidade.medicos_id
	where (medico_especialidade.id=3 and internacao.quarto_id_quarto=3);

/* Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou. */

	select medicos.nome, medicos.crm, count(consultas.medicos_id) as consultas_realizadas
	from medicos left join consultas on consultas.medicos_id=medicos.id
	group by medicos.id;
    
 /* Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação. */   
			/* Realizado update da tabela enfermeiro_internacao pois estava vazia*/
            update enfermeiro_internacao set enfermeiro_id_enfermeiro=2 where internacao_id_internacao=1;
            update enfermeiro_internacao set enfermeiro_id_enfermeiro=4 where internacao_id_internacao=2;
            update enfermeiro_internacao set enfermeiro_id_enfermeiro=1 where internacao_id_internacao=3;
            update enfermeiro_internacao set enfermeiro_id_enfermeiro=4 where internacao_id_internacao=4;
            update enfermeiro_internacao set enfermeiro_id_enfermeiro=3 where internacao_id_internacao=5;
            update enfermeiro_internacao set enfermeiro_id_enfermeiro=5 where internacao_id_internacao=6;
            update enfermeiro_internacao set enfermeiro_id_enfermeiro=6 where internacao_id_internacao=7;
            
    select enfermeiro.nome, enfermeiro.cre, count(enfermeiro_internacao.enfermeiro_id_enfermeiro) as internacoes
	from enfermeiro join enfermeiro_internacao on enfermeiro.id_enfermeiro=enfermeiro_internacao.enfermeiro_id_enfermeiro
	where ((select count(enfermeiro_internacao.id) from enfermeiro_internacao where internacao_id_internacao )>1)
	group by enfermeiro.id_enfermeiro having count(*) > 1 order by internacoes;
    
/* Lista de medicos e a quantidade de consultas realizadas*/
    
    select medicos.nome as medico, medicos.crm as crm, count(consultas.medicos_id) as consultas_realizadas 
    from medicos join consultas on medicos.id=consultas.medicos_id group by medicos.id;
    

  
 

