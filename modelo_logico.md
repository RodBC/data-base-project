ALUNO(CPF_Aluno, Nome_Aluno, End_Rua, End_CEP, Cod_curso! )  
Cod_Curso → CURSO(Cod_Curso)

CURSO(Cod_Curso, Nome_Curso, Centro, Area)

CONTATOS(CPF_Aluno, Contato) 
CPF_Aluno → ALUNO(CPF_Aluno)

TURMA(Cod_Turma) 

INTERCLASSE(ID_Comp) 

CONCORRE(Cod_Turma, ID_Comp,  Posição) 
Cod_Turma → TURMA(Cod_Turma)
ID_Turma → INTERCLASSE(ID_Comp)
Posição → PREMIO(Posição )

PREMIO(Posição) 

PARTICIPA(CPF_Aluno, Cod_Turma, Período) 
CPF_Aluno → ALUNO(CPF_Aluno)
Cod_Turma → TURMA(Cod_turma)

DISCIPLINA(Cod_Disciplina, Cod_Curso, Sigla)
Cod_Curso → CURSO(Cod_Curso)

PROJETO(Cod_Disciplina, número) 
Cod_Disciplina → DISCIPLINA(Cod_Disciplina)

TRABALHA(Cod_Disciplina, número, CPF_Aluno)
(Cod_Disciplina, numero) → PROJETO(Cod_Disciplina, numero) 
CPF_Aluno → ALUNO(CPF_Aluno )

PROFESSOR(CPF_Professor, CPF_Cordenador) 
CPF_Cordenador → PROFESSOR(CPF_Cordenador)

TEM(CPF_Professor, Cod_Turma,  Cod_Disciplina ! ) 
CPF_Professor → PROFESSOR(CPF_Professor )
Cod_Turma → TURMA(Cod_Turma)
Cod_Disciplina → DISCIPLINA(Cod_Disciplina )

DEPARTAMENTO(Cod_Departamento, [CPF_Prof_chefe]! ) 
CPF_Prof_chefe → PROFESSOR(CPF_Professor)

PROFESSOR_GRADUACAO(CPF_Professor, local_da_pós) 

PROFESSOR_MESTRADO(CPF_Professor, local_do_mestrado) 

