--lista 8
--ex 1
select p.IDPedido, p.DataEntrega, p.ValorPedido, pit.Quantidade as total from Pedido p 
inner join Cliente cl on cl.IDCliente = p.IDCliente
inner join PedidoItem pit on pit.IDPedido = p.IDPedido
inner join produto pr on pr.IDProduto = pit.IDProduto
inner join ProdutoMaterial pm on pm.IDProduto = pr.IDProduto 
inner join Material m on m.IDMaterial in (14650, 15703,15836, 16003, 16604, 17226)
where month(p.DataEntrega)= '4' and year(p.DataEntrega)='2018' 
group by P.IDPedido, p.DataEntrega, p.ValorPedido, pit.Quantidade
order by p.IDPedido

--ex 2
select p.IDProduto, p.Nome from Produto p inner join ProdutoMaterial pm on pm.IDProduto = p.IDProduto where pm.IDMaterial = null

--ex 3
select c.IDCliente, c.Nome, ci.UF,
COUNT(1) AS Frequencia 
from Cidade ci 
inner join Cliente c on c.IDCidade = ci.IDCidade
inner join Pedido p on p.IDCliente = c.IDCliente
where p.DataPedido > (getdate()-90)
group by c.IDCliente, c.Nome, ci.uf
order by Frequencia desc

--ex 4
select p.IDProduto, P.Nome, p.PrecoVenda, m.IDMaterial, m.Descricao from Produto p 
left join ProdutoMaterial pm on pm.IDProduto = p.IDProduto 
left join Material m on m.IDMaterial = pm.IDMaterial
where p.Nome= 'Broca Vidia 58' or p.Nome='Coturno Pica-Pau'
