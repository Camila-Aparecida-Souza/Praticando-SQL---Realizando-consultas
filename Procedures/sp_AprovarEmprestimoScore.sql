CREATE PROCEDURE sp_AprovarEmprestimoScore  
 @id_cliente VARCHAR(20)  
AS  
BEGIN  
 SET NOCOUNT ON  
  
 DECLARE @Pontuacao INT  
  
 --busca a pontuação/score do cliente  
 SELECT @Pontuacao = Pontuacao  
 FROM TabelaScoreCredito  
 WHERE id_cliente = @id_cliente  
  
 --validação se o cliente possui score  
 IF @Pontuacao IS NULL  
 BEGIN   
  RAISERROR ('Cliente sem score cadastrado', 16, 1)  
  RETURN  
 END  
  
 --validação para aprovação do emprestimo  
 IF @Pontuacao > 700  
 BEGIN  
  UPDATE TabelaEmprestimo  
  SET Status = 1  
  WHERE id_cliente = @id_cliente  
    
  PRINT 'Empréstimo aprovado!'  
 END  
  
 ELSE  
 BEGIN  
  UPDATE TabelaEmprestimo  
  SET Status = 0  
  WHERE id_cliente = @id_cliente  
  
  PRINT 'Empréstimo negado!'  
 END  
END  