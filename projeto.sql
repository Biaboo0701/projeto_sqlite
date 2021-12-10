CREATE DATABASE escola;
USE escola;

CREATE TABLE cursos (
     cursos_id   integer PRIMARY KEY AUTOINCREMENT 
    ,cursos_nome   VARCHAR(50) NOT NULL
);


INSERT INTO cursos (cursos_nome) 
VALUES ('Matemática Básica'),
('Algebra'),
('Aritmética'),
('Cálculo 1'),
('Cálculo 2'),
('Cálculo 3'),
('Cálculo 4'),
('Cálculo 5'),
('Cálculo 6'),
('Cálculo 7'),
('Cálculo 8');

CREATE TABLE cursos_req (
     cursos_id INT(8) NOT NULL
    ,cursos_id_req INT(8) NOT NULL
    ,CONSTRAINT `fk_cursos_req` FOREIGN KEY (`cursos_id`) REFERENCES `cursos` (`cursos_id`)
    ,CONSTRAINT `fk_cursos_0` FOREIGN KEY (`cursos_id_req`) REFERENCES `cursos` (`cursos_id`)
);

INSERT INTO cursos_req(cursos_id, cursos_id_req) 
VALUES (4, 1),
(11, 1),
(5, 2),
(9, 3),
(10, 2),
(6, 1),
(4, 3),
(7, 3),
(5, 2),
(8, 1),
(7, 1),
(7, 2);

-- Consultar os cursos desejados e seus respectivos requisitos:
SELECT 
    cursos.cursos_nome As Curso_requerido,
    cursos_pre.cursos_nome AS Requisito
FROM cursos_req
INNER JOIN cursos AS cursos_pre ON (
    cursos_req.cursos_id_req = cursos_pre.cursos_id
)
INNER JOIN cursos ON (  
    cursos_req.cursos_id = cursos.cursos_id   
);

--Consultando todos os id requisitos do id 7:
SELECT * FROM cursos_req WHERE cursos_req.cursos_id = 7;

--Listando todos os ids de requisição e seus respectivos id cursos:
SELECT * FROM cursos_req WHERE cursos_req.cursos_id;

-- Quantidades de vezes que cada requisito aparece:
SELECT 
   count(cursos.cursos_nome) As Curso_requerido,
    cursos_pre.cursos_nome AS Requisito
FROM cursos_req
INNER JOIN cursos AS cursos_pre ON
    cursos_req.cursos_id_req = cursos_pre.cursos_id
INNER JOIN cursos ON  
    cursos_req.cursos_id = cursos.cursos_id
group by cursos_id_req
order by  cursos_id_req;