CREATE PROCEDURE sp_AtualizarSaldoConta  
 @id_conta VARCHAR(20),  
 @valor DECIMAL(18,2)  
AS  
BEGIN  
 SET NOCOUNT ON  
  
 DECLARE @saldoAtual DECIMAL (18,2)  
  
 --Busca o saldo atual  
 SELECT @saldoAtual = Saldo  
 FROM TabelaConta  
 WHERE id_conta = @id_conta  
  
 -- Validar se conta existe  
 IF @saldoAtual IS NULL  
 BEGIN  
  RAISERROR ('Conta não encontrada', 16, 1)  
  RETURN  
 END  
  
 --Validar saldo negativo  
 IF (@saldoAtual + @valor) < 0  
 BEGIN  
  RAISERROR ('Saldo insuficiente', 16, 1)  
  RETURN  
 END  
  
 --Atualiza o saldo da conta  
 UPDATE TabelaConta  
 SET Saldo = Saldo + @valor  
 WHERE id_conta = @id_conta  
  
 PRINT 'Saldo atualizado com sucesso!'  
END  