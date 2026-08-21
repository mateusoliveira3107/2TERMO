const entrada = require('readline-sync');

console.log("=== SISTEMA DE CALCULO INDUSTRIAL (VERSAO 2.0) ===");

try {
    // 1. Lemos como texto comum primeiro para termos controle total
    const leituraCarga = entrada.question("Digite o valor da carga (kg): ");
    const leituraMaquinas = entrada.question("Dividir por quantas maquinas? ");

    // 2. Tentamos converter para número
    const num1 = Number(leituraCarga);
    const num2 = Number(leituraMaquinas);

    // 3. SE a conversão resultou em NaN (Not a Number), "jogamos" um erro
    if (isNaN(num1) || isNaN(num2)) {
        throw new Error("Voce digitou letras. O sistema aceita apenas numeros!");
    }

    // 4. SE o número de máquinas não for um inteiro (for decimal), jogamos outro erro
    if (!Number.isInteger(num2)) {
        throw new Error("Nao podemos dividir carga em 'metades' de maquinas. Use numeros inteiros!");
    }

    // 5. SE tentar dividir por zero
    if (num2 === 0) {
        throw new Error("Divisao por zero nao permitida na linha de producao.");
    }

    const resultado = num1 / num2;
    console.log(`\n✅ Sucesso: Cada maquina recebera ${resultado.toFixed(2)} kg`);

} catch (erro) {
    // Agora sim! Qualquer 'throw new Error' acima cairá aqui.
    console.log("\n--- INTERRUPÇÃO DE SEGURANÇA ---");
    console.log(`Motivo: ${erro.message}`);
}

console.log("\nO sistema continua em standby...");