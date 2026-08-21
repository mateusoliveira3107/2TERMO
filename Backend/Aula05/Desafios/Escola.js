const entrada = require("readline-sync");

const idade = entrada.questionInt("Idade do aluno: ");
const autorizacao = entrada.keyInYNStrict("Possui autorizacao?");
const acompanhado = entrada.keyInYNStrict("Esta acompanhado por um professor?");
const suspenso = entrada.keyInYNStrict("O aluno esta suspenso?")

if (idade >= 16 && autorizacao === true && suspenso === false || acompanhado === true) {
    console.log("Acesso Liberado!");
} else {
    console.log("Acesso Negado!");
}
console.log(13212312)

