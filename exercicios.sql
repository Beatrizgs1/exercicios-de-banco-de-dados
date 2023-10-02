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





