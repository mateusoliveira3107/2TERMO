// Calculadora de Área de Terrenos

const entrada = require("readline-sync");

function calcular_area(largura, comprimento){
    return largura * comprimento;
};
const terrenos = []
for (let i = 1; i <= 3; i++) {
    const largura = entrada.questionFloat(`Informe a largura do terreno ${i} [m]: `);
    const comprimento = entrada.questionFloat(`Informe o comprimento do terreno ${i} [m]: `);
    const area = calcular_area(largura, comprimento);
    terrenos.push(area.toFixed(2));
    console.log("-".repeat(45));
}
console.log("--- Terrenos ---");
for (let i = 1; i <= terrenos.length; i++){
    console.log(`Terreno ${i} - Area: ${terrenos[i - 1]}m`);
}