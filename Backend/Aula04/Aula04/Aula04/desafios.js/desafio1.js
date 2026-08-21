const entrada = require("readline-sync");
const nome = entrada.question("Digite seu nome: ");
const ano_nascimento = entrada.questionInt("Digite seu ano de nascimento: ");

const idade = 2026 - ano_nascimento

if (idade >= 16) {
    console.log(`${nome}, você tem mais que 16 anos. Já pode votar!`);
} else {
    console.log(`${nome}, Você tem menos que 16 anos. Ainda não pode votar!`);
}