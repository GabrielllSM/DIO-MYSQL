USE ecommerce;

-- Lista todos os pedidos com nome do cliente e status
SELECT 
    o.idOrder,
    c.Fname AS first_name,
    c.Lastname AS last_name,
    o.orderStatus,
    o.orderDescription,
    o.sendValue,
    o.paymentCash
FROM orders o
JOIN clients c ON o.idOrderClient = c.idClient;

-- Mostra os produtos de um pedido específico
SELECT 
    p.Pname,
    po.poQuantity,
    po.poStatus
FROM productOrder po
JOIN product p ON po.idProduct = p.idProduct
WHERE po.idOrder = 1;

-- Quantos produtos cada fornecedor fornece
SELECT 
    s.socialName,
    COUNT(ps.idProduct) AS total_produtos
FROM supplier s
JOIN productSupplier ps ON s.idSupplier = ps.idSupplier
GROUP BY s.idSupplier;

-- Clientes que têm pagamento no método 'Cartão' com limite acima de 1000
SELECT 
    c.Fname,
    c.Lastname,
    p.typePayment,
    p.limitAvailable
FROM payments p
JOIN clients c ON p.idClient = c.idClient
WHERE p.typePayment = 'Cartão'
  AND p.limitAvailable > 1000;
  
-- Lista produtos vendidos por cada vendedor
SELECT 
    s.socialName AS vendedor,
    p.Pname AS produto,
    ps.prodQuantity
FROM productSeller ps
JOIN seller s ON ps.idSeller = s.idSeller
JOIN product p ON ps.idProduct = p.idProduct
ORDER BY s.socialName;
