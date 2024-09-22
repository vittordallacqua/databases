/* 
Lista 6
Nome.: Vittor Dallacqua (Ciência da Computação - Noite)
Prof.: Jonathan Morris Samara
*/

# 01:

CREATE TABLE Autores(
	id_autor INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL,
	nacionalidade VARCHAR(50)
);

# 02:

CREATE TABLE Livros(
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT,
    CONSTRAINT fk_id_autor FOREIGN KEY (autor_id) REFERENCES Autores(id_autor)
);

# 03:   

ALTER TABLE Usuarios ADD email VARCHAR(100) UNIQUE;

SHOW INDEX FROM Usuarios 
/* Para verificar se há restrições de unicidade em uma coluna */

# 04:

CREATE TABLE Empregados(
    id_empregados INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL,
    CHECK (salario > 0)
);

# 05:

ALTER TABLE Produtos CHECK (preco > 0);

# 06:

ALTER TABLE Livros DROP FOREIGN KEY fk_id_autor;

ALTER TABLE Livros DROP INDEX fk_id_autor;
/* Para excluir o index da chave estrangeira e se certificar de que ela foi excluída. */

# 07

CREATE TABLE Pedidos(
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    data_pedido DATE NOT NULL,
    CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES Clientes(id_cliente)
);

ALTER TABLE Pedidos DROP FOREIGN KEY fk_cliente_id;

/* 
A remoção de uma chave estrangeira implica diretamente na integridade de um determinado banco,
como a incosistência nos dados que entram, pois não há a garantia de que a referência entre as tabelas 
estão corretas. Nesse caso, ao excluir um registro ('cliente') na tabela pai ('Clientes'), os registros ('pedidos') 
na tabela 'Pedidos' não serão excluidos de forma automática, levando a registros inválidos (pedidos sem cliente).
*/

# 08:

CREATE TABLE vendas(
	produto_id INT,
    vendedor_id INT, 
    PRIMARY KEY (produto_id, vendedor_id)
);

# 09: 

CREATE TABLE Categorias(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE Produtos(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    categoria_id INT,
    descricao TEXT,
    CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES categorias(id_categoria)
);

INSERT INTO categorias (nome)
VALUES
	('Eletrônicos'),
    ('Vestuário'),
    ('Casa');

SELECT id_categoria, nome FROM categorias

/* 
id_categoria    nome
    1	      Eletrônicos
    2	      Vestuário
    3	      Casa
*/
	
INSERT INTO produtos (nome, categoria_id)
VALUES
	('Smartphone XYZ', 4);

/* 13:33:15	INSERT INTO produtos (nome, categoria_id) VALUES  
('Smartphone XYZ', 4)	Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
(`sys`.`produtos`, CONSTRAINT `fk_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id_categoria`))	
0.000 sec */ 

# 10: 

INSERT INTO autores (nome)
VALUES
	('Clarice Lispector'),
    ('Neil Gaiman'),
    ('Stephen King');

/*
id_autores          autores
    1	        Clarice Lispector
    2	        Neil Gaiman
    3	        Stephen King
*/

INSERT INTO livros (titulo, autor_id)
VALUES
	('Coraline', 2)

/*
id_livro     nome      autor_id
    1	     Coraline	   2
*/

DELETE FROM autores WHERE id_autores = 2

/* Após a exclusão do registro do autor com ID = 2, o livro registrado passou a não
possuir um autor cadastrado, gerando uma violação de integridade. Para resolver o problema
podemos utilizar a opção 'ON DELETE CASCADE'. Ela possibilita que quando um registro na tabela 
'autores' for excluído, todos os registros correspondentes na tabela 'livros' também serão excluídos.*/

CREATE TABLE livros (
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT,
    CONSTRAINT fk_id_autor FOREIGN KEY (autor_id) REFERENCES Autores(id_autor)
        ON DELETE CASCADE
);



