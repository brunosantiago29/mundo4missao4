Criação de Tabelas:

-- Tabela de Motoristas (Drivers)
CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    Nome VARCHAR(100),
    CNH VARCHAR(20),
    Endereco VARCHAR(200),
    Contato VARCHAR(50)
);

-- Tabela de Clientes (Clients)
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Empresa VARCHAR(100),
    Endereco VARCHAR(200),
    Contato VARCHAR(50)
);

-- Tabela de Pedidos (Orders)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ClientID INT,
    DriverID INT,
    DetalhesPedido TEXT,
    DataEntrega DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);



Inserção de Dados:

-- Inserir dados na tabela Drivers
INSERT INTO Drivers (DriverID, Nome, CNH, Endereco, Contato)
VALUES (1, 'Motorista1', 'ABC123', 'Endereco1', '123456789');

-- Inserir dados na tabela Clients
INSERT INTO Clients (ClientID, Nome, Empresa, Endereco, Contato)
VALUES (1, 'Cliente1', 'EmpresaA', 'EnderecoA', '987654321');

-- Inserir dados na tabela Orders
INSERT INTO Orders (OrderID, ClientID, DriverID, DetalhesPedido, DataEntrega, Status)
VALUES (1, 1, 1, 'Detalhes do Pedido 1', '2024-03-01', 'Pendente');


Atualização de Dados:


-- Atualizar dados na tabela Drivers
UPDATE Drivers SET Nome = 'NovoNome' WHERE DriverID = 1;

-- Atualizar dados na tabela Clients
UPDATE Clients SET Nome = 'NovoCliente' WHERE ClientID = 1;

-- Atualizar dados na tabela Orders
UPDATE Orders SET Status = 'Entregue' WHERE OrderID = 1;


Exclusão de Dados:

-- Excluir dados na tabela Drivers
DELETE FROM Drivers WHERE DriverID = 1;

-- Excluir dados na tabela Clients
DELETE FROM Clients WHERE ClientID = 1;

-- Excluir dados na tabela Orders
DELETE FROM Orders WHERE OrderID = 1;



Consulta de Dados:

-- Selecionar todos os motoristas
SELECT * FROM Drivers;

-- Selecionar todos os clientes
SELECT * FROM Clients;

-- Selecionar todos os pedidos com detalhes do cliente e motorista
SELECT Orders.OrderID, Clients.Nome AS NomeCliente, Drivers.Nome AS NomeMotorista, Orders.DetalhesPedido, Orders.DataEntrega, Orders.Status
FROM Orders
JOIN Clients ON Orders.ClientID = Clients.ClientID
JOIN Drivers ON Orders.DriverID = Drivers.DriverID;

