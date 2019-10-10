select * into CidadeAux from Cidade;

insert into CidadeAux select * from Cidade WHERE UF='RS';

insert into LocalEstoque(NomeEstoque, DataCriacao, Capacidade) values
('Prateleira','24/04/2018', 20);

select * from LocalEstoque;

insert into Produto (NomeCurto, NomeDescritivo, DataCriacaoProduto,	IDEstoque, Quantidade,	Preco) values 
('bolacha', 'bolacha de chocolate', '24/04/2018', 1, 100, 2.50),
('bolacha', 'bolacha de morango', '24/04/2018', 1, 80, 2.50);

select * from Produto;
select * from Cidade where nome='Taquara';
select * from Associado;

update Associado set CPF='00000000000', Endereco='este', Bairro='Centro', Complemento='empresa', IDCidade=4 where IDAssociado=1;

delete from Cidade  where nome='Campinas' and UF='SP';
delete from Cidade  where nome='Taquara' and UF='RS';

select IDEmpregado, NomeEmpregado from Empregado order by IDDepartamento;

select NomeEmpregado, Salario from Empregado  where comissao is null order by Salario;

select IDEmpregado, NomeEmpregado, (Salario*13) as SalarioAnual, (Comissao*12) as ComissaoAnual, (Salario*13) + (ISNULL(Comissao,0) * 12) as RendaAnual from Empregado order by NomeEmpregado;

select IDEmpregado, NomeEmpregado, Cargo, (Salario*13) as SalarioAnual from Empregado where (Salario*13) < 18500 or Cargo='Atendente' order by NomeEmpregado;

select NomeEmpregado, Cargo from Empregado where Cargo='Atendente' or IDGerente=7698 order by NomeEmpregado;

select IDDepartamento,NomeDepartamento from Departamento where Localizacao like 'SAO%';

select IDCidade, Nome, UF from Cidade where IDCidade >=4 and IDCidade<=9;

select * from Departamento d where not exists (select 1 from Empregado e where e.IDDepartamento = d.IDDepartamento) order by d.IDDepartamento;

select NomeEmpregado, Cargo from Empregado e where IDDepartamento is null order by NomeEmpregado;

select NomeEmpregado from Empregado where IDGerente in (7566, 7698, 7782) order by NomeEmpregado;
 
 select dateadd (day, -2, getdate());

 --lista 4
 --ex 1

 select IDEmpregado, NomeEmpregado, DATEDIFF(year, DataAdmissao, GETDATE())  from Empregado where YEAR(DataAdmissao)= 1981;

 --ex 2
select top 1 Cargo, count(1)as total from Empregado  group by Cargo order by total desc;

--ex 3
select uf, COUNT(1) as total from Cidade group by uf order by total desc;

--ex 4
insert into departamento (IDDepartamento, NomeDepartamento, Localizacao) values
(70,'Inovacao', 'SAO LEOPOLDO');

update empregado set IDDepartamento = 70 where Cargo != 'Atendente' and MONTH(DataAdmissao)=12;
