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







