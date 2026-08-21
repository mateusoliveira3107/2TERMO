// Calculadora de Área de Terrenos

const entrada = require("readline-sync");

function calcular_area(largura, comprimento){
    return largura * comprimento;
};

const largura = entrada.questionInt("Informe a largura do terreno [m]: ");
const comprimento = entrada.questionInt("Informe o comprimento do terreno [m]: ");

const area = calcular_area(largura, comprimento);

console.log(`Area total do terreno: ${area}m²`);