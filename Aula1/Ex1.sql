Create table Produto
(IDProduto int identity(1,1) not null,
NomeCurto varchar(30) not null,
NomeDescritivo varchar(50) not null,
DataCriacaoProduto varchar(10) not null,
LocalEstoque int not null,
Quantidade int not null,
Preco float not null);

Create table LocalEstoque
(IDLocalEstoque int identity(1,1) not null,
NomeEstoque varchar(20) not null,
DataCriacao varchar(10) not null,
Capacidade int not null);

exec sp_rename 'Produto.[LocalEstoque]', 'IDEstoque', 'column';

