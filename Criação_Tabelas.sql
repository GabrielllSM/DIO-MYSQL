-- Criar o banco de dados e usá-lo
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

desc clients;
-- Tabela: Clientes
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit CHAR(3),
    Lastname VARCHAR(20),
    CPF CHAR(11) NOT NULL UNIQUE,
    Address VARCHAR(30),
    CONSTRAINT unique_cpf_client UNIQUE (CPF)
);

-- Tabela: Produtos
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    avaliacao FLOAT DEFAULT 0,
    size VARCHAR(10),
    category ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL
);

-- Tabela: Estoque de produtos (deve vir antes de ser referenciada)
CREATE TABLE productStorage (
    idProdStorage INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0
);

-- Tabela: Fornecedores
CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- Tabela: Vendedores
CREATE TABLE seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    socialName VARCHAR(255) NOT NULL,
    abstName VARCHAR(255),
    CNPJ CHAR(15),
    CPF CHAR(11),
    Location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

-- Tabela: Produtos x Vendedores
CREATE TABLE productSeller (
    idSeller INT,
    idProduct INT,
    prodQuantity INT DEFAULT 1,
    PRIMARY KEY (idSeller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idSeller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

-- Tabela: Pagamentos
CREATE TABLE payments (
    idClient INT,
    idPayment INT,
    typePayment ENUM('Boleto','Cartão','Dois cartões') NOT NULL,
    limitAvailable FLOAT,
    PRIMARY KEY(idClient, idPayment),
    FOREIGN KEY (idClient) REFERENCES clients(idClient)
);

-- Tabela: Pedidos
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderStatus ENUM('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10,
    paymentCash BOOL DEFAULT FALSE,
    CONSTRAINT fk_order_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)
);

-- Tabela: Produtos x Pedidos
CREATE TABLE productOrder (
    idProduct INT,
    idOrder INT,
    poQuantity INT DEFAULT 1,
    poStatus ENUM('Disponivel','Sem estoque') DEFAULT 'Disponivel',
    PRIMARY KEY (idProduct, idOrder),
    CONSTRAINT fk_po_product FOREIGN KEY (idProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_po_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder)
);

-- Tabela: Produto em local de estoque
CREATE TABLE storageLocation (
    idProduct INT,
    idStorage INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idProduct, idStorage),
    CONSTRAINT fk_sl_product FOREIGN KEY (idProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_sl_storage FOREIGN KEY (idStorage) REFERENCES productStorage(idProdStorage)
);

-- Tabela: Produto_fornecedor
CREATE TABLE productSupplier (
    idSupplier INT,
    idProduct INT,
    quantity INT NOT NULL,
    PRIMARY KEY (idSupplier, idProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);
