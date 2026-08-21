const entrada = require("readline-sync");
const idade = entrada.questionInt("Qual sua idade? ");

if (idade > 18){
    console.log("Acesso Liberado! Divirta-se.");
} else {
    console.log("Acesso Negado! Vá para casa estudar Node.js!")
}