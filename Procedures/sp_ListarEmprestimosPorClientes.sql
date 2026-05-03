CREATE PROCEDURE sp_ListarEmprestimosPorClientes  
AS  
BEGIN  
   SET NOCOUNT ON  
      SELECT   
	     tc.Nome,  
		 COUNT(te.id_emprestimo) AS Qtd_Emprestimo,  
		 ISNULL(SUM(te.Valor), 0) AS Valor_Total  
	  FROM TabelaEmprestimo te  
	  LEFT JOIN TabelaClientes tc ON te.id_cliente = tc.id_cliente  
	  GROUP BY  
		 tc.Nome  
	  ORDER BY 
	     tc.Nome  
END  