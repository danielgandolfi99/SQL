CREATE SCHEMA loja_automotiva_2;

USE loja_automotiva_2;


CREATE TABLE funcionarios( 
	funcionario_id 					int auto_increment,
	cargo							varchar(100),
	PRIMARY KEY(funcionario_id)
);

ALTER TABLE funcionarios ADD COLUMN pessoa_id int;

ALTER TABLE funcionarios ADD CONSTRAINT pessoa_fk FOREIGN KEY(pessoa_id)
										  REFERENCES pessoa_fisica(pessoa_id);


CREATE TABLE endereco( 
	endereco_id 					int auto_increment,
	endereco_rua					varchar(100),
	endereco_numero					int,
	endereco_cep					varchar(100),
	endereco_cidade					varchar(100),
	endereco_estado					varchar(100),
	PRIMARY KEY(endereco_id)
);


CREATE TABLE pessoa_fisica( 
	pessoa_id 						int auto_increment,
	primeiro_nome					varchar(100),
	segundo_nome					varchar(100),
	contato							double,
	CPF								varchar(100),
	data_nascimento					date,
	PRIMARY KEY(pessoa_id) 
);
                          
ALTER TABLE pessoa_fisica ADD COLUMN endereco_id int;

ALTER TABLE pessoa_fisica ADD CONSTRAINT endereco_fk 
FOREIGN KEY(endereco_id) REFERENCES endereco(endereco_id);


CREATE TABLE produto( 
	produto_id 						int auto_increment,
	nome							varchar(100),
	veiculo							varchar(100),
	marca							varchar(100),
	ano_s_aplicacao					int,
	estoque							int,
	preco							double,
    PRIMARY KEY(produto_id)			
);


CREATE TABLE venda( 
	venda_id 						int auto_increment,
	cliente							varchar(100),
    quantidade						varchar(100),
    PRIMARY KEY(venda_id)
);
                  				
ALTER TABLE venda ADD COLUMN produto_id int;

ALTER TABLE venda ADD CONSTRAINT venda_produto_fk
FOREIGN KEY(produto_id) REFERENCES produto(produto_id);


CREATE TABLE compra( 
	compra_id 						int auto_increment,
	empresa							varchar(100),
	quantidade						int,
	preco							double,
    PRIMARY KEY(compra_id)
);
                   

ALTER TABLE compra ADD COLUMN produto_id int;

ALTER TABLE compra ADD CONSTRAINT compra_produto_fk
FOREIGN KEY(produto_id) REFERENCES produto(produto_id);