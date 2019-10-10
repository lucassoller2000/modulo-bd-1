--Lista 6
--ex 1
select top 1 substring(Nome,1,charindex(' ',Nome,1)) PrimeiroNome, count(1) as total from Cliente group by substring(Nome,1,charindex(' ',Nome,1)) order by total desc

--ex 2
select count(*) Quantidade, SUM(ValorPedido) TotalPedidos from Pedido where Month(DataPedido)=3 and Year(DataPedido)=2018

--ex 3
select UF, total from (select top 1 UF, count(1) as total from Cidade c inner join Cliente cl on cl.IDCidade = c.IDCidade group by c.IDCidade, c.UF order by c.IDCidade desc) a
union select UF, total from (select top 1 UF, count(1) as total from Cidade c inner join Cliente cl on cl.IDCidade = c.IDCidade group by c.IDCidade, c.UF order by c.IDCidade asc) b

--ex 4
insert into Produto (Nome, DataCadastro, PrecoCusto, PrecoVenda, Situacao) values
('Coturno Pica-Pau', GETDATE(), 29.25, 77.95, 'A');

--ex 5
select pr.nome from Produto pr left join PedidoItem p on p.IDProduto = pr.IDProduto where p.IDProduto is null;
select nome from Produto pr where pr.IDProduto not in (select IDProduto from PedidoItem);

--ex 6
select top 30 pr.nome, sum(pit.PrecoUnitario * pit.Quantidade) as lucro  from produto pr inner join PedidoItem pit on pit.IDProduto = pr.IDProduto inner join Pedido pe on pe.IDPedido = pit.IDPedido where YEAR(pe.DataEntrega) = 2018 group by pr.nome order by lucro desc;

--Lista 7
--ex 1
select e.NomeEmpregado as NomeEmpregado, g.NomeEmpregado as NomeGerente, d.NomeDepartamento from Empregado g inner join Empregado e on e.IDGerente = g.IDEmpregado inner join Departamento d on d.IDDepartamento = e.IDDepartamento;

--ex 2
select IDDepartamento, NomeDepartamento from Departamento where IDDepartamento in (Select top 1 IDDepartamento from Empregado order by Salario desc);

--ex 3
update Empregado set Salario = Salario * 1.173 where IDDepartamento in
 (Select IDDepartamento from Departamento where Localizacao= 'SAO LEOPOLDO');
 
 --ex 4
select Nome, COUNT(1) total from Cidade group by Nome, UF having count(1) > 1

--ex 5
Create View CidadeDuplicada as 
(select nome, uf, max(IDCidade) MaiorId, count(1) Contador from Cidade group by nome, uf having count(1)>1)

update Cidade set nome= nome + '*' where IDCidade in (select MaiorId from CidadeDuplicada)


