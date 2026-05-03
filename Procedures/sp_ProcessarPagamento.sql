CREATE PROCEDURE sp_ProcessarPagamento  
    @id_pagamento VARCHAR(20),  
    @DataPagamento DATE,  
    @Valor DECIMAL(18,2),  
    @Status VARCHAR(20),  
    @id_emprestimo VARCHAR(20)  
AS  
BEGIN  
    SET NOCOUNT ON;  
  
    BEGIN TRY  
        BEGIN TRANSACTION  
  
        -- Validação de valor  
        IF @Valor <= 0  
        BEGIN  
            RAISERROR ('Valor inválido', 16, 1)  
            ROLLBACK  
            RETURN  
        END  
  
        -- Validar empréstimo  
        IF NOT EXISTS (  
            SELECT 1   
            FROM TabelaEmprestimo   
            WHERE id_emprestimo = @id_emprestimo  
        )  
        BEGIN  
            RAISERROR ('Empréstimo não encontrado', 16, 1)  
            ROLLBACK  
            RETURN  
        END  
  
        -- Inserir pagamento  
        INSERT INTO TabelaPagamentos (  
            id_pagamento,  
            DataPagamento,  
            Valor,  
            Status,  
            id_emprestimo  
        )  
        VALUES (  
            @id_pagamento,  
            @DataPagamento,  
            @Valor,  
            @Status,  
            @id_emprestimo  
        )  
  
        -- Atualizar empréstimo  
        UPDATE TabelaEmprestimo  
        SET Status = 1  
        WHERE id_emprestimo = @id_emprestimo  
  
        COMMIT  
        PRINT 'Pagamento processado com sucesso!'  
  
    END TRY  
    BEGIN CATCH  
        ROLLBACK  
  
        RAISERROR ('Erro ao processar pagamento', 16, 1)  
    END CATCH  
END  