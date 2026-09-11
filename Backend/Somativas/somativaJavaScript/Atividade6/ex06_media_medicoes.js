const entrada = require('readline-sync');
let valorAcumulado = 0;

for (let i = 0; i < 5; i++) {
    const valor = entrada.questionInt(`Informe o valor ${i + 1}: `);
    valorAcumulado += valor;
};

let mediaValores = valorAcumulado/5

console.log(`Soma dos valores: ${valorAcumulado.toFixed(1)}`);
console.log(`Media dos valores: ${mediaValores.toFixed(1)}`);