CREATE PROCEDURE sp_ListarClientesTelefones  
AS  
 BEGIN  
  SET NOCOUNT ON  
    
  SELECT tc.Nome,  
      -- Agrupa os telefones dos clientes que possuem mais de um, em uma unica linha  
      STRING_AGG(ISNULL(tt.Telefone, 'VAZIO'), ', ') AS Telefones  
  FROM TabelaClientes tc  
  LEFT JOIN TabelaTelefones tt ON tc.id_cliente = tt.id_cliente  
  GROUP BY tc.Nome  
  ORDER BY tc.Nome  
 END  