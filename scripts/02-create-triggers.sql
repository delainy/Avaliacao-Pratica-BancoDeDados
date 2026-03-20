USE SistemaUsuarios;

DELIMITER $$

CREATE TRIGGER trigger_novo_usuario
AFTER INSERT ON usuarios
FOR EACH ROW
BEGIN

INSERT INTO fila_emails (  
    destinatario,
    assunto,
    mensagem
)
VALUES (
    'contato@sistemas.com.br',
    'Novo usuário cadastrado',
    CONCAT(
        'Novo usuário cadastrado: ',
        NEW.nome,
        ' - ',
        NEW.email
    )
);

END $$

DELIMITER ;