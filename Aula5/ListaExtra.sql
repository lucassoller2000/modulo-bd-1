--Lista extra

--ex 1
select Municipio, AVG(Valor_Realizado) Media from Licitacao where Situacao = 'normal' group by municipio

--ex 2
select Empresa_Licitante, Round(Valor_Realizado,0)Valor_Realizado, Esfera, total=
case
	when(esfera='Federal') then Round(valor_realizado - imposto_federal,2)
	when(esfera='Estadual') then Round(valor_realizado - imposto_estadual,2)
	when(esfera='Municipal') then Round(valor_realizado - imposto_municipal,2)
end from Licitacao

--ex 3
select top 10 Municipio, sum(imposto_federal + imposto_estadual + imposto_municipal) Arrecadacao from Licitacao
group by Municipio order by Arrecadacao desc

--ex 4
select Projeto, DATEDIFF(Month, Data_Inicio_Prev, Data_Fim_Prev) mesesPrevisto, 
DATEDIFF(Month, Data_Inicio_Real, Data_Fim_Real) mesesReal from Licitacao 
where Data_Inicio_Real > Data_Inicio_Prev order by Projeto

--ex 5
select top 10 Empresa_Licitante, Round(SUM(Valor_Realizado),2) faturamento, 
Round((SUM(Valor_Realizado)/sum(Profissionais)),2) media,  
sum(Profissionais)as totalProfissionais, COUNT(1) totalProjetos 
from Licitacao where Situacao='Normal' group by Empresa_Licitante order by faturamento desc

--ex 6
select Projeto, Data_Inicio_Real, DiaDaSemana = 
Case
	When (DATEPART(W, Data_Inicio_Real) = 1) Then 'Domingo'
	When (DATEPART(W, Data_Inicio_Real) = 7) Then 'Sabado'
end from Licitacao 
where DATEPART(W, Data_Inicio_Real) = 1 or DATEPART(W, Data_Inicio_Real) = 7 
order by Data_Inicio_Real

--ex 7
create view empresas as (select Empresa_Licitante, Faturamento_1Ano_Anterior, sum(Valor_Previsto) Valor_Previsto from Licitacao
group by Empresa_Licitante, Faturamento_1Ano_Anterior)

select * from empresas where((Valor_Previsto*100)/Faturamento_1Ano_Anterior > 50) order by Empresa_Licitante

--ex 8
select * from Licitacao where Identificador in (17255,17120)
-- Poucas empresas se interessaram. O valor previsto e os impostos federais e estaduais eram elevados 