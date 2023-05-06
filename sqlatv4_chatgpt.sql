-- Consulta 1: Todos os dados e valor médio das consultas do ano de 2020 realizadas SEM convênio
SELECT *
FROM consultas
WHERE YEAR(data_hora) = 2020 AND convenio_id = 0;

SELECT AVG(valor)
FROM consulta
WHERE YEAR(data) = 2020 AND convenio = 0;

-- Consulta 2: Todos os dados e valor médio das consultas do ano de 2020 realizadas POR convênio
SELECT *
FROM consulta
WHERE YEAR(data) = 2020 AND convenio = 1;

SELECT AVG(valor)
FROM consulta
WHERE YEAR(data) = 2020 AND convenio = 1;

-- Consulta 3: Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta
SELECT *
FROM internacao
WHERE data_alta > data_prevista_alta;

-- Consulta 4: Receituário completo da primeira consulta registrada com receituário associado
SELECT *
FROM consulta
INNER JOIN receituario ON consulta.id = receituario.id_consulta
ORDER BY consulta.data ASC
LIMIT 1;

-- Consulta 5: Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio)
SELECT *
FROM consulta
WHERE convenio = 0
ORDER BY valor DESC
LIMIT 1;

SELECT *
FROM consulta
WHERE convenio = 0
ORDER BY valor ASC
LIMIT 1;

-- Consulta 6: Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta
SELECT internacao.*, quarto.diaria, DATEDIFF(internacao.data_alta, internacao.data_entrada) AS dias_internado, (DATEDIFF(internacao.data_alta, internacao.data_entrada) + 1) * quarto.diaria AS valor_total
FROM internacao
INNER JOIN quarto ON internacao.id_quarto = quarto.id;

-- Consulta 7: Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”
SELECT internacao.data, internacao.procedimento, quarto.numero
FROM internacao
INNER JOIN quarto ON internacao.id_quarto = quarto.id
WHERE quarto.tipo = 'Apartamento';

-- Consulta 8: Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta
SELECT paciente.nome, consulta.data, consulta.especialidade
FROM paciente
INNER JOIN consulta ON paciente.id = consulta.id_paciente
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) < 18 AND especialidade != 'Pediatria'
ORDER BY consulta.data ASC;

-- Consulta 9: Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”
SELECT paciente.nome, medico.nome AS nome_medico, internacao.data, internacao.procedimento
FROM paciente
INNER JOIN internacao ON paciente.id = internacao.id_paciente
INNER JOIN medico ON internacao.id_medico = medico.id
WHERE medico.especialidade = 'Gastroenterologia' AND internacao.quarto = 'Enfermaria';

-- Consulta 10: Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou
SELECT medico.nome, medico.crm, COUNT(*) AS qtd_consultas
FROM medico
INNER JOIN consulta ON medico.id = consulta.id_medico
GROUP BY medico.id;

-- Consulta 11: Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação
SELECT enfermeiro.nome, enfermeiro.cre, COUNT(*) AS qtd_internacoes
FROM enfermeiro
INNER JOIN equipe_internacao ON enfermeiro.id = equipe_internacao.id_enfermeiro
GROUP BY enfermeiro.id
HAVING COUNT(*) > 1;

-- Consulta extra: Dados das internações que tiveram algum tipo de intercorrência durante a internação, incluindo o número do quarto em que a internação ocorreu e o nome do médico responsável pela equipe da internação
/* Esta consulta envolve três tabelas: internacao, equipe_internacao e intercorrencia */
SELECT internacao.*, quarto.numero, medico.nome AS nome_medico
FROM internacao
INNER JOIN quarto ON internacao.id_quarto = quarto.id
INNER JOIN equipe_internacao ON internacao.id = equipe_internacao.id_internacao
INNER JOIN medico ON equipe_internacao.id_medico = medico.id
INNER JOIN intercorrencia ON internacao.id = intercorrencia.id_internacao
WHERE intercorrencia.descricao IS NOT NULL;