#CRIAR BANCO DE DADOS

CREATE SCHEMA EC1_CC1M;

#SELECIONAR BANCO DE DADOS

USE EC1_CC1M;

#CRIANDO TABELAS SEM FK (CHAVE ESTRANGEIRA)

#CRIANDO TABELA FORNECEDORES
CREATE TABLE IF NOT EXISTS FORNECEDORES(
    FORNEC_COD INT PRIMARY KEY,
    FORNEC_NOME VARCHAR(45) NOT NULL,
    FORNEC_RUA VARCHAR(45) NOT NULL,
    FORNEC_NUMRUA INT,
    FORNEC_BAIRRO VARCHAR(45) NOT NULL,
    FORNEC_BAIRRO VARCHAR(45) NOT NULL,
    FORNEC_CIDADE VARCHAR(45) NOT NULL,
    FORNEC_ESTADO VARCHAR(45) NOT NULL,
    FORNEC_PAIS VARCHAR(45) NOT NULL,
    FORNEC_CODPOSTAL VARCHAR(10) NOT NULL,
    FORNEC_TELEFONE VARCHAR(15) NOT NULL,
    FORNEC_CONTATO TEXT NOT NULL
);

#CRIANDO TABELA FILIAIS
CREATE TABLE IF NOT EXISTS FILIAIS(
    FILIAL_COD INT PRIMARY KEY,
    FILIAL_NOME VARCHAR(45) NOT NULL,
    FILIAL_RUA VARCHAR(45) NOT NULL,
    FILIAL_NUMRUA INT,
    FILIAL_BAIRRO VARCHAR(50) NOT NULL,
    FILIAL_CIDADE VARCHAR(50) NOT NULL,
    FILIAL_ESTADO VARCHAR(50) NOT NULL,
    FILIAL_PAIS VARCHAR(50) NOT NULL,
    FILIAL_CODPOSTAL VARCHAR(10) NOT NULL,
    FILIAL_CAPACIDADE TEXT NOT NULL
); 

#CRIANDO TABELA PRODUTOS
CREATE TABLE IF NOT EXISTS PRODUTOS(
    PROD_COD INT PRIMARY KEY,
    PROD_NOME VARCHAR(50) NOT NULL,
    PROD_DESCRICAO TEXT NOT NULL,
    PROD_ESPECTEC TEXT NOT NULL
    PROD_QUANT DECIMAL(10,3) NOT NULL,
    PROD_PRECIUNIT DECIMAL(10,2) NOT NULL,
    PROD_UNIDMEDIA VARCHAR(10) NOT NULL,
    PROD_ESTOQ_MIN DECIMAL(10,3) NOT NULL
);

#CRIAR TABELAS COM DEPENCIA DE FK (CHAVE ESTRANGEIRA)

#CRIANDO TABELA PEDIDOS
CREATE TABLE IF NOT EXISTS PEDIDOS(
    PED_COD INT PRIMARY KEY,
    PED_DATA DATE NOT NULL,
    PED_HORA TIME NOT NULL,
    PED_PREVISAO DATE NOT NULL,
    PED_STATUS ENUM('PENDENTE', 'CONCLUIDO', 'EM ESPERA') NOT NULL,
    PED_FORNECEDOR INT NOT NULL, #FK DE FORNECEDOR 
    #CRIANDO REFERENCIA PARA A FK
    CONSTRAINT FK_FORNECEDOR FOREIGN KEY(PED_FORNECEDOR)
    REFERENCES FORNECEDORES(FORNEC_COD) #REFERENCIA A CHAVE PRIMARIA
);

#CRIANDO TABELA RECEBIMENTOS
CREATE TABLE IF NOT EXISTS RECEBIMENTOS(
    RECEB_DATA DATE NOT NULL,
    RECEB_HORA TIME NOT NULL,
    RECEB_QUANT_PROD DECIMAL(10,3),
    RECEB_CONDICAO TEXT NOT NULL,
    RECEB_PEDIDOS INT PRIMARY KEY,
    CONSTRAINT FK_PEDIDOS FOREIGN KEY(RECEB_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO)
);

#CRIANDO TABELAS ASSOCIATIVAS

#CRIANDO TABELA PEDIDOS_PRODUTOS
CREATE TABLE IF NOT EXISTS PEDIDOS_PRODUTOS(
    PDPR_PEDIDOS INT,
    PDPR_PRODUTOS INT,
    PRIMARY KEY (PDPR_PEDIDOS, PDPR_PRODUTOS),
    PDPR_QUANT DECIMAL(10,3) NOT NULL,
    CONSTRAINT PDPR_FK_PEDIDOS FOREIGN KEY(PDPR_PEDIDOS) REFERENCES PEDIDOS(PED_CODIGO),
    CONSTRAINT PDPR_FK_PRODUTOS FOREIGN KEY(PDPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);

#CRIANDO TABLEA FILIAIS_PRODUTOS
CREATE TABLE IF NOT EXISTS FILIAIS_PRODUTOS(
    FLPR_FILIAL INT,
    FLPR_PRODUTOS INT,
    PRIMARY KEY (FLPR_FILIAL, FLPR_PRODUTOS),
    FLPR_QUANT DECIMAL(10,3) NOT NULL,
    CONSTRAINT FLPR_FK_FILIAIS FOREIGN KEY(FLPR_FILIAL) REFERENCES FILIAIS(FILIAL_COD),
    CONSTRAINT FLPR_FK_PRODUTOS FOREIGN KEY(FLPR_PRODUTOS) REFERENCES PRODUTOS(PROD_COD)
);

#CRIANDO TABELA FORNECEDORES_PRODUTOS
CREATE TABLE IF NOT EXISTS FORNECEDORES_PRODUTOS(
    FRPR_FORNECEDOR INT,
    FRPR_PRODUTOS INT,
    PRIMARY KEY (FRPR_FORNECEDOR, FRPR_PRODUTOS),
    CONSTRAINT FRPR_FORNECEDORES FOREIGN KEY(FRPR_FORNECEDOR),
    REFERENCES FORNECEDORES(FORNEC_COD),
    CONSTRAINT FRPR_FK_PRODUTOS FOREIGN KEY(FRPR_PRODUTOS),
    REFERENCES PRODUTOS(PROD_COD)
);

