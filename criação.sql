-- Tabela CURSO
CREATE TABLE CURSO (
    Cod_Curso INT PRIMARY KEY
);

-- Tabela ALUNO
CREATE TABLE ALUNO (
    CPF_Aluno VARCHAR(11) PRIMARY KEY,
    End_Rua VARCHAR(255),
    End_CEP VARCHAR(8),
    Cod_Curso INT NOT NULL,
    FOREIGN KEY (Cod_Curso) REFERENCES CURSO(Cod_Curso)
);

-- Tabela CONTATOS
CREATE TABLE CONTATOS (
    CPF_Aluno VARCHAR(11),
    Contato VARCHAR(255),
    PRIMARY KEY (CPF_Aluno, Contato),
    FOREIGN KEY (CPF_Aluno) REFERENCES ALUNO(CPF_Aluno)
);

-- Tabela TURMA
CREATE TABLE TURMA (
    Cod_Turma INT PRIMARY KEY
);

-- Tabela INTERCLASSE
CREATE TABLE INTERCLASSE (
    ID_Comp INT PRIMARY KEY
);

-- Tabela CONCORRE
CREATE TABLE CONCORRE (
    Cod_Turma INT,
    ID_Comp INT,
    Posição INT,
    PRIMARY KEY (Cod_Turma, ID_Comp),
    FOREIGN KEY (Cod_Turma) REFERENCES TURMA(Cod_Turma),
    FOREIGN KEY (ID_Comp) REFERENCES INTERCLASSE(ID_Comp)
);

-- Tabela PREMIO
CREATE TABLE PREMIO (
    Posição INT PRIMARY KEY
);

-- Tabela PARTICIPA
CREATE TABLE PARTICIPA (
    CPF_Aluno VARCHAR(11),
    Cod_Turma INT,
    Período VARCHAR(255),
    PRIMARY KEY (CPF_Aluno, Cod_Turma),
    FOREIGN KEY (CPF_Aluno) REFERENCES ALUNO(CPF_Aluno),
    FOREIGN KEY (Cod_Turma) REFERENCES TURMA(Cod_Turma)
);

-- Tabela DISCIPLINA
CREATE TABLE DISCIPLINA (
    Cod_Disciplina INT PRIMARY KEY,
    Cod_Curso INT,
    FOREIGN KEY (Cod_Curso) REFERENCES CURSO(Cod_Curso)
);

-- Tabela PROJETO
CREATE TABLE PROJETO (
    Cod_Disciplina INT,
    número INT,
    PRIMARY KEY (Cod_Disciplina, número),
    FOREIGN KEY (Cod_Disciplina) REFERENCES DISCIPLINA(Cod_Disciplina)
);

-- Tabela PERTENCE
CREATE TABLE PERTENCE (
    Cod_Disciplina INT,
    número INT,
    CPF_Aluno VARCHAR(11),
    PRIMARY KEY (Cod_Disciplina, número, CPF_Aluno),
    FOREIGN KEY (Cod_Disciplina, número) REFERENCES PROJETO(Cod_Disciplina, número),
    FOREIGN KEY (CPF_Aluno) REFERENCES ALUNO(CPF_Aluno)
);

-- Tabela PROFESSOR
CREATE TABLE PROFESSOR (
    CPF_Professor VARCHAR(11) PRIMARY KEY,
    CPF_Cordenador VARCHAR(11),
    FOREIGN KEY (CPF_Cordenador) REFERENCES PROFESSOR(CPF_Professor)
);

-- Tabela TEM
CREATE TABLE TEM (
    CPF_Professor VARCHAR(11),
    Cod_Turma INT,
    Cod_Disciplina INT NOT NULL,
    PRIMARY KEY (CPF_Professor, Cod_Turma),
    FOREIGN KEY (CPF_Professor) REFERENCES PROFESSOR(CPF_Professor),
    FOREIGN KEY (Cod_Turma) REFERENCES TURMA(Cod_Turma),
    FOREIGN KEY (Cod_Disciplina) REFERENCES DISCIPLINA(Cod_Disciplina)
);

-- Tabela DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    Cod_Departamento INT PRIMARY KEY,
    CPF_Prof_chefe VARCHAR(11) UNIQUE NOT NULL,
    FOREIGN KEY (CPF_Prof_chefe) REFERENCES PROFESSOR(CPF_Professor)
);

-- Tabela PROFESSOR_GRADUACAO
CREATE TABLE PROFESSOR_GRADUACAO (
    CPF_Professor VARCHAR(11) PRIMARY KEY,
    local_da_pós VARCHAR(255)
);

-- Tabela PROFESSOR_MESTRADO
CREATE TABLE PROFESSOR_MESTRADO (
    CPF_Professor VARCHAR(11) PRIMARY KEY,
    local_do_mestrado VARCHAR(255)
);
