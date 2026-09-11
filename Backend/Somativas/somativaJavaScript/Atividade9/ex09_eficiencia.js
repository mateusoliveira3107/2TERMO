const entrada = require('readline-sync');

function calcularEficiencia(real, prevista) {
    return (real/prevista) * 100
};

function classificarEficiencia(percentual) {
    if (percentual >= 90) {
        return "META ATINGIDA";
    } else if (percentual >= 70 && percentual <= 89.99) {
        return "ATENCAO";
    } else {
        return "ABAIXO DA META";
    };
};

const producaoPrevista = entrada.question("Informe a producao prevista: ")
const producaoReal = entrada.question("Informe a producao real: ");

const eficienciaPercentual = calcularEficiencia(producaoReal, producaoPrevista);
const classificacao = classificarEficiencia(eficienciaPercentual);

console.log(`\n====== Relatorio de Producao ======`);
console.log(`Producao Prevista: ${producaoPrevista}`);
console.log(`Producao Real: ${producaoReal}`);
console.log(`Percentual: ${eficienciaPercentual}%`);
console.log(`Classificacao: ${classificacao}`);