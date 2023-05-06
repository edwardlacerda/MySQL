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