CREATE PROCEDURE sp_CriarEmprestimo  
 @id_emprestimo VARCHAR (20),  
 @Status BIT,  
 @Prazo INT,  
 @DataInicio DATE,  
 @Tipo VARCHAR (20),  
 @Valor DECIMAL (18,0),  
 @id_cliente VARCHAR (20)  
AS  
BEGIN  
 SET NOCOUNT ON  
  
 --validação do valor do emprestimo que deve ser maior que zero  
 IF @Valor <= 0   
 BEGIN  
  RAISERROR ('ERRO: Valor deve ser maior que 0', 16, 1)  
  RETURN  
 END  
  
 --validação se o cliente já existe cadastrado no banco de dados  
 IF NOT EXISTS (  
  SELECT 1  
  FROM TabelaClientes  
  WHERE id_cliente = @id_cliente  
 )  
 BEGIN  
  RAISERROR ('ERRO: Cliente não encontrado', 16, 1)  
  RETURN  
 END  
  
 --valição para impedir o cadastro em duplicidade de mesmo id de emprestimo  
 IF EXISTS (   
		SELECT 1    	
		FROM TabelaEmprestimo    
		WHERE id_emprestimo = @id_emprestimo  
	)  
	BEGIN   
		RAISERROR ('ERRO: Empréstimo já existe', 16, 1);   
		RETURN
	END  
  
 --cadastro do emprestimo  
 INSERT INTO TabelaEmprestimo (  
  id_emprestimo,  
  Status,  
  Prazo,  
  DataInicio,  
  Tipo,  
  Valor,  
  id_cliente  
 )  
 VALUES (  
  @id_emprestimo,  
  @Status,  
  @Prazo,  
  @DataInicio,  
  @Tipo,  
  @Valor,  
  @id_cliente  
 )  
  
 PRINT 'Empréstimo criado com sucesso!'  
END  