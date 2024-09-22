# Lista 5
# Nome.: Vittor Dallacqua (Ciência da Computação - Noite)
# Prof.: Jonathan Morris Samara

# 01:
CREATE TABLE Livros(
	LivroID INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(200),
    Autor VARCHAR(150),
    AnoPublicacao YEAR
);

# 02:
CREATE TABLE Clientes(
	ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(15)
);

# 03:
CREATE TABLE Pedidos(
	PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    FOREIGN KEY(ClienteID) REFERENCES Clientes(ID),
    DataPedido DATE,
    ValorTotal DECIMAL(10, 2)
);

# 04:
CREATE TABLE Funcionarios(
	FuncionarioID INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100),
    Cargo VARCHAR(50),
    Salario DECIMAL(12, 2)
);

# 05:
CREATE TABLE Cursos(
	CursoID INT PRIMARY KEY AUTO_INCREMENT,
	NomeCurso VARCHAR(100),
    Duracao INT,
    Descricao TEXT
);

# 06:
CREATE TABLE Produtos(
	ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
	NomeProduto VARCHAR(150),
    Categoria VARCHAR(50),
    Preco DECIMAL(8, 2)
);

# 07:
CREATE TABLE Eventos(
	EventoID INT PRIMARY KEY AUTO_INCREMENT,
	NomeEvento VARCHAR(100),
    DataEvento DATE,
    Localizacao VARCHAR(255)
);

# 08:
CREATE TABLE Fornecedores(
	FornecedorID INT PRIMARY KEY AUTO_INCREMENT,
	NomeFornecedor VARCHAR(150),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15)
);

# 09:
CREATE TABLE Alunos(
	AlunoID INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100),
    DataNascimento DATE,
    Curso VARCHAR(100)
);

# 10:
CREATE TABLE Transacoes(
	TransacaoID INT PRIMARY KEY AUTO_INCREMENT,
	FOREIGN KEY(ClienteID) REFERENCES Clientes(ID),
    DataTransacao DATETIME,
    Valor DECIMAL(10, 2)
);

# 11:
ALTER TABLE Livros ADD Editora VARCHAR(100);

# 12:
ALTER TABLE Clientes 
MODIFY Telefone VARCHAR(20), 
ADD Endereco VARCHAR(255);

# 13:
ALTER TABLE Pedidos 
MODIFY ValorTotal DECIMAL(12, 2),
ADD StatusPedido VARCHAR(20);

# 14:
ALTER TABLE Funcionarios 
CHANGE COLUMN Cargo Departamento VARCHAR(50),
ADD DataContratacao DATE;

# 15:
ALTER TABLE Cursos 
ADD Nivel VARCHAR(50),
MODIFY Descricao TEXT;

# 16:
ALTER TABLE Produtos 
DROP COLUMN Categoria,
ADD Estoque INT;

# 17:
ALTER TABLE Eventos 
MODIFY Localizacao TEXT,
ADD Capacidade VARCHAR(50);

# 18:
ALTER TABLE Fornecedores 
CHANGE COLUMN Endereco EnderecoFornecedor VARCHAR(255),
ADD Email VARCHAR(100);

# 19:
ALTER TABLE Alunos
ADD Endereco VARCHAR(255),
MODIFY Curso VARCHAR(150);

# 20:
ALTER TABLE Transacoes
ADD MetodoPagamento VARCHAR(50),
MODIFY DataTransacao TIMESTAMP;

# 21:
DROP TABLE Funcionarios;

# 22:
DROP TABLE Pedidos;