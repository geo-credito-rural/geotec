
---------------- Exemplos de comandos em SQL   
---------------- Fevereiro de 2026

--- 1. e 2. Criação das tabelas
CREATE TABLE Instrutor ( 
    InstrutorID   	INT   			NOT NULL,
    CPF				INT				NOT NULL  UNIQUE,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Endereco   		VARCHAR( 60 ),
    CONSTRAINT InstrutorPK PRIMARY KEY (InstrutorID) 
);

CREATE TABLE Aluno ( 
    AlunoID   		INT   			NOT NULL,
    CPF				INT				NOT NULL  UNIQUE,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Endereco   		VARCHAR( 60 ),
    CONSTRAINT AlunoPK PRIMARY KEY (AlunoID) 
);

CREATE TABLE Escola ( 
    EscolaID   		INT   			NOT NULL,
    CNPJ			INT				NOT NULL  UNIQUE,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Endereco   		VARCHAR( 60 ),
    CONSTRAINT EscolaPK PRIMARY KEY (EscolaID) 
);

CREATE TABLE Curso ( 
    CursoID   		INT   			NOT NULL,
    Nome  			VARCHAR( 30 )  	NOT NULL,
    Carga_horaria	INT 			NOT NULL,
    Ementa			VARCHAR( 500 )	,
    EscolaID        INT 			NOT NULL,
    
    CONSTRAINT CursoPK PRIMARY KEY (CursoID), 
    
    CONSTRAINT CursoEscolaFK 	FOREIGN KEY (EscolaID) 
    							REFERENCES Escola(EscolaID) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE
);

CREATE TABLE Turma ( 
    TurmaID   		INT   			NOT NULL,
    Data_inicio  	DATE  			NOT NULL,
    Data_termino	DATE 			,
    CursoID        	INT 			NOT NULL,
    InstrutorID     INT 			NOT NULL,
    
    CONSTRAINT TurmaPK PRIMARY KEY (TurmaID), 
    
    CONSTRAINT TurmaCursoFK 	FOREIGN KEY (CursoID) 
    							REFERENCES Curso(CursoID) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE,
    							
    CONSTRAINT TurmaInstrutorFK FOREIGN KEY (InstrutorID) 
    							REFERENCES Instrutor(InstrutorID) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE
);

CREATE TABLE Matricula ( 
    TurmaID     	INT 			NOT NULL,
    AlunoID     	INT 			NOT NULL,
    Nota_final		NUMERIC(4,2)	,
    Presenca		INT             ,
    
    
    CONSTRAINT MatriculaPK PRIMARY KEY (TurmaID, AlunoID), 
    
    CONSTRAINT MatriculaTurmaFK 	FOREIGN KEY (TurmaID) 
    							REFERENCES Turma(TurmaID) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE,
    							
    CONSTRAINT MatriculaAlunoFK FOREIGN KEY (AlunoID) 
    							REFERENCES Aluno(AlunoID) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE
);


-- 3. Use os comandos SQL para inserir dados na tabela Instrutor 
INSERT INTO Instrutor VALUES(1, 11111, 'Rodrigo Carvalho', 'Rua Alfa, num 50, Centro');
INSERT INTO Instrutor VALUES(2, 22222, 'Jacqueline França', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Instrutor VALUES(3, 33333, 'Leandro Siqueira', 'Rua Nelson Davila, num 120, Centro');
INSERT INTO Instrutor VALUES(4, 33333, 'Diego Faria', 'Rua Siqueira Campos, num 80, Jd Apolo');
-- OBS: Erro ao inserir o último registro, pois o segundo atributo (CPF) deve ter valores únicos

-- 4. Use os comandos SQL para inserir dados na tabela Aluno
INSERT INTO Aluno VALUES(1, 12222, 'Jose Vitor Ferreira Fernandes Gomes Dias', 'Rua Alfa, num 100, Centro');
INSERT INTO Aluno VALUES(2, 32222, 'Rodrigo Gomes Dias', 'Rua Sete de Setembro, num 200, Alvorada');
INSERT INTO Aluno VALUES(3, 42222, 'Daniel Ribeiro Alvarenga', 'Rua Nelson Davila, num 150, Centro');
INSERT INTO Aluno VALUES(4, 52222, 'Gustavo Ferreira', 'Rua Lumem, num 140, Jd Apolo');
INSERT INTO Aluno VALUES(5, 62222, 'Marcelo Reis Fernandes', 'Rua Siqueira Campos, num 80, Jd Apolo');
INSERT INTO Aluno VALUES(6, 72222, 'Renata Fernandes Carvalho', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Aluno VALUES(7, 82222, 'Debora Ribeiro Reis', 'Rua Lumem, num 140, Jd Apolo');
INSERT INTO Aluno VALUES(8, 92222, 'Daniela Reis Barbosa', 'Rua Nelson Davila, num 120, Centro');
INSERT INTO Aluno VALUES(9, 13333, 'Luciane Cardoso', 'Rua Siqueira Campos, num 80, Jd Apolo');
INSERT INTO Aluno VALUES(10, 91919, 'Claudio Cardoso', 'Rua Lumem, num 140, Jd Apolo');
INSERT INTO Aluno VALUES(11, 81818, 'Marina Reis Alvarenga', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Aluno VALUES(12, 71717, 'Sabrina Carvalho', 'Rua Nelson Davila, num 120, Centro');
INSERT INTO Aluno VALUES(13, 61616, 'Julio Cesar Dias', 'Rua Siqueira Campos, num 80, Jd Apolo');
INSERT INTO Aluno VALUES(14, 51515, 'Regiane Limeira', 'Rua Sete de Setembro, num 620, Alvorada');
INSERT INTO Aluno VALUES(15, 41414, 'Augusto Dias Gomes', 'Rua Nelson Davila, num 120, Centro');

-- OBS: Erro ao inserir o primeiro registro, temos que aumentar o range do atributo nome
ALTER TABLE Aluno ALTER COLUMN Nome TYPE VARCHAR( 50 ) 


-- 5. Use os comandos SQL para inserir dados na tabela Escola, Curso, Turma e Matricula
INSERT INTO Escola VALUES(1, 11111, 'InfoSys', 'Rua Nelson Davila, num 400, Centro');
INSERT INTO Escola VALUES(2, 22222, 'Inova', 'Rua Sete de Setembro, num 800, Alvorada');
INSERT INTO Escola VALUES(3, 33333, 'CodSys', 'Rua Alfa, num 1030, Apolo');

INSERT INTO Curso VALUES(1, 'Linux - Introduction', 120, '', 1);
INSERT INTO Curso VALUES(2, 'Linux - Advanced', 120, '', 1);
INSERT INTO Curso VALUES(3, 'Windows - Introduction', 120, '', 1);
INSERT INTO Curso VALUES(4, 'Windows - Advanced', 120, '', 1);
INSERT INTO Curso VALUES(5, 'C++ Programming Language', 240, '', 3);
INSERT INTO Curso VALUES(6, 'Java Programming Language', 240, '', 3);
INSERT INTO Curso VALUES(7, 'Python', 120, '', 3);
INSERT INTO Curso VALUES(8, 'Database System and SQL', 240, '', 2);
INSERT INTO Curso VALUES(9, 'Data Science', 240, '', 2);
INSERT INTO Curso VALUES(10, 'Geoinformatics', 240, '', 2);

INSERT INTO Turma VALUES(1, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-06-15', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Turma VALUES(2, to_date('2015-08-15', 'YYYY-MM-DD'), to_date('2015-12-15', 'YYYY-MM-DD'), 2, 1);
INSERT INTO Turma VALUES(3, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 1, 1);
INSERT INTO Turma VALUES(4, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-12-15', 'YYYY-MM-DD'), 2, 1);
INSERT INTO Turma VALUES(5, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-06-15', 'YYYY-MM-DD'), 3, 2);
INSERT INTO Turma VALUES(6, to_date('2015-08-15', 'YYYY-MM-DD'), to_date('2015-12-15', 'YYYY-MM-DD'), 4, 2);
INSERT INTO Turma VALUES(7, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 3, 2);
INSERT INTO Turma VALUES(8, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-12-15', 'YYYY-MM-DD'), 4, 2);
INSERT INTO Turma VALUES(9, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-06-15', 'YYYY-MM-DD'), 7, 3);
INSERT INTO Turma VALUES(10, to_date('2016-08-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 7, 3);
INSERT INTO Turma VALUES(11, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-06-15', 'YYYY-MM-DD'), 7, 3);
INSERT INTO Turma VALUES(12, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 5, 4);
INSERT INTO Turma VALUES(13, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-11-15', 'YYYY-MM-DD'), 5, 4);
INSERT INTO Turma VALUES(14, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 6, 3);
INSERT INTO Turma VALUES(15, to_date('2017-02-15', 'YYYY-MM-DD'), to_date('2017-11-15', 'YYYY-MM-DD'), 6, 3);
INSERT INTO Turma VALUES(16, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-11-15', 'YYYY-MM-DD'), 8, 1);
INSERT INTO Turma VALUES(17, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 8, 1);
INSERT INTO Turma VALUES(18, to_date('2015-02-15', 'YYYY-MM-DD'), to_date('2015-11-15', 'YYYY-MM-DD'), 10, 4);
INSERT INTO Turma VALUES(19, to_date('2016-02-15', 'YYYY-MM-DD'), to_date('2016-11-15', 'YYYY-MM-DD'), 10, 4);

-- TurmaID, AlunoID, Nota e Presenca
INSERT INTO Matricula VALUES(1, 1, '8.4', 80);   
INSERT INTO Matricula VALUES(1, 2, '6.4', 85);   
INSERT INTO Matricula VALUES(1, 3, '5.0', 67);   
INSERT INTO Matricula VALUES(1, 4, '9.4', 100);   
INSERT INTO Matricula VALUES(1, 5, '8.7', 100); 
  
INSERT INTO Matricula VALUES(2, 1, '7.4', 80);   
INSERT INTO Matricula VALUES(2, 2, '7.4', 85);   
INSERT INTO Matricula VALUES(2, 3, '8.0', 80);   
INSERT INTO Matricula VALUES(2, 4, '7.4', 70);   
INSERT INTO Matricula VALUES(2, 5, '9.7', 100);   

INSERT INTO Matricula VALUES(3, 6, '8.4', 80);   
INSERT INTO Matricula VALUES(3, 7, '6.4', 85);   
INSERT INTO Matricula VALUES(3, 8, '5.0', 67);   
INSERT INTO Matricula VALUES(3, 9, '9.4', 100);   
INSERT INTO Matricula VALUES(3, 10, '8.7', 100); 
  
INSERT INTO Matricula VALUES(4, 6, '7.4', 80);   
INSERT INTO Matricula VALUES(4, 7, '9.4', 85);   
INSERT INTO Matricula VALUES(4, 8, '8.0', 80);   
INSERT INTO Matricula VALUES(4, 9, '7.4', 70);   
INSERT INTO Matricula VALUES(4, 10, '9.7', 100); 

INSERT INTO Matricula VALUES(9, 11, '7.4', 80);   
INSERT INTO Matricula VALUES(9, 12, '9.4', 85);   
INSERT INTO Matricula VALUES(9, 13, '8.0', 70);  

INSERT INTO Matricula VALUES(10, 14, '7.4', 80);   
INSERT INTO Matricula VALUES(10, 15, '9.4', 85);   
INSERT INTO Matricula VALUES(10, 1, '8.0', 70);  

INSERT INTO Matricula VALUES(11, 2, '7.4', 80);   
INSERT INTO Matricula VALUES(11, 3, '9.4', 85);   
INSERT INTO Matricula VALUES(11, 4, '8.0', 70);  


-- 6. Recupere as informações do catálogo:
-- a. Quais esquemas existem nesse banco de dados?
SELECT DISTINCT table_schema FROM information_schema.tables 

-- b. Recupere as informações sobre as tabelas do esquema “public“.
SELECT * FROM information_schema.tables WHERE table_schema = 'public'

-- c. Recupere as informações sobre todas as colunas de todas as tabelas do esquema “public”.
SELECT * FROM information_schema.columns WHERE table_schema = 'public'

-- d. Recupere as informações sobre todas as restrições (constraints) de todas as tabelas do esquema “public”.
SELECT * FROM information_schema.table_constraints WHERE table_schema = 'public'

-- 7. Selecione todos alunos ordenados pelo nome
SELECT * FROM aluno ORDER BY nome;

-- 8. Quantos cursos estão cadastrados no banco de dados?
SELECT COUNT(*) AS total FROM curso;

-- 9. Quantas turmas foram ministradas pelo instrutor 'Leandro Siqueira'?
SELECT COUNT(*) AS total_leandro 
	FROM instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid
	WHERE instrutor.nome = 'Leandro Siqueira';
	
-------- Resposta: 5

-- 10. Quantas horas de curso foram ministradas pelo instrutor 'Leandro Siqueira'?
SELECT SUM(curso.carga_horaria) AS total_leandro 
	FROM (instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid)
		  INNER JOIN curso ON turma.cursoid = curso.cursoid	
	WHERE instrutor.nome = 'Leandro Siqueira';
	
-------- Resposta: 840

-- 11. Quantas turmas foram ministradas por cada instrutor?  
SELECT instrutor.nome AS instrutor, COUNT(turma.*) AS total_turmas 
FROM instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid
	GROUP BY (instrutor.nome)
	ORDER BY (instrutor.nome);
	
-------- Resposta: 4 / 4 / 5 / 6

-- 12. Quantas horas de curso foram ministradas por cada instrutor ?
SELECT instrutor.nome AS instrutor, SUM(carga_horaria) AS total_horas 
	FROM (instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid)
		  INNER JOIN curso ON turma.cursoid = curso.cursoid	
	GROUP BY (instrutor.nome)
	ORDER BY (instrutor.nome);

-------- Resposta: 960 / 480 / 840 / 960


-- 13. Quais instrutores deram mais que 850 horas de curso?
SELECT instrutor.nome AS instrutor, SUM(carga_horaria) AS total_horas 
	FROM (instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid)
		  INNER JOIN curso ON turma.cursoid = curso.cursoid	
	GROUP BY (instrutor.nome)
	HAVING SUM(carga_horaria) > 850
	ORDER BY (instrutor.nome);
	
-------- Resposta: Diego / Rodrigo

-- 14. Se cada instrutor cobra 100,00 por hora para ministrar cursos, 
-- quanto cada instrutor recebeu por ano?
SELECT instrutor.nome, EXTRACT(YEAR FROM turma.data_inicio) AS ano, SUM(carga_horaria)*100 AS valor_total 
	FROM (instrutor INNER JOIN turma ON instrutor.instrutorid = turma.instrutorid)
		  INNER JOIN curso ON turma.cursoid = curso.cursoid	
	GROUP BY (instrutor.nome, EXTRACT(YEAR FROM turma.data_inicio))
	ORDER BY (instrutor.nome);
	

-- 15. Quantas turmas cada curso teve por ano? 
SELECT curso.nome, EXTRACT(YEAR FROM turma.data_inicio) AS ano, COUNT(turma.turmaid) 
	FROM turma INNER JOIN curso ON turma.cursoid = curso.cursoid	
	GROUP BY (curso.nome, EXTRACT(YEAR FROM turma.data_inicio))
	ORDER BY (curso.nome);


-- 16. Quais cursos o aluno 'Rodrigo Gomes Dias' cursou e qual foi a nota dele em cada um?  
SELECT aluno.nome, curso.nome, matricula.nota_final 
	FROM ((matricula INNER JOIN aluno ON matricula.alunoid = aluno.alunoid)
	INNER JOIN turma ON matricula.turmaid = turma.turmaid) 
	INNER JOIN curso ON turma.cursoid = curso.cursoid
  WHERE aluno.nome =  'Rodrigo Gomes Dias'
  ORDER BY (curso.nome);

-- 17. Crie uma view que contenha o histórico dos alunos com as seguintes
-- informações: nome do aluno, CPF do aluno, endereco do aluno, curso ministrado, data de inicio e 
-- termino do curso, nome do instrutor do curso, carga horaria, nota final, presença 

CREATE VIEW historico (aluno_nome, aluno_cpf, aluno_endereco, curso_nome, data_inicio, 
data_termino, instrutor_nome, carga_horaria, nota_final, presenca)
	AS
	SELECT aluno.nome, aluno.cpf, aluno.endereco, curso.nome, turma.data_inicio,
	turma.data_termino, instrutor.nome, curso.carga_horaria, matricula.nota_final, matricula.presenca
	FROM (((aluno INNER JOIN matricula ON aluno.alunoid = matricula.alunoid)
			INNER JOIN turma ON matricula.turmaid = turma.turmaid)
			INNER JOIN curso ON turma.cursoid = curso.cursoid)
			INNER JOIN instrutor ON turma.instrutorid = instrutor.instrutorid;
			


SELECT * FROM historico ORDER BY aluno_nome;


-- 18. Insira uma nova turma na tabela Turma  
INSERT INTO turma VALUES(
	...,
	(SELECT id FROM table WHERE nome = x),
	(SELECT id FROM table WHERE nome = Y),
	...);   

	
-- 19. Altere o nome do instrutor "Diego Faria" para "Diego Garcia Faria"
UPDATE instrutor
	SET nome = 'Diego Garcia Faria'
	WHERE nome = 'Diego Faria';

	
-- 20. Aumente a nota de todos alunos em 10% 
UPDATE matricula
	SET nota_final = nota_final*1.1;


-- 21. Remova o instrutor "Rodrigo Carvalho" da tabela instrutor  
DELETE FROM instrutor WHERE nome = 'Rodrigo Carvalho';

SELECT TurmaID FROM turma;

-- Remova todos os instrutores da tabela "Instrutor"
DELETE FROM instrutor;

SELECT TurmaID FROM turma;

------ OBS: Observe o que acontece com as turmas associadas aos instrutores


-- 22. Adicione um atributo "valor_hora" na tabela "Instrutor" 
ALTER TABLE instrutor
	ADD valor_hora NUMERIC(10, 2);

-- 23. Mude o atributo "CNPJ" da tabela "Escola" para um tipo textual
ALTER TABLE escola
	ALTER COLUMN cnpj TYPE VARCHAR(50) 

-- 24. Renomeie o atributo "CNPJ" para "CNPJ_Escola"
ALTER TABLE escola
	RENAME COLUMN CNPJ to CNPJ_Escola;

-- 25. Remova o atributo "CNPJ_Escola"
ALTER TABLE escola
	DROP COLUMN CNPJ_Escola;

-- 26. Remova todos os registros da tabela "Instrutor"
------ OBS: Observe o que acontece com os registros das tabelas que recebem 
------- o atributo "InstrutorID" como foreign key 
DELETE FROM instrutor;

-- 27. Remova o atributo "InstrutorID" da tabela "Instrutor"
ALTER TABLE instrutor
	DROP COLUMN instrutorid CASCADE;

-- 28. Remova a tabela "Instrutor" 
DROP TABLE instrutor;

DROP TABLE instrutor CASCADE;

------ OBS: Observe o que acontece com as restrições da tabela turma 
SELECT * FROM information_schema.table_constraints 
WHERE table_schema = 'public'
AND table_name = 'turma'


-- 29. Remova todas as tabelas do banco (esquema e conteúdo)
DROP TABLE Instrutor CASCADE;
DROP TABLE Escola CASCADE;
DROP TABLE Curso CASCADE;
DROP TABLE Aluno CASCADE; 
DROP TABLE Turma CASCADE; 
DROP TABLE Matricula CASCADE; 

SELECT * FROM information_schema.tables 
WHERE table_schema = 'public';


-- 30. Crie novamente as tabelas do banco de dados usando os scripts acima


-- 31. Crie uma nova tabela chamada “vendedor_comissao” para armazenar a comissão de 
-- cada vendedor. Essa tabela terá o id de cada vendedor, que será PRIMARY KEY e FOREIGN KEY, 
-- e o valor da comissão. 
 CREATE TABLE vendedor_comissao
(
   vendedorid 	INT NOT NULL,
   comissao  	REAL,	

   CONSTRAINT VendedorComissaoPK  PRIMARY KEY (vendedorid),
   CONSTRAINT VendedorComissaoVendedorFK  FOREIGN KEY (vendedorid) 
    							REFERENCES Vendedor(vendedorid) 
    							ON DELETE CASCADE 
    							ON UPDATE CASCADE   	
)

-- 32. Crie uma trigger: para cada vendedor inserido no banco, a trigger
-- deve inserir um novo registro na tabela “vendedor_comissao” 
-- contendo o id desse novo vendedor e o valor 0.0 para sua comissão

CREATE FUNCTION insert_vendedor_comissao() RETURNS trigger AS $vend_comissao$
    BEGIN
        INSERT INTO vendedor_comissao(vendedorid, comissao) VALUES (NEW.vendedorid, 0.0); 
        RETURN NEW;
    END;
$vend_comissao$ LANGUAGE plpgsql;


CREATE TRIGGER vendedor_comissao_trigger_1
AFTER INSERT ON vendedor
FOR EACH ROW  
EXECUTE PROCEDURE insert_vendedor_comissao();

-- 33. Crie uma trigger: cada vez que um novo pedido é inserido ou atualizado no banco de dados 
-- (tabela “pedido”), a trigger deve atualizar a comissão na tabela “vendedor_comissao” 
-- do vendedor que efetuou o pedido. 
CREATE FUNCTION update_vendedor_comissao() RETURNS trigger AS $vend_comissao$
    BEGIN
        UPDATE vendedor_comissao  
		SET comissao = comissao + 
		(SELECT NEW.quantidade * produto.precounitario * 0.1 FROM produto WHERE produto.produtoid = NEW.produtoid)
		WHERE vendedor_comissao.vendedorid = NEW.vendedorid;
        RETURN NEW;
    END;
$vend_comissao$ LANGUAGE plpgsql;

CREATE TRIGGER vendedor_comissao_trigger_2
AFTER INSERT OR UPDATE OF quantidade, vendedorid ON pedido
FOR EACH ROW  
EXECUTE PROCEDURE update_vendedor_comissao();

-- 34. Insira uma nova coluna na tabela vendedor com o salário de cada uma: 
ALTER TABLE vendedor ADD salario real;
 
UPDATE vendedor SET salario = 3500.00 WHERE nome = 'Jose Marcio';
UPDATE vendedor SET salario = 3000.00 WHERE nome = 'Luis Claudio';
UPDATE vendedor SET salario = 2500.00 WHERE nome = 'Andre Carlos';

-- 35. Altere a trigger acima para que 
-- nenhum vendedor ganhe uma comissão com o valor acima do seu salário. Ou seja, toda vez
-- que o vendedor efetuar um pedido, a trigger deve checar se o novo valor da comissão
-- é maior do que o salario do vendedor. Se for maior, o vendedor deve receber exatamente
-- o valor do seu salário de comissão. 

CREATE OR REPLACE FUNCTION update_vendedor_comissao() 
RETURNS TRIGGER AS $vend_comissao$

    DECLARE
    	v_nova_comissao real := 0.;
    	v_comissao real := 0.;
    	v_salario real := 0.;
    BEGIN
        
         SELECT NEW.quantidade * produto.precounitario * 0.1 
         		INTO v_nova_comissao
         FROM produto WHERE produtoid = NEW.produtoid;
        				 
         SELECT comissao INTO v_comissao 
         FROM vendedor_comissao WHERE vendedorid = NEW.vendedorid;
        
         SELECT salario INTO v_salario FROM vendedor 
         WHERE vendedorid = NEW.vendedorid;
        
         IF (v_salario >= (v_comissao + v_nova_comissao)) THEN
        	UPDATE vendedor_comissao  
			SET comissao = v_comissao + v_nova_comissa
			WHERE vendedor_comissao.vendedorid = NEW.vendedorid;
        	RETURN NEW;
         ELSE
        	UPDATE vendedor_comissao  
			SET comissao = v_salario
			WHERE vendedor_comissao.vendedorid = NEW.vendedorid;
        	RETURN NEW;
        END IF;
    END;
$vend_comissao$ LANGUAGE plpgsql;


 
delete from cliente;
delete from vendedor;
delete from produto;
delete from fornecedor;
delete from pedido;







 
 


