const entrada = require('readline-sync');

const pesoPeca = entrada.question("Informe o peso da peca: ");

if (pesoPeca >= 95 && pesoPeca <= 105) {
    console.log(`Peso: ${pesoPeca}g`);
    console.log("PECA APROVADA");
} else {
    console.log(`Peso: ${pesoPeca}g`);
    console.log("PECA REPROVADA");
}
