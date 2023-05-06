create database super;

CREATE TABLE Produtos(
idProduto INT NOT NULL AUTO_INCREMENT,
nomeProduto VARCHAR(200),
categoriaProduto VARCHAR(200),
valorVendaProduto DOUBLE(9,2),
quantidadeProduto INT,
PRIMARY KEY (idProduto)
);

INSERT into Produtos
(nomeProduto,categoriaProduto,valorVendaProduto,quantidadeProduto) values
('Refrigerante','Bebidas','5.50',300),
('Arroz 5kg','Mercearia','8.50',100),
('Feijão','Mercearia','6.50',800),
('Detergente','Limpeza','2.10',100),
('Leite','Laticínios','2.70',600),
('Bolacha recheada',NULL,'1.50',200),
('Leite condensado','Mercearia','4.50',500);

SELECT nomeProduto, valorVendaProduto FROM Produtos;

select * from Produtos where nomeProduto = 'Leite';

SELECT nomeProduto, valorVendaProduto FROM Produtos WHERE nomeProduto='Leite';

SELECT nomeProduto, categoriaProduto, valorVendaProduto FROM Produtos WHERE categoriaProduto <> 'Mercearia'; /* <> funciona da mesma forma que != ou seja, DIFERENTE*/

SELECT * FROM Produtos WHERE valorVendaProduto = 1.50 AND quantidadeProduto = 200;

SELECT * FROM Produtos WHERE categoriaProduto = 'Limpeza' OR valorVendaProduto = 5.50;

SELECT * FROM Produtos WHERE (categoriaProduto ='Limpeza' or categoriaProduto='Mercearia') and valorVendaProduto = 6.50; /* Necessário parênteses para comparar primeiramente as categorias e só depois o valor, senão retornará incorretamente*/

SELECT * FROM Produtos WHERE NOT categoriaProduto ='Mercearia'; /* Seleciona todos os produtos exceto da categoria Mercearia*/

SELECT * FROM Produtos WHERE quantidadeProduto >= 300; /* Seleciona somente quantidade de produtos igual ou acima de 300*/

SELECT * FROM Produtos WHERE valorVendaProduto <= 5; /* Seleciona somente produtos com valor igual ou menor que 5,00 reais*/

SELECT * FROM Produtos WHERE valorVendaProduto BETWEEN 5 AND 10; /* Seleciona somente produtos com valor ENTRE 5 e 10 reais*/

SELECT * FROM Produtos WHERE categoriaProduto in ('Limpeza','Bebidas','Laticínios'); /* Seleciona somente os produtos da categoria Limpeza, bebidas e Laticínios devido o operador IN (Dentro)*/

SELECT * FROM Produtos WHERE categoriaProduto NOT IN ('Limpeza','Bebidas','Laticínios'); /* Exibe somente os produtos que NÂO estão nas categorias selecionadas */ 

SELECT nomeProduto, valorVendaProduto FROM Produtos WHERE nomeProduto LIKE '%leite%'; /* Exibe os resultados que tenham o termo leite no nome*/

SELECT nomeProduto, valorVendaProduto FROM Produtos WHERE nomeProduto LIKE '%Condensado'; /* Exibe o termo ignorando o que vem antes*/

SELECT nomeProduto, valorVendaProduto FROM Produtos WHERE nomeProduto LIKE 'Leite%'; /* Exibe o termo ignorando o que vem depois*/

SELECT nomeProduto, valorVendaProduto FROM Produtos WHERE nomeProduto LIKE '_eite%'; /* Retorna os registros que contêm um caractere qualquer no começo do termo pesquisado. Retorno: ‘Leite Condensado’.*/

SELECT nomeProduto, valorVendaProduto FROM Produtos WHERE nomeProduto LIKE '%s__o'; /* Serão retornados os registros que comecem com a letra “s”, contenham dois caracteres quaisquer e, em seguida, a letra “o”. Retorno: ‘Leite Condensado’.*/

SELECT nomeProduto, valorVendaProduto FROM Produtos WHERE nomeProduto LIKE 'Leite'; /*O operador LIKE também pode ser usado sem os caracteres curinga (LIKE 'Leite', por exemplo). Nesse caso, seu comportamento será exatamente como o do operador de igualdade.*/

SELECT * FROM Produtos WHERE idProduto=5; /* Aqui, apenas um registro correspondeu à condição de idProduto=5, portanto, só uma linha foi recuperada.*/

SELECT * FROM Produtos WHERE categoriaProduto IS NULL; /* verifica se um campo está com valor NULL, ao invés de utilizar o operador de igualdade, você pode utilizar o operador IS NULL.*/

SELECT * FROM Produtos WHERE categoriaProduto IS NOT NULL; /*encontra todos os registros cujo campo não seja preenchido com NULL, use o operador IS NOT NULL.*/

SELECT nomeProduto, categoriaProduto, valorVendaProduto FROM Produtos WHERE categoriaProduto <> 'Mercearia' OR categoriaProduto IS NULL; /*O operador de igualdade e de diferença ignoram valores nulos, é preciso usar o operador OR para completar a consulta*/

SELECT nomeProduto AS nome, valorVendaProduto AS valor FROM Produtos; /*Alias ou AS é um nickname para os nomes das tabelas para facilitar a vizualizacao durante uma consulta*/

SELECT (valorVendaProduto*quantidadeProduto) AS Valor_Total FROM Produtos; /*multiplicação do valor de venda de cada produto por sua quantidade. Para isso, serão adotados os parênteses externos e atribuídos a um alias AS Valor_Total*/

SELECT (quantidadeProduto / valorVendaProduto) AS Valor_Divisao FROM Produtos; /*O operador aritmético para divisão é /, e deverá ficar entre os dois campos nos quais deve ocorrer a divisão*/

SELECT (quantidadeProduto - valorVendaProduto) AS Valor_Subtracao FROM Produtos; /*Observe a cláusula SELECT utilizando a operação de subtração entre dois campos*/

SELECT (quantidadeProduto + valorVendaProduto) AS Valor_Soma FROM Produtos; /*Veja a cláusula SELECT utilizando a operação de adição entre dois campos*/

SELECT (valorVendaProduto * 1.2) AS Valor_Reajustado FROM Produtos; /* aplica um aumento de 20% sobre o valor de venda do produto*/

/*Semelhantemente aos cálculos aritméticos básicos, os operadores aritméticos no MySQL também têm a mesma precedência de operador.
 Se a expressão aritmética contiver mais de um operador, os operadores de multiplicação e divisão terão a prioridade mais alta e serão avaliados primeiro e, em seguida, 
 os operadores de adição e subtração serão avaliados.*/
 
SELECT * FROM Produtos ORDER BY nomeProduto; /* ordena por ordem alfabética ou ascendente*/

SELECT * FROM Produtos ORDER BY nomeProduto DESC; /*ordena por ordem decrescente*/

SELECT * FROM Produtos ORDER BY categoriaProduto, nomeProduto DESC; /*ordena por ordem decrescente com duas tabelas*/

/*desafio Elabore uma consulta que apresente o nome do produto, a categoria e o valor, exibindo os produtos que não sejam da categoria “mercearia” 
e cujo valor de venda seja superior a 2.00. Não esqueça de ordenar pelo nome do produto. SEGUE O RESULTADO*/

SELECT * FROM Produtos ORDER BY nomeProduto,categoriaProduto,valorVendaProduto NOT IN ('mercearia') and valorVendaProduto > 2;  

/* Funções de agregação: COUNT, SUM, AVG, MIN e MAX com SELECT*/

SELECT COUNT(nomeProduto) FROM Produtos WHERE nomeProduto LIKE '%leite%'; /*Obtendo a quantidade de produtos com o nome "leite"*/

SELECT AVG(valorVendaProduto) FROM Produtos; /* Obtendo o valor médio entre todos os produtos*/

SELECT SUM(quantidadeProduto) FROM Produtos; /* Obtendo a soma de todas as quantidades dos produtos*/

SELECT MIN(valorVendaProduto) FROM Produtos; /* Obtendo o valor do produto de menor valor*/

SELECT MAX(valorVendaProduto) FROM Produtos; /* Obtendo o valor do produto de maior valor*/

SELECT MIN(nomeProduto) FROM Produtos; /*Quando se executa a função MIN em uma coluna que contém valores de string, essa função retornará o primeiro valor em ordem alfabética*/

SELECT MAX(nomeProduto) FROM Produtos; /*Da mesma forma, quando executada em uma coluna que contém valores de string, a função MAX mostrará o último valor em ordem alfabética*/

CREATE TABLE Fornecedor (
idFornecedor int(11) auto_increment,
nomeFornecedor varchar(200),
cnpjFornecedor varchar(14),
PRIMARY KEY(idFornecedor)
);

INSERT INTO Fornecedor (nomeFornecedor, cnpjFornecedor) 
	VALUES 
	('Brasil Alimentos', '10000000000101'), 
    ('Laticínios Norte Minas', '20000000000102'), 
    ('Alimentos do Centro-Oeste', '30000000000103');
 
 CREATE TABLE Marca (
idMarca int(11) auto_increment,
nomeMarca varchar(200),
PRIMARY KEY(idMarca)
);

INSERT INTO Marca (nomeMarca) 
	VALUES
	('Cereais do bom'),
	('Bebidas do Brasil'),
	('Doce Brasil');
    
ALTER TABLE Produtos ADD idFornecedor INT;

ALTER TABLE Produtos ADD CONSTRAINT FK_Fornecedor FOREIGN KEY (idFornecedor) REFERENCES Fornecedor (idFornecedor);

ALTER TABLE Produtos ADD idMarca INT;

ALTER TABLE Produtos ADD CONSTRAINT FK_Marca FOREIGN KEY (idMarca) REFERENCES Marca (idMarca); 

select*from Produtos;

update produtos set idMarca=1 where nomeMarca = 'Refrigerante';
update produtos set idMarca=1 where nomeProduto = 'Arroz 5kg';
update produtos set idMarca=1 where nomeProduto = 'Feijão';
update produtos set idMarca=1 where nomeProduto = 'Detergente';
update produtos set idMarca=3 where nomeProduto = 'Leite';
update produtos set idMarca=3 where nomeProduto = 'Bolacha recheada';
update produtos set idMarca=3 where nomeProduto = 'Leite condensado';

update produtos set idFornecedor=3 where nomeProduto = 'Refrigerante';
update produtos set idFornecedor=1 where nomeProduto = 'Arroz 5kg';
update produtos set idFornecedor=1 where nomeProduto = 'Feijão';
update produtos set idFornecedor=3 where nomeProduto = 'Detergente';
update produtos set idFornecedor=2 where nomeProduto = 'Leite';
update produtos set idFornecedor=3 where nomeProduto = 'Bolacha recheada';
update produtos set idFornecedor=2 where nomeProduto = 'Leite condensado';

SELECT Produtos.nomeProduto, Produtos.valorVendaProduto, Marca.nomeMarca FROM Produtos, Marca WHERE Produtos.idMarca = Marca.idMarca;

SELECT P.nomeProduto, M.nomeMarca, F.nomeFornecedor, P.valorVendaProduto FROM Produtos AS P, Marca AS M, Fornecedor AS F WHERE P.idMarca = M.idMarca AND P.idFornecedor = F.idFornecedor;

SELECT P.nomeProduto, P.valorVendaProduto, M.nomeMarca FROM Produtos AS P, Marca AS M WHERE P.idMarca = M.idMarca;

SELECT P.nomeProduto, M.nomeMarca, F.nomeFornecedor, P.valorVendaProduto FROM Produtos AS P, Marca AS M, Fornecedor AS F WHERE P.idMarca = M.idMarca AND P.idFornecedor = F.idFornecedor;

SELECT P.nomeProduto, P.valorVendaProduto, M.nomeMarca FROM Produtos AS P JOIN Marca AS M ON P.idMarca=M.idMarca;

SELECT P.nomeProduto, M.nomeMarca, F.nomeFornecedor, P.valorVendaProduto FROM Produtos AS P JOIN Marca AS M ON P.idMarca = M.idMarca JOIN Fornecedor AS F ON P.idFornecedor = F.idFornecedor;

SELECT P.nomeProduto, P.valorVendaProduto, M.nomeMarca FROM Produtos AS P INNER JOIN Marca AS M ON P.idMarca=M.idMarca WHERE P.categoriaProduto='Mercearia' ORDER BY P.nomeProduto;



	












 