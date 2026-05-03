CREATE PROCEDURE sp_ListarClientesPorID  
 @id_cliente VARCHAR(20)  
AS  
BEGIN  
   SET NOCOUNT ON  
       SELECT  
		  Nome,  
		  Email,  
		  Cidade  
	   FROM TabelaClientes  
	   WHERE id_cliente = @id_cliente  
END  