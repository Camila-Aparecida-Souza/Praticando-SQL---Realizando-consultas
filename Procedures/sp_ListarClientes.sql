CREATE PROCEDURE sp_ListarClientes  
AS  
BEGIN  
	SET NOCOUNT ON  
  
	SELECT   
		id_cliente,  
		Nome,  
		Email,  
		DataNascimento,  
		CPF,  
		Estado,  
		Cidade    
	FROM TabelaClientes  
END