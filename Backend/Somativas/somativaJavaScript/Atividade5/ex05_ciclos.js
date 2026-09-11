// ex05_ciclos.js
const entrada = require('readline-sync');
const ciclos = 10

let producaoAcumulada = 0

const pecasProduzidasPorCiclo = entrada.questionInt("Informe quantas pecas a maquina produz por ciclo: ");

for (let i = 0; i < ciclos; i++) {
    producaoAcumulada += pecasProduzidasPorCiclo
    console.log(`Ciclo: ${i + 1}`);
    console.log(`Producao acumulada: ${producaoAcumulada}`)
};
