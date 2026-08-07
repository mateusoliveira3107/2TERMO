const entrada = require("readline-sync");
const idade_aluno = entrada.question("Informe a idade do aluno: ");

if (idade_aluno >= 5 && idade_aluno < 10) {
    console.log("Classificação do aluno: Infaltil");
} else if (idade_aluno >= 11 && idade_aluno < 17) {
    console.log("Classificação do aluno: Juvenil");
} else if (idade_aluno >= 18 && idade_aluno < 60) {
    console.log("Classificação do aluno: Adulto");
} else if (idade_aluno > 60) {
    console.log("Classificação do aluno: Sênior");
} else {
    console.log("Idade Insuficiente");
}