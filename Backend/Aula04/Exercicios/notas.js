const entrada = require("readline-sync");

const nome = entrada.question("Nome do aluno: ");
const n1 = entrada.questionFloat("Nota 1: ");
const n2 = entrada.questionFloat("Nota 2: ");

const media = (n1 + n2) / 2;

console.log(`\nMédia Final de ${nome}: ${media.toFixed(1)}`);

if (media >= 7) {
    console.log("SITUAÇÃO: APROVADO!");
} else if (media >= 5 && media < 7) {
    console.log("SITUAÇÃO: RECUPERAÇÃO");
} else {
    console.log("SITUAÇÃO: REPROVADO");
}
