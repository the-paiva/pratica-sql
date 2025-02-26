-- 2ª Questão


-- Cria a tabela assunto, declarando simultaneamente as suas colunas
CREATE TABLE ASSUNTO (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);


-- Cria a tabela editora, declarando simultaneamente as suas colunas
CREATE TABLE EDITORA (
    codigo INT PRIMARY KEY,
    CNPJ VARCHAR(18) NOT NULL UNIQUE,
    razaoSocial VARCHAR(255) NOT NULL
);


-- Cria a tabela nacionalidade, declarando simultaneamente as suas colunas
CREATE TABLE NACIONALIDADE (
    codigo INT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);


-- Cria a tabela autor, declarando simultaneamente as suas colunas
CREATE TABLE AUTOR (
    codigo INT PRIMARY KEY,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    nome VARCHAR(255) NOT NULL,
    dataNascimento DATE NOT NULL,
    nacionalidade_codigo INT,
    FOREIGN KEY (nacionalidade_codigo) REFERENCES NACIONALIDADE(codigo)
);


-- Cria a tabela livro, declarando simultaneamente as suas colunas
CREATE TABLE LIVRO (
    codigo INT PRIMARY KEY,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    dataLancamento DATE NOT NULL,
    assunto_codigo INT NOT NULL,
    editora_codigo INT NOT NULL,
    FOREIGN KEY (assunto_codigo) REFERENCES ASSUNTO(codigo),
    FOREIGN KEY (editora_codigo) REFERENCES EDITORA(codigo)
);


-- Cria a tabela autor_livro, declarando simultaneamente as suas colunas
CREATE TABLE AUTOR_LIVRO (
    autor_codigo INT NOT NULL,
    livro_codigo INT NOT NULL,
    PRIMARY KEY (autor_codigo, livro_codigo),
    FOREIGN KEY (autor_codigo) REFERENCES AUTOR(codigo),
    FOREIGN KEY (livro_codigo) REFERENCES LIVRO(codigo)
);


-- Adiciona valores à tabela assunto
INSERT INTO ASSUNTO (codigo, descricao) VALUES
(1, 'Ficção Científica'),
(2, 'Romance'),
(3, 'História'),
(4, 'Tecnologia'),
(5, 'Filosofia');


-- Adiciona valores à tabela editora
INSERT INTO EDITORA (codigo, CNPJ, razaoSocial) VALUES
(1, '12.345.678/0001-90', 'Editora Alfa'),
(2, '98.765.432/0001-21', 'Editora Beta'),
(3, '56.789.012/0001-34', 'Books Editora'),
(4, '23.456.789/0001-45', 'Editora Globo'),
(5, '67.890.123/0001-56', 'Editora Ômega');


-- Adiciona valores à tabela nacionalidade
INSERT INTO NACIONALIDADE (codigo, descricao) VALUES  
(1, 'Brasileiro'),  
(2, 'Estadunidense'),  
(3, 'Britânico'),  
(4, 'Francês'),  
(5, 'Japonês');


-- Adiciona valores à tabela autor
INSERT INTO AUTOR (codigo, CPF, nome, dataNascimento, nacionalidade_codigo) VALUES
(1, '123.456.789-00', 'Machado de Assis', '1839-06-21', 1),
(2, '234.567.890-11', 'William Shakespeare', '1564-04-26', 3),
(3, '345.678.901-22', 'Jane Austen', '1775-12-16', 3),
(4, '456.789.012-33', 'Gabriel García Márquez', '1927-03-06', 4),
(5, '567.890.123-44', 'Haruki Murakami', '1949-01-12', 5);


-- Adiciona valores à tabela livro
INSERT INTO LIVRO (codigo, ISBN, titulo, preco, dataLancamento, assunto_codigo, editora_codigo) VALUES
(1, '978-85-359-0277-1', 'Dom Casmurro', 39.90, '1899-01-01', 2, 1),
(2, '978-85-359-0278-8', 'Memórias Póstumas de Brás Cubas', 29.90, '1881-01-01', 2, 1),
(3, '978-85-359-0279-5', 'Quincas Borba', 34.90, '1891-01-01', 2, 1),
(4, '978-85-359-0280-1', 'O Alienista', 19.90, '1882-01-01', 2, 1),
(5, '978-85-359-0281-8', 'Helena', 24.90, '1876-01-01', 2, 1),
(6, '978-85-359-0282-5', 'Hamlet', 44.90, '1603-01-01', 1, 2),
(7, '978-85-359-0283-2', 'Romeu e Julieta', 39.90, '1597-01-01', 1, 2),
(8, '978-85-359-0284-9', 'Macbeth', 34.90, '1606-01-01', 1, 2),
(9, '978-85-359-0285-6', 'Otelo', 29.90, '1604-01-01', 1, 2),
(10, '978-85-359-0286-3', 'Sonho de uma Noite de Verão', 24.90, '1600-01-01', 1, 2),
(11, '978-85-359-0287-0', 'Orgulho e Preconceito', 39.90, '1813-01-01', 2, 3),
(12, '978-85-359-0288-7', 'Razão e Sensibilidade', 34.90, '1811-01-01', 2, 3),
(13, '978-85-359-0289-4', 'Emma', 44.90, '1815-01-01', 2, 3),
(14, '978-85-359-0290-0', 'Persuasão', 29.90, '1817-01-01', 2, 3),
(15, '978-85-359-0291-7', 'Mansfield Park', 39.90, '1814-01-01', 2, 3),
(16, '978-85-359-0292-4', 'Cem Anos de Solidão', 49.90, '1967-01-01', 2, 4),
(17, '978-85-359-0293-1', 'O Amor nos Tempos do Cólera', 39.90, '1985-01-01', 2, 4),
(18, '978-85-359-0294-8', 'Crônica de uma Morte Anunciada', 29.90, '1981-01-01', 2, 4),
(19, '978-85-359-0295-5', 'Do Amor e Outros Demônios', 34.90, '1994-01-01', 2, 4),
(20, '978-85-359-0296-2', 'Viver para Contar', 44.90, '2002-01-01', 3, 4);


-- Adiciona valores à tabela autor_livro
INSERT INTO AUTOR_LIVRO (autor_codigo, livro_codigo) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(5, 20);


/*
2ª Questão - Letra A
Livros que possuam preços entre R$ 30,00 e R$ 50,00.
*/
SELECT *
from livro
WHERE preco BETWEEN 30.00 and 50.00;


/*
2ª Questão - Letra B
Livros cujos títulos possuam a palavra ‘Amor’.
*/
SELECT *
FROM livro
where titulo like '%Amor%';


/*
2ª Questão - Letra C
Livros que foram lançados há mais de 200 anos.
*/
SELECT *
from livro
where datalancamento < CURRENT_DATE - INTERVAL '200 years';


/*
2ª Questão - Letra D
Quantidade total de livros.
*/

-- Resolução Padrão
SELECT COUNT(*) as quant_livros
from livro;

-- Resol
SELECT 'Quantidade total de livros: ' || count(*) as mensagem
from livro;


/*
2ª Questão - Letra E
Soma total dos preços dos livros.
*/

-- Resolução Padrão
SELECT sum(preco) as soma_precos
from livro;

-- Resolução Alternativa
SELECT 'Preço total dos livros: R$ ' || sum(preco) as mensagem
from livro;


/*
2ª Questão - Letra F
Maior preço dos livros.
*/

-- Resolução Padrão
SELECT max(preco) as maior_preco
from livro;

-- Resolução Alternativa
SELECT 'Maior preço registrado: R$ ' || max(preco) as mensagem
FROM livro;


/*
2ª Questão - Letra G
Quantidade de livros para cada assunto.
*/
SELECT assunto.descricao as genero, COUNT(livro) as quant_livros
from assunto
join livro on assunto.codigo = livro.assunto_codigo
GROUP by assunto.descricao;


/*
2ª Questão - Letra H
Assuntos cujo preço médio dos livros ultrapassa R$ 40,00.
*/
SELECT assunto.descricao as genero, ROUND(AVG(preco), 2) as preco_medio
from assunto
join livro on assunto.codigo = livro.assunto_codigo
GROUP by assunto.descricao
HAVING AVG(preco) > 40.00;


/*
2ª Questão - Letra I
Assuntos que possuem pelo menos 2 livros.
*/
SELECT assunto.descricao as genero, COUNT(livro) as quant_livros
from assunto
join livro on assunto.codigo = livro.assunto_codigo
GROUP by assunto.descricao
HAVING COUNT(livro) >= 2;


/*
2ª Questão - Letra J
Nome e CPF dos autores que nasceram após 1° de janeiro de 1810.
*/
SELECT nome, cpf
from autor
WHERE datanascimento > '1810-01-01';


/*
2ª Questão - Letra K
Nome e CPF dos autores que não são brasileiros.
*/
SELECT nome, cpf
FROM autor
WHERE nacionalidade_codigo != 1;


/*
2ª Questão - Letra L
Listagem dos livros contendo título, assunto e preço, ordenada em ordem crescente 
por assunto.
*/
SELECT titulo, descricao as genero, preco
from assunto
join livro on assunto.codigo = livro.assunto_codigo
ORDER by descricao;


/*
2ª Questão - Letra M
Listagem contendo os preços e os títulos dos livros, ordenada em ordem decrescente
de preço.
*/
SELECT titulo, preco
from livro
ORDER by preco desc;


/*
2ª Questão - Letra N
Listagem dos nomes dos autores brasileiros com mês e ano de nascimento, por ordem
decrescente de idade e por ordem crescente de nome do autor.
*/
SELECT nome, TO_CHAR(datanascimento, 'YYYY-MM') as ano_mes_nascimento
FROM autor
order by datanascimento desc, nome;


/*
2ª Questão - Letra O
Listagem das editoras e dos títulos dos livros lançados pela editora, ordenada
por nome da editora e pelo título do livro.
*/
SELECT razaosocial, titulo
from editora
join livro on editora.codigo = livro.editora_codigo
order by razaosocial, titulo;


/*
2ª Questão - Letra P
Listagem de assuntos, contendo os títulos dos livros dos respectivos assuntos,
ordenada pela descrição do assunto.
*/
SELECT assunto.descricao as genero, titulo
from assunto
join livro on assunto.codigo = livro.assunto_codigo
order by descricao;


/*
2ª Questão - Letra Q
Listagem dos nomes dos autores e os livros de sua autoria, ordenada pelo nome 
do autor.
*/
SELECT nome as nome_autor, titulo as titulo_livro
from livro
join autor_livro on livro.codigo = autor_livro.livro_codigo
join autor on autor_livro.autor_codigo = autor.codigo
order by nome;


/*
2ª Questão - Letra R
Editoras que publicaram livros escritos pelo autor ‘Machado de Assis’
*/

-- Resolução Padrão
SELECT *
FROM editora
join livro on editora.codigo = livro.editora_codigo
join autor_livro on livro.codigo = autor_livro.livro_codigo
join autor on autor_livro.autor_codigo = autor.codigo
WHERE autor.codigo = 1;

-- Resolução Alternativa
SELECT razaosocial as editoras, titulo as livros, nome as nome_autor
from editora
join livro on editora.codigo = livro.editora_codigo
join autor_livro on livro.codigo = autor_livro.livro_codigo
join autor on autor_livro.autor_codigo = autor.codigo
WHERE autor.codigo = 1;


/*
2ª Questão - Letra S
Preço do livro mais caro publicado pela editora ‘Books Editora’ sobre banco de dados.
*/
SELECT max(preco) as maior_preco
from livro
where editora_codigo = 3 AND titulo ILIKE '%Banco de Dados%';


/*
2ª Questão - Letra T
Nome e CPF do autor brasileiro que tenha nascido antes de 1° de janeiro de 1950 e os
títulos dos livros de sua autoria, ordenado pelo nome do autor e pelo título do livro.
*/
SELECT nome as nome_autor, cpf, titulo as titulo_livro
from autor
join autor_livro on autor.codigo = autor_livro.autor_codigo
join livro on autor_livro.livro_codigo = livro.codigo
WHERE datanascimento < '1950-01-01'
order by nome, titulo;
