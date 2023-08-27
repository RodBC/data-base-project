-- Povoamento da tabela CURSO
INSERT INTO CURSO (Cod_Curso) VALUES
    (1),
    (2),
    (3);

-- Povoamento da tabela ALUNO
INSERT INTO ALUNO (CPF_Aluno, End_Rua, End_CEP, Cod_Curso) VALUES
    ('12345678901', 'Rua A', '12345678', 1),
    ('23456789012', 'Rua B', '23456789', 2),
    ('34567890123', 'Rua C', '34567890', 1);

-- Povoamento da tabela TURMA
INSERT INTO TURMA (Cod_Turma) VALUES
    (101),
    (102),
    (103);

-- Povoamento da tabela INTERCLASSE
INSERT INTO INTERCLASSE (ID_Comp) VALUES
    (1),
    (2),
    (3);

-- Povoamento da tabela CONCORRE
INSERT INTO CONCORRE (Cod_Turma, ID_Comp, Posição) VALUES
    (101, 1, 2),
    (102, 2, 1),
    (103, 3, 3);

-- Povoamento da tabela PREMIO
INSERT INTO PREMIO (Posição) VALUES
    (1),
    (2),
    (3);

-- Povoamento da tabela PARTICIPA
INSERT INTO PARTICIPA (CPF_Aluno, Cod_Turma, Período) VALUES
    ('12345678901', 101, '2023/1'),
    ('23456789012', 102, '2023/1'),
    ('34567890123', 103, '2023/1');

-- Povoamento da tabela DISCIPLINA
INSERT INTO DISCIPLINA (Cod_Disciplina, Cod_Curso) VALUES
    (1, 1),
    (2, 2),
    (3, 1);

-- Povoamento da tabela PROJETO
INSERT INTO PROJETO (Cod_Disciplina, número) VALUES
    (1, 1),
    (2, 1),
    (3, 2);

-- Povoamento da tabela PERTENCE
INSERT INTO PERTENCE (Cod_Disciplina, número, CPF_Aluno) VALUES
    (1, 1, '12345678901'),
    (2, 1, '23456789012'),
    (3, 2, '34567890123');

-- Povoamento da tabela PROFESSOR
INSERT INTO PROFESSOR (CPF_Professor, CPF_Cordenador) VALUES
    ('98765432101', NULL),
    ('87654321098', '98765432101'),
    ('76543210987', '98765432101');

-- Povoamento da tabela TEM
INSERT INTO TEM (CPF_Professor, Cod_Turma, Cod_Disciplina) VALUES
    ('98765432101', 101, 1),
    ('87654321098', 102, 2),
    ('76543210987', 103, 3);

-- Povoamento da tabela DEPARTAMENTO
INSERT INTO DEPARTAMENTO (Cod_Departamento, CPF_Prof_chefe) VALUES
    (1, '98765432101'),
    (2, '87654321098'),
    (3, '76543210987');

-- Povoamento da tabela PROFESSOR_GRADUACAO
INSERT INTO PROFESSOR_GRADUACAO (CPF_Professor, local_da_pós) VALUES
    ('11111111111', 'Universidade A'),
    ('22222222222', 'Universidade B');

-- Povoamento da tabela PROFESSOR_MESTRADO
INSERT INTO PROFESSOR_MESTRADO (CPF_Professor, local_do_mestrado) VALUES
    ('33333333333', 'Universidade X'),
    ('44444444444', 'Universidade Y');
