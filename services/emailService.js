const nodemailer = require("nodemailer");
const db = require("../config/database");
require("dotenv").config();

const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS
    }
});

async function enviarEmailsPendentes() {

    const [emails] = await db.query(
        "SELECT * FROM fila_emails WHERE enviado = false"
    );

    for (let email of emails) {

        try {

            await transporter.sendMail({
                from: process.env.EMAIL_USER,
                to: email.destinatario,
                subject: email.assunto,
                text: email.mensagem
            });

            await db.query(
                "UPDATE fila_emails SET enviado = true WHERE id = ?",
                [email.id]
            );

            console.log("Email enviado para:", email.destinatario);

        } catch (error) {

            console.error("Erro ao enviar email:", error);

        }

    }

}

module.exports = enviarEmailsPendentes;