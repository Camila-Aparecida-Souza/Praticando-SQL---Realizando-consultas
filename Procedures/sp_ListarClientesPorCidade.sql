CREATE PROCEDURE sp_ListarClientesPorCidade  
 @cidade VARCHAR(50)  
AS  
BEGIN  
   SET NOCOUNT ON  
      SELECT  
         Nome,  
         Email,  
         Cidade  
	  FROM TabelaClientes  
	  WHERE UPPER(Cidade) LIKE '%' + UPPER(@cidade) + '%'   -- pesquisa parcial de nome de cidades e pesquisa por maiusculas para não ter falhas   
	  ORDER BY Nome  
END  