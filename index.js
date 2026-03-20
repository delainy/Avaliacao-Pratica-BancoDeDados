const enviarEmailsPendentes = require("./services/emailService");

console.log("Serviço de envio de emails iniciado...");

setInterval(() => {

    enviarEmailsPendentes();

}, 10000);