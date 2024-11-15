INSERT INTO FILIAIS (FILIAL_COD, FILIAL_RUA, FILIAL_NUMRUA, FILIAL_BAIRRO, FILIAL_CIDADE, FILIAL_ESTADO, FILIAL_PAIS, FILIAL_CODPOSTAL, FILIAL_CAPACIDADE)
VALUES (1, 'Rua dos Bobos', 0, 'Centro', 'São Paulo', 'SP', 'Brasil', '00000-000', '1000'),
(2, 'Rua das bobas', 1, 'Centro', 'Rio de Janeiro', 'RJ', 'Brasil', '11111-111', '2000'),
(3, 'Rua de todos', 2, 'Centro', 'Belo Horizonte', 'MG', 'Brasil', '22222-222', '3000'),
(4, 'Rua de ninguém', 3, 'Centro', 'Curitiba', 'PR', 'Brasil', '33333-333', '4000'),
(5, 'Rua de alguém', 4, 'Centro', 'Porto Alegre', 'RS', 'Brasil', '44444-444', '5000');

INSERT INTO FORNECEDORES (FORNEC_COD, FORNEC_RUA, FORNEC_NUMRUA, FORNEC_BAIRRO, FORNEC_CIDADE, FORNEC_ESTADO, FORNEC_PAIS, FORNEC_CODPOSTAL, FORNEC_TELEFONE, FORNEC_CONTATO) 
VALUES (1, 'Rua dos Bobos', 0, 'Centro', 'São Paulo', 'SP', 'Brasil', '00000-000', '11 1111-1111', 'João'),
(2, 'Rua das bobas', 4, 'Centro', 'Rio de Janeiro', 'RJ', 'Brasil', '11111-111', '21 2222-2222', 'Maria'),
(3, 'Rua de todos', 2, 'Centro', 'Belo Horizonte', 'MG', 'Brasil', '22222-222', '31 3333-3333', 'José');
(4, 'Rua de ninguém', 3, 'Centro', 'Curitiba', 'PR', 'Brasil', '33333-333', '41 4444-4444', 'Ana'),
(5, 'Rua de alguém', 4, 'Centro', 'Porto Alegre', 'RS', 'Brasil', '44444-444', '51 5555-5555', 'Carlos');

INSERT INTO PEDIDOS (PED_COD, PED_DATA, PED_HORA, PED_PREVISAO, PED_STATUS, PED_FORNECEDOR)
VALUES (1, '2021-01-01', '12:00:00', '2021-01-02', 'PENDENTE', 1),
(2, '2021-01-02', '12:00:00', '2021-01-03', 'PENDENTE', 2),
(3, '2021-01-03', '12:00:00', '2021-01-04', 'PENDENTE', 3),
(4, '2021-01-04', '12:00:00', '2021-01-05', 'PENDENTE', 4),
(5, '2021-01-05', '12:00:00', '2021-01-06', 'PENDENTE', 5);

INSERT INTO PRODUTOS (PROD_COD, PROD_DESCRICAO, PROD_ESPECTEC, PROD_QUANT, PROD_PRECIUNIT, PROD_UNIDMEDIA, PROD_ESTOQ_MIN)
VALUES (1, 'Produto 1', 'Especificação 1', 100, 10.00, 'UN', 10),
(2, 'Produto 2', 'Especificação 2', 200, 20.00, 'UN', 20),
(3, 'Produto 3', 'Especificação 3', 300, 30.00, 'UN', 30),
(4, 'Produto 4', 'Especificação 4', 400, 40.00, 'UN', 40),
(5, 'Produto 5', 'Especificação 5', 500, 50.00, 'UN', 50);

INSERT INTO RECEBIMENTOS (RECEB_DATA, RECEB_HORA, RECEB_QUANT_PROD, RECEB_CONDICAO, RECEB_PEDIDOS)
VALUES ('2021-01-01', '12:00:00', 100, 'Condição 1', 1),
('2021-01-02', '12:00:00', 200, 'Condição 2', 2),
('2021-01-03', '12:00:00', 300, 'Condição 3', 3),
('2021-01-04', '12:00:00', 400, 'Condição 4', 4),
('2021-01-05', '12:00:00', 500, 'Condição 5', 5);

-- DANDO UPDATE NAS TABELAS
UPDATE FILIAIS 
SET FILIAL_CAPACIDADE = '6000' 
WHERE FILIAL_COD = 1;

UPDATE FILIAIS
SET FILIAL_CAPACIDADE = '7000'
WHERE FILIAL_COD = 2;

UPDATE FORNECEDORES
SET FORNEC_TELEFONE = '11 1111-1112'
WHERE FORNEC_COD = 1;

UPDATE FORNECEDORES
SET FORNEC_TELEFONE = '21 2222-2223'
WHERE FORNEC_COD = 2;

UPDATE PEDIDOS 
SET PED_STATUS = 'CONCLUIDO'
WHERE PED_COD = 1;

UPDATE PEDIDOS
SET PED_STATUS = 'EM ESPERA'
WHERE PED_COD = 2;

UPDATE PRODUTOS 
SET PROD_QUANT = 150
WHERE PROD_COD = 1;

UPDATE PRODUTOS 
SET PROD_QUANT = 250
WHERE PROD_COD = 2;

UPDATE RECEBIMENTOS
SET RECEB_QUANT_PROD = 200
WHERE RECEB_PEDIDOS = 1;

UPDATE RECEBIMENTOS
SET RECEB_QUANT_PROD = 300
WHERE RECEB_PEDIDOS = 2;

-- DELETANDO DADOS DAS TABELAS

DELETE FROM FILIAIS
WHERE FILIAL_COD = 3;

DELETE FROM FORNECEDORES
WHERE FORNEC_COD = 4;

DELETE FROM PEDIDOS
WHERE PED_COD = 5;

DELETE FROM PRODUTOS
WHERE PROD_COD = 3;

DELETE FROM RECEBIMENTOS
WHERE RECEB_PEDIDOS = 4;