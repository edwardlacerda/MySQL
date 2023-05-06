select *, (select avg (valor_consultas) from consultas where year (data_hora) = '2020' and convenio_id is null) as media from consultas where year(data_hora) = '2020';

select *, (select avg (valor_consultas) from consultas where year (data_hora) = '2020' and convenio_id is not null) as media from consultas where year(data_hora) = '2020';

select * from internacao where data_prev_alta > data_alta ;

select * from receitas where consultas_id = (select min(consultas_id) from receitas);

select * from consultas where convenio_id is null and valor_consultas= (select min(valor_consultas) from consultas where convenio_id is null) 
or convenio_id is null and valor_consultas= (select max(valor_consultas) from consultas where convenio_id is null);




