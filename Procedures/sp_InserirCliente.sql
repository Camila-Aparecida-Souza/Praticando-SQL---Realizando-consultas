CREATE PROCEDURE sp_InserirCliente  
 @id_cliente     VARCHAR(20),  
 @DataNascimento DATE,  
 @CPF            VARCHAR(11),  
 @Nome			 VARCHAR(50),  
 @Email			 VARCHAR(50),  
 @Rua			 VARCHAR(50),  
 @Bairro		 VARCHAR(50),  
 @Cidade		 VARCHAR(50),  
 @Estado		 VARCHAR(2),  
 @CEP			 VARCHAR(50),  
 @id_colaborador VARCHAR(20)  
AS  
BEGIN  
 SET NOCOUNT ON  
  
 /* Validação de CPF já cadastrado */  
 IF EXISTS (  
  SELECT 1  
  FROM TabelaClientes  
  WHERE CPF = @CPF  
 )  
 BEGIN  
  --interrompe a execução e pode ser tratado em C#, API, etc.  
  RAISERROR ('CPF já cadastrado!', 16, 1)  
  RETURN  
 END  
  
  
 /* Inserindo informações no banco de dados */   
 INSERT INTO TabelaClientes (  
  id_cliente,  
  DataNascimento,  
  CPF,  
  Nome,  
  Email,  
  Rua,  
  Bairro,  
  Cidade,  
  Estado,  
  CEP,  
  id_colaborador   
 )   
 VALUES(  
  @id_cliente,  
  @DataNascimento,  
  @CPF,  
  @Nome,  
  @Email,  
  @Rua,  
  @Bairro,  
  @Cidade,  
  @Estado,  
  @CEP,  
  @id_colaborador  
 )  
  
 PRINT 'Cliente cadastrado com sucesso!'  
END  