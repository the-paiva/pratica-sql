/*
==============================================================================================================
												                        1ª Questão
==============================================================================================================
*/


-- Cria a tabela CD, declarando a chave primária simultaneamente.
CREATE TABLE CD (
  Codigo INT PRIMARY KEY
);


-- Altera a tabela CD, adicionando mais colunas (atributos)
ALTER TABLE CD ADD COLUMN Nome VARCHAR(45) NOT NULL;
ALTER TABLE CD ADD COLUMN DataCompra DATE NOT NULL;
ALTER TABLE CD ADD COLUMN ValorPago REAL not NULL;
ALTER TABLE CD ADD COLUMN LocalCompra VARCHAR(45) NOT NULL;
ALTER TABLE CD ADD COLUMN Album VARCHAR(1) CHECK(Album In('S', 'N'));
ALTER TABLE CD ADD COLUMN Artista VARCHAR(50);


-- Cria a tabela Musica, declarando suas colunas simultaneamente.
CREATE TABLE Musica (
  CD_codigo INT NOT NULL,
  Numero INT NOT NULL,
  NOME VARCHAR(45) NOT NULL,
  DURACAO INT NOT NULL, -- Duração em segundos
  CONSTRAINT PK_Musica PRIMARY KEY (CD_codigo, Numero), -- Definindo CD_codigo e Numero como chave primária composta
  CONSTRAINT FK_CD_CODIGO FOREIGN KEY (CD_codigo) REFERENCES CD(Codigo) -- Definindo CD_codigo como chave estrangeira
);


-- Adiciona valores à tabela cd
INSERT INTO CD (Codigo, Nome, DataCompra, ValorPago, LocalCompra, Album, Artista)
VALUES 
(1, 'O Rei Leão', '1968-01-03', 20.00, 'Made in Brazil Music', 'S', 'Reginaldo Rossi'),
(2, 'Quatro Estações – O Show', '2000-05-07', 28.00, 'Veneza Music', 'S', 'Sandy & Junior'),
(3, 'Construção', '1971-02-01', 18.00, 'Made in Brazil Music', 'S', 'Chico Buarque'),
(4, 'O Descobrimento do Brasil', '1993-12-09', 25.00, 'Yamaha Musical', 'S', 'Os Mutantes'),
(5, 'Acústico MTV', '1999-07-09', 30.00, 'Fábio do Som', 'S', 'Legião Urbana'),
(6, 'Festa dos Pães', '1967-12-03', 20.00, 'Fábio do Som', 'S', 'Reginaldo Rossi'),
(7, 'Rádio Pirata ao Vivo', '1986-05-09', 22.00, 'Yamaha Musical', 'S', 'RPM'),
(8, 'Xou da Xuxa', '1986-10-05', 25.00, 'Veneza Music', 'S', 'Xuxa'),
(9, 'À Procura de Você', '1970-05-21', 15.00, 'Made in Brazil Music', 'S', 'Reginaldo Rossi'),
(10, 'Construção', '1971-11-11', 18.00, 'Fábio do Som', 'S', 'Chico Buarque');


-- Adiciona valores à tabela musica
INSERT INTO Musica (CD_codigo, Numero, NOME, DURACAO)
VALUES
(5, 1, 'Tempo Perdido', 220),
(1, 6, 'O Amor e o Poder', 210),
(2, 3, 'As Quatro Estações', 210),
(3, 4, 'O Meu Amor', 200),
(4, 3, 'Domingo no Parque', 220),
(1, 2, 'Garçom', 210),
(2, 5, 'Eu Quero é Mais', 180),
(3, 2, 'O Que Será (À Flor da Pele)', 220),
(4, 1, 'O Descobrimento do Brasil', 200),
(1, 4, 'Cavalgada', 220),
(2, 6, 'Nascemos Pra Cantar', 200),
(3, 1, 'Construção', 240),
(4, 2, 'A Minha Menina', 210),
(1, 5, 'Me Dê Motivos', 180),
(2, 2, 'Quando Você Passa', 200),
(3, 3, 'Samba de Orly', 210),
(4, 4, 'Ando Meio Desligado', 180),
(1, 3, 'Anunciação', 200),
(2, 4, 'Pra Dançar Com Você', 220),
(3, 5, 'O Meu Amor', 200);


-- Altera o local de compra do cd com código 4 (O Descobrimento do Brasil)
UPDATE cd
set localcompra = 'Submarino.com'
WHERE codigo = 4;


-- Altera o atributo album de algumas linhas específicas
UPDATE cd
set album = 'N'
WHERE codigo in (3, 5, 9);


/* 
1ª Questão - Letra A
Mostrar os campos nome e data da compra dos CDs ordenados por nome
*/
SELECT nome, datacompra
FROM cd
ORDER BY nome;


/*
1ª Questão - Letra B
Mostrar os campos nome e data da compra dos CDs classificados por data de compra em
ordem decrescente
*/
SELECT nome, datacompra
FROM cd
order by datacompra DESC;


/*
1ª Questão - Letra C
Mostrar o total gasto com a compra dos CDs
*/

-- Resolução Padrão
SELECT sum(valorpago) as total_gasto
from cd;

-- Resolução Alternativa
SELECT 'Total gasto com cds: ' || sum(valorpago) as mensagem
from cd;


/*
1ª Questão - Letra D
Mostrar o nome do CD e o nome das músicas de todos CDs
*/
SELECT cd.nome as cd_nome, musica.nome as musica_nome
FROM cd
JOIN musica on cd.codigo = musica.cd_codigo;


/*
1ª Questão - Letra E
Mostrar o nome e o artista de todas as músicas cadastradas
*/
SELECT musica.nome as nome_musica, artista as artista_ou_banda
from cd
join musica on cd.codigo = musica.cd_codigo;


/*
1ª Questão - Letra F
Mostrar o tempo total de músicas cadastradas
*/

-- Resolução Padrão
SELECT SUM(duracao) as duracao_total_das_musicas
FROM musica;

-- Resolução Alternativa
SELECT 'Duração total das músicas: ' || sum(duracao) || ' segundos' as mensagem
FROM musica;


/*
1ª Questão - Letra G
Mostrar o número, nome e tempo das músicas do CD com o código 5 por ordem de número
*/
SELECT numero, nome as nome_musica, duracao
from musica
WHERE cd_codigo = 5
ORDER by numero;


/*
1ª Questão - Letra H
Mostrar o número, nome e tempo das músicas do CD com o nome “O Rei Leão”
por ordem de nome
*/
SELECT numero, musica.nome, duracao
from cd
join musica on cd.codigo = musica.cd_codigo
WHERE cd.nome = 'O Rei Leão'
ORDER by musica.nome;


/*
1ª Questão - Letra I
Mostrar o tempo total de músicas por CD
*/

-- Resolução Padrão
SELECT cd.nome, sum(musica.duracao) AS tempo_total_de_musicas
from cd
join musica on cd.codigo = musica.cd_codigo
GROUP by cd.nome;

-- Resolução Alternativa
SELECT cd.nome, sum(musica.duracao) || ' segundos' AS tempo_total_de_musicas
from cd
join musica on cd.codigo = musica.cd_codigo
GROUP by cd.nome;


/*
1ª Questão - Letra J
Mostrar a quantidade de músicas cadastradas
*/

-- Resolução Padrão
SELECT COUNT(musica)
FROM musica;

-- Resolução Alternativa
SELECT 'Quantidade de músicas cadastradas: ' || COUNT(musica) as mensagem
from musica


/*
1ª Questão - Letra K
Mostrar a média de duração das músicas cadastradas
*/

-- Resolução Padrão
SELECT ROUND(AVG(duracao), 2) -- Uso do ROUND para arredondar em duas casas decimais
from musica;

-- Resolução Alternativa
SELECT 'Média de duração das músicas cadastradas: ' || ROUND(AVG(duracao), 2) 
|| ' segundos' as mensagem
from musica;


/*
1ª Questão - Letra L
Mostrar a quantidade de CDs
*/

-- Resolução Padrão
SELECT COUNT(*)
FROM cd;

-- Resolução Alternativa
SELECT 'Quantidade de CDs registrados: ' || COUNT(*) as mensagem
FROM cd;


/*
1ª Questão - Letra M
Mostrar o nome das músicas do artista Reginaldo Rossi
*/

-- 1ª Alternativa (Junção de tabelas usando WHERE)
SELECT nome
FROM musica
WHERE cd_codigo IN(
  SELECT codigo
  FROM cd
  WHERE artista = 'Reginaldo Rossi'
);

-- 2ª Alternativa (Junção de tabelas usando JOIN)
select musica.nome
from musica
join cd on cd.codigo = musica.cd_codigo
WHERE artista = 'Reginaldo Rossi';


/*
1ª Questão - Letra N
Mostrar a quantidade de músicas por CDs
*/
SELECT cd.nome as cd_nome, COUNT(musica) as quant_musicas
from cd
join musica on cd.codigo = musica.cd_codigo
GROUP by cd.nome;


/*
1ª Questão - Letra O
Mostrar o nome de todos os CDs comprados no “Submarino.com”
*/
SELECT nome
FROM cd
WHERE localcompra = 'Submarino.com';


/*
1ª Questão - Letra P
Mostrar uma listagem de músicas em ordem alfabética
*/
SELECT *
from musica
ORDER by nome;


/*
1ª Questão - Letra Q
Mostrar todos os CDs que são álbuns
*/
SELECT *
from cd
WHERE album = 'S';


/*
1ª Questão - Letra R
Mostrar o CD que custou mais caro
*/
SELECT * 
FROM cd
WHERE valorpago = (
  SELECT MAX(valorpago) 
  FROM cd
);


/*
1ª Questão - Letra S
Mostrar os CDs comprados entre os anos 70 e 80
*/
SELECT *
From cd
where datacompra BETWEEN '1970-01-01' and '1980-12-31';


/*
1ª Questão - Letra T
Mostrar os CDs cujo valor pago esteja entre R$ 25,00 e R$ 50,00
*/
SELECT *
FROM cd
where valorpago BETWEEN 25.00 and 50.00;
