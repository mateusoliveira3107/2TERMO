const entrada = require("readline-sync");

function converterParaFahrenheit(celsius) {
    let fahrenheit = (celsius * 9/5) + 32;
    return fahrenheit;
}

const temperaturaC = entrada.questionFloat("Digite a temperatura em Celsius: ");

const temperaturaF = converterParaFahrenheit(temperaturaC);

console.log(`Temperatura convertida: ${temperaturaF.toFixed(1)}°F`);