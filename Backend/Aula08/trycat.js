const entrada = require('readline-sync');

console.log("=== SISTEMA DE CALCULO INDUSTRIAL ===");

try {
    const num1 = entrada.questionInt("Digite o valor da carga (kg): ");
    const num2 = entrada.questionInt("Dividir por quantas maquinas? ");

    const resultado = num1 / num2;
    console.log(`Cada maquina recebera: ${resultado.toFixed(2)} kg`);

} catch (erro) {
    console.log("\n[ERRO DE SISTEMA]");
    console.log("Desculpe, voce digitou algo que nao e um numero ou o sistema falhou.");
    console.log("O programa nao travou, mas nao podemos concluir o calculo.");
}

console.log("\nO sistema continua rodando normalmente...");