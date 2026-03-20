USE SistemaUsuarios;

DELIMITER $$

CREATE PROCEDURE relatorio_usuarios_92_dias()
BEGIN

DECLARE total_usuarios INT;

SELECT COUNT(*)
INTO total_usuarios
FROM usuarios
WHERE data_cadastro >= DATE_SUB(NOW(), INTERVAL 92 DAY);

INSERT INTO fila_emails (
    destinatario,
    assunto,
    mensagem
)
VALUES (
    'contato@sistemas.com.br',
    'Relatório de usuários',
    CONCAT(
        'Quantidade de usuários cadastrados nos últimos 92 dias: ',
        total_usuarios
    )
);

END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE enviar_email_aniversariantes()
BEGIN

INSERT INTO fila_emails (
    destinatario,
    assunto,
    mensagem
)
SELECT
    email,
    'Feliz Aniversário!',
    CONCAT(
        'Olá ',
        nome,
        ', desejamos um feliz aniversário!'
    )
FROM usuarios
WHERE
    DAY(data_nascimento) = DAY(CURDATE())
    AND MONTH(data_nascimento) = MONTH(CURDATE());

END $$

DELIMITER ;