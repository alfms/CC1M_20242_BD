--CRIAR BANCO DE DADOS
CREATE DATABASE EST_CASO_II;

--USAR BANCO DE DADOS
USE EST_CASO_II;

--CRIANDO TABELAS SEM FK
CREATE TABLE IF NOT EXISTS PASSAGEIROS(
    CPF_PASSAGEIROS INT PRIMARY KEY,
    NOME_PASSAGEIROS VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS AERONAVES(
    ID_AERONAVES INT PRIMARY KEY,
    MODELO_AERONAVES VARCHAR(50),
    CAPACIDADE_AERONAVES INT,
    VOOS_AERONAVES INT
);

CREATE TABLE IF NOT EXISTS FUNCIONARIOS(
    CPF_FUNCIONARIOS INT PRIMARY KEY,
    NOME_FUNCIONARIOS VARCHAR(50),
    CARGO_FUNCIONARIOS VARCHAR(50)
);

--CRIANDO TABELAS COM FK
CREATE TABLE IF NOT EXISTS VOOS(
    ID_VOO INT PRIMARY KEY,
    DATA_VOOS DATE,
    HORA_VOOS TIME,
    ORIGEM_VOOS VARCHAR(50),
    DESTINO_VOOS VARCHAR(50),
    ID_RESERVAS INT NOT NULL, --REFERENCIA FK
    CONSTRAINT FK_RESERVAS FOREIGN KEY (ID_RESERVAS), 
    REFERENCES RESERVAS(ID_RESERVAS)
);

CREATE TABLE IF NOT EXISTS AEROPORTOS(
    ID_AEROPORTO INT PRIMARY KEY,
    NOME_AEROPORTO VARCHAR(50),
    CIDADE_AEROPORTO VARCHAR(50),
    ESTADO_AEROPORTO VARCHAR(50),
    PAIS_AEROPORTO VARCHAR(50)
    ID_AERONAVES INT NOT NULL, --REFERENCIA FK
    --INTRODUZINDO FK
    CONSTRAINT FK_AERONAVES FOREIGN KEY (ID_AERONAVES),
    REFERENCES AERONAVES(ID_AERONAVES)
);

CREATE TABLE IF NOT EXISTS RESERVAS(
    ID_RESERVAS INT PRIMARY KEY,
    CPF_PASSAGEIROS INT NOT NULL, --REFERENCIA FK
    ID_VOO INT NOT NULL, --REFERENCIA FK
    --INTRODUZINDO FK
    CONSTRAINT FK_PASSAGEIROS FOREIGN KEY (CPF_PASSAGEIROS),
    REFERENCES PASSAGEIROS(CPF_PASSAGEIROS),
    CONSTRAINT FK_VOO FOREIGN KEY (ID_VOO),
    REFERENCES VOOS(ID_VOO),
);

CREATE TABLE IF NOT EXISTS ENDERECO(
    RUA_ENDERECO VARCHAR(50),
    NUMRUA_ENDERECO INT,
    BAIRRO_ENDERECO VARCHAR(50),
    CIDADE_ENDERECO VARCHAR(50),
    ESTADO_ENDERECO VARCHAR(50),
    PAIS_ENDERECO VARCHAR(50),
    CEP_ENDERECO VARCHAR(10),
    CPF_PASSAGEIROS INT NOT NULL, --REFERENCIA FK
    --INTRODUZINDO FK
    CONSTRAINT FK_PASSAGEIROS FOREIGN KEY (CPF_PASSAGEIROS),
    REFERENCES PASSAGEIROS(CPF_PASSAGEIROS)
);

CREATE TABLE IF NOT EXISTS TELEFONE(
    NUM_TEL VARCHAR(15),
    CPF_PASSAGEIROS INT NOT NULL, --REFERENCIA FK
    --INTRODUZINDO FK
    CONSTRAINT FK_PASSAGEIROS FOREIGN KEY (CPF_PASSAGEIROS),
    REFERENCES PASSAGEIROS(CPF_PASSAGEIROS)
);

--ALTERANDO TABELAS
ALTER TABLE PASSAGEIROS(
    ADD COLUMN email VARCHAR(50),
    MODIFY COLUMN email VARCHAR(100) NOT NULL,
    CHANGE COLUMN email TO EMAIL_PASSAGEIROS,
    DROP COLUMN EMAIL_PASSAGEIROS
);

ALTER TABLE AERONAVES(
    ADD COLUMN ANO_FABRICACAO INT,
    MODIFY COLUMN ANO_FABRICACAO INT NOT NULL,
    CHANGE COLUMN ANO_FABRICACAO TO ANO_FABRICACAO_AERONAVES,
    DROP COLUMN ANO_FABRICACAO_AERONAVES
);

ALTER TABLE FUNCIONARIOS(
    ADD COLUMN SALARIO DECIMAL(10,2),
    MODIFY COLUMN SALARIO DECIMAL(10,2) NOT NULL,
    CHANGE COLUMN SALARIO TO SALARIO_FUNCIONARIOS,
    DROP COLUMN SALARIO_FUNCIONARIOS
);

ALTER TABLE VOOS(
    ADD COLUMN tempo INT,
    MODIFY COLUMN tempo INT NOT NULL,
    CHANGE COLUMN tempo TO TEMPO_DE_VOO,
    DROP COLUMN TEMPO_DE_VOO
);

ALTER TABLE AEROPORTOS(
    ADD COLUMN wifi INT,
    MODIFY COLUMN wifi INT NOT NULL,
    CHANGE COLUMN wifi TO WIFI_AEROPORTOS,
    DROP COLUMN WIFI_AEROPORTOS
);

ALTER TABLE RESERVAS(
    ADD COLUMN bagagem INT,
    MODIFY COLUMN bagagem INT NOT NULL,
    CHANGE COLUMN bagagem TO QNTD_BAGAGEM_RESERVAS,
    DROP COLUMN QNTD_BAGAGEM_RESERVAS
);

ALTER TABLE ENDERECO(
    ADD COLUMN COMPLEMENTO VARCHAR(50),
    MODIFY COLUMN COMPLEMENTO VARCHAR(50) NOT NULL,
    CHANGE COLUMN COMPLEMENTO TO COMPLEMENTO_ENDERECO,
    DROP COLUMN COMPLEMENTO_ENDERECO
);

ALTER TABLE TELEFONE(
    ADD COLUMN ddd VARCHAR(15),
    MODIFY COLUMN ddd VARCHAR(15) NOT NULL,
    CHANGE COLUMN ddd TO DDD_TELEFONE,
    DROP COLUMN DDD_TELEFONE
);