CREATE PROCEDURE sp_AtualizarEmailCliente  
 @id_cliente VARCHAR(20),  
 @novoEmail VARCHAR(50)  
AS  
BEGIN  
 SET NOCOUNT ON  
  
  UPDATE TabelaClientes  
  SET Email = @novoEmail  
  WHERE id_cliente = @id_cliente  
   
 IF @@ROWCOUNT = 0 --Verifica se alguma linha foi afetada  
 BEGIN  
  RAISERROR ('Cliente não encontrado', 16, 1)  
  RETURN  
 END  
  
 PRINT 'Email atualizado com sucesso!'  
END  