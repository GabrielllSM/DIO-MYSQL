-- 1. Inserir clientes
INSERT INTO clients (Fname, Minit, Lastname, CPF, Address)
VALUES 
('Ana', 'M', 'Silva', '12345678901', 'Rua das Flores, 123'),
('Carlos', 'A', 'Oliveira', '23456789012', 'Av. Central, 456'),
('Beatriz', 'L', 'Souza', '34567890123', 'Rua Nova, 789'),
('João', 'P', 'Mendes', '45678901234', 'Rua Verde, 101'),
('Larissa', 'K', 'Almeida', '56789012345', 'Av. das Palmeiras, 202');

-- 2. Inserir produtos
INSERT INTO product (Pname, classification_kids, avaliacao, size, category)
VALUES 
('Camiseta Polo', FALSE, 4.5, 'M', 'Vestimenta'),         -- idProduct = 1
('Notebook Lenovo', FALSE, 4.8, NULL, 'Eletrônico'),      -- idProduct = 2
('Boneca Elsa', TRUE, 4.2, 'Pequeno', 'Brinquedos'),      -- idProduct = 3
('Smartphone Samsung', FALSE, 4.6, NULL, 'Eletrônico'),   -- idProduct = 4
('Sofá 3 lugares', FALSE, 4.1, 'Grande', 'Móveis'),       -- idProduct = 5
('Biscoito Recheado', TRUE, 3.9, '200g', 'Alimentos');    -- idProduct = 6

-- 3. Inserir estoques
INSERT INTO productStorage (storageLocation, quantity)
VALUES 
('Armazém São Paulo', 100),         -- idProdStorage = 1
('Armazém Curitiba', 50),           -- idProdStorage = 2
('Armazém Recife', 20),             -- idProdStorage = 3
('Armazém Porto Alegre', 80);       -- idProdStorage = 4

-- 4. Inserir fornecedores
INSERT INTO supplier (socialName, CNPJ, contact)
VALUES 
('Fornecedor Tech SA', '11111111111111', '41999999999'),     -- idSupplier = 1
('Brinquedos e Cia', '22222222222222', '41988888888'),       -- idSupplier = 2
('Móveis Urbanos Ltda', '33333333333333', '41955555555'),    -- idSupplier = 3
('Alimentos Bons Sabor', '44444444444444', '41944444444');   -- idSupplier = 4

-- 5. Inserir vendedores
INSERT INTO seller (socialName, abstName, CNPJ, CPF, Location, contact)
VALUES 
('Loja Virtual LTDA', 'LojaV', '44444444444444', NULL, 'Curitiba - PR', '41977777777'), -- idSeller = 1
('Moda Express', 'ModaX', NULL, '55555555555', 'São Paulo - SP', '41966666666'),        -- idSeller = 2
('Eletrônicos Brasil', 'EBR', '55555555555555', NULL, 'Rio de Janeiro - RJ', '41933333333'), -- idSeller = 3
('Mega Sofás', 'MSofás', NULL, '67890123456', 'Joinville - SC', '41922222222');         -- idSeller = 4

-- 6. Associar produtos a vendedores
INSERT INTO productSeller (idSeller, idProduct, prodQuantity)
VALUES 
(1, 2, 10),  -- Loja Virtual vendendo Notebook Lenovo
(2, 1, 30),  -- Moda Express vendendo Camiseta Polo
(3, 4, 15),  -- Eletrônicos Brasil vendendo Smartphone
(4, 5, 5);   -- Mega Sofás vendendo Sofá

-- 7. Associar produtos a fornecedores
INSERT INTO productSupplier (idSupplier, idProduct, quantity)
VALUES 
(1, 2, 20),   -- Notebook do Fornecedor Tech SA
(2, 3, 40),   -- Boneca da Brinquedos e Cia
(3, 5, 10),   -- Sofá de Móveis Urbanos
(4, 6, 100);  -- Biscoito de Alimentos Bons Sabor

-- 8. Localização dos produtos no estoque
INSERT INTO storageLocation (idProduct, idStorage, location)
VALUES 
(1, 1, 'Corredor A, Prateleira 1'),
(2, 2, 'Corredor B, Prateleira 3'),
(5, 3, 'Depósito Leste, Estante 5'),
(6, 4, 'Depósito Sul, Estante 7');

-- 9. Inserir pagamentos
INSERT INTO payments (idClient, idPayment, typePayment, limitAvailable)
VALUES 
(1, 1, 'Cartão', 2500),
(2, 1, 'Boleto', 0),
(4, 1, 'Cartão', 1200),
(5, 1, 'Dois cartões', 3000);

-- 10. Inserir pedidos
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
VALUES 
(1, 'Confirmado', 'Pedido de uma camiseta e um notebook', 20, TRUE), -- idOrder = 1
(4, 'Em processamento', 'Pedido de sofá e biscoito', 35, FALSE);     -- idOrder = 2

-- 11. Associar produtos aos pedidos
INSERT INTO productOrder (idProduct, idOrder, poQuantity, poStatus)
VALUES 
(1, 1, 1, 'Disponivel'),  -- camiseta
(2, 1, 1, 'Disponivel'),  -- notebook
(5, 2, 1, 'Disponivel'),  -- sofá
(6, 2, 3, 'Disponivel');  -- biscoito
