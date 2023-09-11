-- Tabela CURSO
CREATE TABLE CURSO (
    Cod_Curso NUMBER(10) PRIMARY KEY,
    Nome_Curso VARCHAR2(8 CHAR),
    Centro VARCHAR2(8 CHAR),
    Area VARCHAR2(8 CHAR)
);

-- Tabela ALUNO
CREATE TABLE ALUNO (
    CPF_Aluno VARCHAR2(11 CHAR) PRIMARY KEY,
    Nome_Aluno VARCHAR2(8 CHAR),
    End_Rua VARCHAR2(255 CHAR),
    End_CEP VARCHAR2(8 CHAR),
    Cod_Curso NUMBER(10) NOT NULL,
    FOREIGN KEY (Cod_Curso) REFERENCES CURSO(Cod_Curso)
);

-- Tabela CONTATOS
CREATE TABLE CONTATOS (
    CPF_Aluno VARCHAR2(11 CHAR),
    Contato VARCHAR2(255 CHAR),
    PRIMARY KEY (CPF_Aluno, Contato),
    FOREIGN KEY (CPF_Aluno) REFERENCES ALUNO(CPF_Aluno)
);

-- Tabela TURMA
CREATE TABLE TURMA (
    Cod_Turma NUMBER(10) PRIMARY KEY
);

-- Tabela INTERCLASSE
CREATE TABLE INTERCLASSE (
    ID_Comp NUMBER(10) PRIMARY KEY
);

-- Tabela CONCORRE
CREATE TABLE CONCORRE (
    Cod_Turma NUMBER(10),
    ID_Comp NUMBER(10),
    Posicao NUMBER(10),
    PRIMARY KEY (Cod_Turma, ID_Comp),
    FOREIGN KEY (Cod_Turma) REFERENCES TURMA(Cod_Turma),
    FOREIGN KEY (ID_Comp) REFERENCES INTERCLASSE(ID_Comp)
);

-- Tabela PREMIO
CREATE TABLE PREMIO (
    Posicao NUMBER(10) PRIMARY KEY
);

-- Tabela PARTICIPA
CREATE TABLE PARTICIPA (
    CPF_Aluno VARCHAR2(11 CHAR),
    Cod_Turma NUMBER(10),
    Periodo VARCHAR2(255 CHAR),
    PRIMARY KEY (CPF_Aluno, Cod_Turma, Periodo),
    FOREIGN KEY (CPF_Aluno) REFERENCES ALUNO(CPF_Aluno),
    FOREIGN KEY (Cod_Turma) REFERENCES TURMA(Cod_Turma)
);

-- Tabela DISCIPLINA
CREATE TABLE DISCIPLINA (
    Cod_Disciplina NUMBER(10) PRIMARY KEY,
    Cod_Curso NUMBER(10),
    Sigla VARCHAR2(8 CHAR),
    FOREIGN KEY (Cod_Curso) REFERENCES CURSO(Cod_Curso)
);

-- Tabela PROJETO
CREATE TABLE PROJETO (
    Cod_Disciplina NUMBER(10),
    numero NUMBER(10),
    PRIMARY KEY (Cod_Disciplina, numero),
    FOREIGN KEY (Cod_Disciplina) REFERENCES DISCIPLINA(Cod_Disciplina)
);

-- Tabela TRABALHA
CREATE TABLE TRABALHA (
    Cod_Disciplina NUMBER(10),
    numero NUMBER(10),
    CPF_Aluno VARCHAR2(11 CHAR),
    PRIMARY KEY (Cod_Disciplina, numero, CPF_Aluno),
    FOREIGN KEY (Cod_Disciplina, numero) REFERENCES PROJETO(Cod_Disciplina, numero),
    FOREIGN KEY (CPF_Aluno) REFERENCES ALUNO(CPF_Aluno)
);

-- Tabela PROFESSOR
CREATE TABLE PROFESSOR (
    CPF_Professor VARCHAR2(11 CHAR) PRIMARY KEY,
    CPF_Cordenador VARCHAR2(11 CHAR),
    FOREIGN KEY (CPF_Cordenador) REFERENCES PROFESSOR(CPF_Professor)
);

-- Tabela TEM
CREATE TABLE TEM (
    CPF_Professor VARCHAR2(11 CHAR),
    Cod_Turma NUMBER(10),
    Cod_Disciplina NUMBER(10) NOT NULL,
    PRIMARY KEY (CPF_Professor, Cod_Turma),
    FOREIGN KEY (CPF_Professor) REFERENCES PROFESSOR(CPF_Professor),
    FOREIGN KEY (Cod_Turma) REFERENCES TURMA(Cod_Turma),
    FOREIGN KEY (Cod_Disciplina) REFERENCES DISCIPLINA(Cod_Disciplina)
);

-- Tabela DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    Cod_Departamento NUMBER(10) PRIMARY KEY,
    CPF_Prof_chefe VARCHAR2(11 CHAR) UNIQUE NOT NULL,
    FOREIGN KEY (CPF_Prof_chefe) REFERENCES PROFESSOR(CPF_Professor)
);

-- Tabela PROFESSOR_GRADUACAO
CREATE TABLE PROFESSOR_GRADUACAO (
    CPF_Professor VARCHAR2(11 CHAR) PRIMARY KEY,
    local_da_pos VARCHAR2(255 CHAR)
);

-- Tabela PROFESSOR_MESTRADO
CREATE TABLE PROFESSOR_MESTRADO (
    CPF_Professor VARCHAR2(11 CHAR) PRIMARY KEY,
    local_do_mestrado VARCHAR2(255 CHAR)
);

-- POVOAMENTO

-- Povoamento da tabela CURSO
INSERT INTO CURSO (Cod_Curso, Nome_Curso, Centro, Area) VALUES (1, 'Curso A', 'CIN', 'Area A');
INSERT INTO CURSO (Cod_Curso, Nome_Curso, Centro, Area) VALUES (2, 'Curso B', 'CAC', 'Area B');
INSERT INTO CURSO (Cod_Curso, Nome_Curso, Centro, Area) VALUES (3, 'Curso C', 'CTG', 'Area C');

-- Povoamento da tabela ALUNO
INSERT INTO ALUNO (CPF_Aluno, Nome_Aluno, End_Rua, End_CEP, Cod_Curso) VALUES ('12345678901', 'robson', 'Rua A', '12345678', 1);
INSERT INTO ALUNO (CPF_Aluno, Nome_Aluno, End_Rua, End_CEP, Cod_Curso) VALUES ('23456789012', 'matheus','Rua B', '23456789', 2);
INSERT INTO ALUNO (CPF_Aluno, Nome_Aluno, End_Rua, End_CEP, Cod_Curso) VALUES ('34567890123', 'campos','Rua C', '34567890', 1);

-- Povoamento da tabela CONTATO
INSERT INTO CONTATOS (CPF_Aluno, Contato) VALUES ('12345678901', '1111111111');
INSERT INTO CONTATOS (CPF_Aluno, Contato) VALUES ('23456789012', '2222222222');
INSERT INTO CONTATOS (CPF_Aluno, Contato) VALUES ('34567890123', '3333333333');

-- Povoamento da tabela TURMA
INSERT INTO TURMA (Cod_Turma) VALUES (101);
INSERT INTO TURMA (Cod_Turma) VALUES (102);
INSERT INTO TURMA (Cod_Turma) VALUES (103);

-- Povoamento da tabela INTERCLASSE
INSERT INTO INTERCLASSE (ID_Comp) VALUES (1);
INSERT INTO INTERCLASSE (ID_Comp) VALUES (2);
INSERT INTO INTERCLASSE (ID_Comp) VALUES (3);

-- Povoamento da tabela CONCORRE
INSERT INTO CONCORRE (Cod_Turma, ID_Comp, Posicao) VALUES (101, 1, 2);
INSERT INTO CONCORRE (Cod_Turma, ID_Comp, Posicao) VALUES (102, 2, 1);
INSERT INTO CONCORRE (Cod_Turma, ID_Comp, Posicao) VALUES (103, 3, 3);

-- Povoamento da tabela PREMIO
INSERT INTO PREMIO (Posicao) VALUES (1);
INSERT INTO PREMIO (Posicao) VALUES (2);
INSERT INTO PREMIO (Posicao) VALUES (3);

-- Povoamento da tabela PARTICIPA
INSERT INTO PARTICIPA (CPF_Aluno, Cod_Turma, Periodo) VALUES ('12345678901', 101, '2023/1');
INSERT INTO PARTICIPA (CPF_Aluno, Cod_Turma, Periodo) VALUES ('23456789012', 102, '2023/1');
INSERT INTO PARTICIPA (CPF_Aluno, Cod_Turma, Periodo) VALUES ('34567890123', 103, '2023/1');

-- Povoamento da tabela DISCIPLINA
INSERT INTO DISCIPLINA (Cod_Disciplina, Sigla, Cod_Curso) VALUES (1, 'SI',1);
INSERT INTO DISCIPLINA (Cod_Disciplina, Sigla, Cod_Curso) VALUES (2, 'ES',2);
INSERT INTO DISCIPLINA (Cod_Disciplina, Sigla, Cod_Curso) VALUES (3, 'CC',1);

-- Povoamento da tabela PROJETO
INSERT INTO PROJETO (Cod_Disciplina, numero) VALUES (1, 1);
INSERT INTO PROJETO (Cod_Disciplina, numero) VALUES (2, 1);
INSERT INTO PROJETO (Cod_Disciplina, numero) VALUES (3, 2);

-- Povoamento da tabela TRABALHA
INSERT INTO TRABALHA (Cod_Disciplina, numero, CPF_Aluno) VALUES (1, 1, '12345678901');
INSERT INTO TRABALHA (Cod_Disciplina, numero, CPF_Aluno) VALUES (2, 1, '23456789012');
INSERT INTO TRABALHA (Cod_Disciplina, numero, CPF_Aluno) VALUES (3, 2, '34567890123');

-- Povoamento da tabela PROFESSOR
INSERT INTO PROFESSOR (CPF_Professor, CPF_Cordenador) VALUES ('98765432101', NULL);
INSERT INTO PROFESSOR (CPF_Professor, CPF_Cordenador) VALUES ('87654321098', '98765432101');
INSERT INTO PROFESSOR (CPF_Professor, CPF_Cordenador) VALUES ('76543210987', '98765432101');
    
-- Povoamento da tabela TEM
INSERT INTO TEM (CPF_Professor, Cod_Turma, Cod_Disciplina) VALUES ('98765432101', 101, 1);
INSERT INTO TEM (CPF_Professor, Cod_Turma, Cod_Disciplina) VALUES ('87654321098', 102, 2);
INSERT INTO TEM (CPF_Professor, Cod_Turma, Cod_Disciplina) VALUES ('76543210987', 103, 3);

-- Povoamento da tabela DEPARTAMENTO
INSERT INTO DEPARTAMENTO (Cod_Departamento, CPF_Prof_chefe) VALUES (1, '98765432101');
INSERT INTO DEPARTAMENTO (Cod_Departamento, CPF_Prof_chefe) VALUES (2, '87654321098');
INSERT INTO DEPARTAMENTO (Cod_Departamento, CPF_Prof_chefe) VALUES (3, '76543210987');

-- Povoamento da tabela PROFESSOR_GRADUACAO
INSERT INTO PROFESSOR_GRADUACAO (CPF_Professor, local_da_pos) VALUES ('98765432101', 'Universidade A');
INSERT INTO PROFESSOR_GRADUACAO (CPF_Professor, local_da_pos) VALUES ('87654321098', 'Universidade B');

-- Povoamento da tabela PROFESSOR_MESTRADO
INSERT INTO PROFESSOR_MESTRADO (CPF_Professor, local_do_mestrado) VALUES ('76543210987', 'Universidade X');
