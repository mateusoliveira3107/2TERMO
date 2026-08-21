const entrada = require('readline-sync');
console.log("");

const nome = entrada.question("Informe seu nome: ");
const renda_mensal = entrada.questionFloat("Informe sua renda mensal: ");
const nome_limpo = entrada.keyInYNStrict("Seu nome esta limpo? ");

if (renda_mensal >= 2000 && nome_limpo === true) {
    console.log(`\n${nome}, Seu emprestimo foi aprovado!`);
} else {
    console.log(`\n${nome}, Seu emprestimo foi negado`);
}