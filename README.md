<h1>Projeto Banco de Dados - Sistema de Usuários</h1>

<h2>Descrição</h2>

<h3>Projeto de banco de dados que implementa:</h3>
<ul>

<li>Scripts de criação do banco e tabelas</li>

<li>Trigger para registrar envio de email ao cadastrar usuário</li>

<li>Procedure para relatório de usuários cadastrados nos últimos 92 dias</li>

<li>Procedure para envio de email para aniversariantes do dia</li>
</ul>


<h2>Testes</h2>

Inserção de usuários dispara trigger automaticamente.

Procedures podem ser executadas com:

CALL relatorio_usuarios_92_dias();

CALL enviar_email_aniversariantes();
