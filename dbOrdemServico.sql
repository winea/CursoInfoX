CREATE DATABASE dbordemservico;
USE dbordemservico;
CREATE TABLE tb_usuarios(
    id_user int PRIMARY KEY AUTO_INCREMENT,
    nome_user varchar(50) NOT NULL,
    fone VARCHAR(15),
    login varchar(15) NOT NULL UNIQUE,
    senha VARCHAR(15) NOT NULL
);
--descreve a tabela
DESCRIBE tb_usuarios;
--insere dados tabela
INSERT INTO tb_usuarios(nome_user,fone,login,senha)
VALUES('Jose de Assis','9999-9999','joseassis','123456');

INSERT INTO tb_usuarios(nome_user,fone,login,senha)
VALUES('Maria da Rocha','9999-9998','mariarocha','123456');

INSERT INTO tb_usuarios(nome_user,fone,login,senha)
VALUES('Bruno de Souza','9999-9997','bruno','123456');
--update dados
UPDATE tb_usuarios SET fone= '8888-8888'
WHERE id_user=3;
--visualizar
SELECT * FROM tb_usuarios;
--apagar registro

CREATE TABLE tb_clientes(
    id_cliente int PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(50) NOT NULL,
    end_cliente VARCHAR(250),
    fone_cliente VARCHAR(50) NOT NULL,
    email_cliente VARCHAR(50)
);

INSERT INTO tb_clientes(nome_cliente,end_cliente,fone_cliente,email_cliente)
VALUES ('Soraya Fross','Rua Cubatao','7777-7777','soraya@gmail.com');

SELECT * FROM tb_clientes;

CREATE TABLE tb_os(
    id_os int PRIMARY KEY AUTO_INCREMENT,
    data_os TIMESTAMP DEFAULT current_timestamp,
    equipamento VARCHAR(150) NOT NULL,
    defeito VARCHAR(300) NOT NULL,
    servico VARCHAR(150),
    tecnico VARCHAR(30),
    valor decimal(10,2),
    id_cliente int NOT NULL,
    FOREIGN KEY(id_cliente) REFERENCES tb_clientes(id_cliente) 
);
SELECT * FROM tb_os;
INSERT into tb_os(equipamento, defeito, servico, tecnico, valor,id_cliente)
VALUES ('Notebook','Não liga','Troca da fonte','Zé',87.50,1);

SELECT 
O.id_os,equipamento,defeito,servico,valor,
C.nome_cliente,fone_cliente
FROM tb_os as O
INNER JOIN tb_clientes as C
on(O.id_cliente = C.id_cliente);

update tb_usuarios set nome_user="administrador", login="admin", senha="admin" where id_user=1;
--adicionar coluna na tabela 
alter table tb_usuarios add column perfil varchar(20) not null;

--remover coluna da tabela
alter table tb_usuarios drop column perfil;

update tb_usuarios set perfil="admin" where id_user=1;
update tb_usuarios set perfil="admin" where id_user=2;
update tb_usuarios set perfil="user" where id_user=3;
