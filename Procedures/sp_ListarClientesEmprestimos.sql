CREATE PROCEDURE sp_ListarClientesEmprestimos  
AS  
BEGIN  
 SET NOCOUNT ON  
  
 SELECT   
  tc.Nome,  
  te.Tipo,  
  te.Valor,  
  CASE   
   WHEN te.Status = 1 THEN 'Ativo'  
   ELSE 'Inativo'  
  END AS Status  
 FROM TabelaClientes tc  
 INNER JOIN TabelaEmprestimo te ON tc.id_cliente = te.id_cliente  --INNER JOIN para retornar clientes que tem emprestimo  
 ORDER BY tc.Nome  
END  