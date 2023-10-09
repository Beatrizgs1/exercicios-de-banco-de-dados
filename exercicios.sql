--Exercícios de Fixação - FUNÇÕES


--Funções de String:
--a) Criar e preencher a tabela 'nomes':
CREATE TABLE nomes (
    nome VARCHAR(255)
);

INSERT INTO nomes (nome) VALUES
    ('Roberta'),
    ('Roberto'),
    ('Maria Clara'),
    ('João');



--b) Converter todos os nomes para maiúsculas usando UPPER():
SELECT UPPER(nome) AS nome_maiusculo FROM nomes;



--c) Determinar o tamanho de cada nome usando LENGTH():
SELECT nome, LENGTH(nome) AS tamanho_do_nome FROM nomes;


--d) Adicionar "Sr." antes dos nomes masculinos e "Sra." antes dos nomes femininos usando CONCAT():
SELECT 
    CASE 
        WHEN nome LIKE '%João%' OR nome LIKE '%Roberto%' THEN CONCAT('Sr. ', nome)
        ELSE CONCAT('Sra. ', nome)
    END AS nome_com_tratamento
FROM nomes;


--Funções Numéricas:
--a) Criar e preencher a tabela 'produtos':
CREATE TABLE produtos (
    produto VARCHAR(255),
    preco DECIMAL(10, 2),
    quantidade INT
);

INSERT INTO produtos (produto, preco, quantidade) VALUES
    ('Produto A', 15.99, 10),
    ('Produto B', 9.99, 5),
    ('Produto C', 29.95, 0);


--b) Arredondar os preços para 2 casas decimais usando ROUND():
SELECT produto, ROUND(preco, 2) AS preco_arredondado FROM produtos;


--c) Exibir o valor absoluto das quantidades usando ABS():
SELECT produto, ABS(quantidade) AS quantidade_absoluta FROM produtos;



--d) Calcular a média dos preços dos produtos usando AVG():
SELECT AVG(preco) AS media_precos FROM produtos;


--Funções de Data:
--a) Criar e preencher a tabela 'eventos':
CREATE TABLE eventos (
    data_evento DATE
);

INSERT INTO eventos (data_evento) VALUES
    ('2023-10-01'),
    ('2023-10-05'),
    ('2023-10-15');


--b) Inserir a data e hora atual em uma nova linha usando NOW():
INSERT INTO eventos (data_evento) VALUES (NOW());


--c) Calcular o número de dias entre duas datas usando DATEDIFF():
SELECT 
    data_evento,
    DATEDIFF('2023-10-01', data_evento) AS dias_ate_1o_outubro
FROM eventos;


--d) Exibir o nome do dia da semana de cada evento usando DAYNAME():
SELECT 
    data_evento,
    DAYNAME(data_evento) AS nome_dia_semana
FROM eventos;


--Funçoes de controle fluxo
--a) Usar IF() para determinar se um produto está "Em estoque" ou "Fora de estoque":
SELECT 
    produto,
    IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS status_estoque
FROM produtos;

--b) Usar CASE para classificar os produtos em categorias de preço:
SELECT 
    produto,
    CASE 
        WHEN preco < 10.00 THEN 'Barato'
        WHEN preco >= 10.00 AND preco <= 20.00 THEN 'Médio'
        ELSE 'Caro'
    END AS categoria_preco
FROM produtos;

--Função Personalizada:
--a) Crie uma função chamada TOTAL_VALOR que receba preço e quantidade, e retorne o valor total.
DELIMITER //

CREATE FUNCTION TOTAL_VALOR(preco DECIMAL(10, 2), quantidade INT)
RETURNS DECIMAL(10, 2)
BEGIN
    RETURN preco * quantidade;
END;
//

DELIMITER ;


--b) Use esta função para calcular o valor total de cada item em sua tabela produtos.
SELECT 
    produto,
    preco,
    quantidade,
    TOTAL_VALOR(preco, quantidade) AS valor_total
FROM produtos;


--Funções de Agregação:
--a) Conte o número total de produtos usando a função COUNT().
SELECT COUNT(*) AS total_produtos FROM produtos;

--b) Determine o produto mais caro usando a função MAX().
SELECT MAX(preco) AS produto_mais_caro FROM produtos;


--c) Determine o produto mais barato usando a função MIN().
SELECT MIN(preco) AS produto_mais_barato FROM produtos;


--d) Calcule a soma total dos produtos em estoque utilizando as funções SUM() e IF().
SELECT 
    SUM(IF(quantidade > 0, preco * quantidade, 0)) AS valor_total_em_estoque
FROM produtos;

--Criando funções:
--a) Crie uma função que retorno o Fatorial de um número. Ex.: 5! = 5.4.2.1
DELIMITER //

CREATE FUNCTION FATORIAL(n INT)
RETURNS INT
BEGIN
    DECLARE resultado INT;
    SET resultado = 1;
    WHILE n > 0 DO
        SET resultado = resultado * n;
        SET n = n - 1;
    END WHILE;
    RETURN resultado;
END;
//

DELIMITER ;

--b) Crie uma função que qualcule o exponencial de um número. Ex.: f_exponencial(2, 3) = 2³ = 8
DELIMITER //

CREATE FUNCTION F_EXPONENCIAL(base DECIMAL(10, 2), expoente INT)
RETURNS DECIMAL(10, 2)
BEGIN
    RETURN POW(base, expoente);
END;
//

DELIMITER ;

--c) Crie uma função que verifica se uma palavra é palíndromo ou não. Retorne 1 se for palíndromo ou 0 se não for.
DELIMITER //

CREATE FUNCTION PALINDROMO(palavra VARCHAR(255))
RETURNS INT
BEGIN
    DECLARE reverso VARCHAR(255);
    SET reverso = REVERSE(palavra);
    IF palavra = reverso THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
//

DELIMITER ;


