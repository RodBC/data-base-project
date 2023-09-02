-- [1 - Group by/Having ] --> Exibir quais cursos tem exatamente 2 alunos
SELECT A.Cod_Curso, COUNT(*) AS "Quantidade de alunos"
FROM ALUNO A
GROUP BY A.Cod_Curso
HAVING COUNT(*) = 2

-- [2 - Junção interna ] --> Exibir o nome do aluno, curso do aluno e o código do curso
SELECT A.Nome_Aluno, C.Nome_Curso, C.Cod_curso
FROM ALUNO A INNER JOIN CURSO C ON (A.Cod_Curso = C.Cod_Curso)

-- [3 - Junção externa ] --> Exibir apenas os nomes dos cursos que não tem alunos.
SELECT C.Nome_Curso
FROM ALUNO A RIGHT OUTER JOIN CURSO C ON (A.Cod_Curso = C.Cod_Curso)
WHERE A.Cod_Curso IS NULL

-- [4 - Semi junção ] --> Exibir os nomes dos cursos que tem alunos
SELECT C.Nome_Curso 
FROM CURSO C
WHERE EXISTS(
    SELECT *
    FROM ALUNO A
    WHERE A.Cod_Curso = C.Cod_Curso
)

-- [5 - anti junção ] --> Exibir os nomes dos cursos que não tem alunos
SELECT C.Nome_Curso 
FROM CURSO C
WHERE NOT EXISTS(
    SELECT *
    FROM ALUNO A
    WHERE A.Cod_Curso = C.Cod_Curso
)

-- [6 - sub consulta escalar] -->  exibir o código dos cursos tem mais alunos do que a média.
SELECT A.Cod_Curso, COUNT(*)
FROM ALUNO A
GROUP BY A.Cod_Curso
HAVING COUNT(*) > (
    SELECT AVG(QTD) -- essa primeira subconsulta é escalar pois retorna 1 valor -> a média
    FROM(SELECT A.Cod_Curso, COUNT(*) AS QTD
		 FROM ALUNO A
         GROUP BY A.Cod_Curso)
)

-- [7 - Subconsulta do tipo tabela] -->  exibir a média geral de alunos em cursos.
 SELECT AVG(QTD)
    FROM(SELECT A.Cod_Curso, COUNT(*) AS QTD --essa subconsulta retorna o cod dos cursos e a qtd de alunos por cod, ou seja,
		 FROM ALUNO A                        -- várias linhas. O que caracteriza tipo tabela.
         GROUP BY A.Cod_Curso)

-- [8 - subconsulta tipo linha ] --> exibir o nome de todos os cursos em que o centro e a area são iguais ao curso do código 1.
SELECT C.Nome_Curso
FROM CURSO C
WHERE (C.Centro, C.Area) = (SELECT C.Centro, C.Area -- subconsulta tipo linha pois retorna mais de uma coluna e apenas uma linha por causa do cod_curso=1.
							FROM CURSO C
							WHERE C.Cod_Curso = 1)
