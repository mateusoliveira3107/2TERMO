// Verificador de Aposentadoria

const entrada = require("readline-sync");

const nome = entrada.question("Informe seu nome: ");
const idade = entrada.questionInt("Informe sua idade: ");
const tempo_contribuicao = entrada.questionInt("Informe seu tempo de contribucao: ");

if (idade >= 65 || tempo_contribuicao >= 30) {
    console.log(`${nome}. Você já pode se aposentar!`);
} else {
    console.log(`${nome}. Você ainda não pode se aposentar!`);
};