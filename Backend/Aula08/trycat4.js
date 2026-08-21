const entrada = require('readline-sync');

let sistemaAtivo = true;

while (sistemaAtivo) {
    try {
        console.log("\n=== PAINEL DE CONTROLE INDUSTRIAL ===");
        const leituraCarga = entrada.question("Digite o valor da carga (kg): ");
        
        if (leituraCarga.toLowerCase() === 'sair') break;

        const leituraMaquinas = entrada.question("Dividir por quantas maquinas? ");

        const num1 = Number(leituraCarga);
        const num2 = Number(leituraMaquinas);

        // 1. Validar se são números
        if (isNaN(num1) || isNaN(num2)) {
            throw new Error("Digite apenas numeros!");
        }

        // 2. REGRA DE NEGÓCIO: Máquinas precisam ser INTEIRAS
        // O ! significa "NÃO". Ou seja: "Se NÃO for inteiro..."
        if (!Number.isInteger(num2)) {
            throw new Error("Quantidade de maquinas deve ser um numero INTEIRO (sem virgula ou ponto).");
        }

        if (num2 === 0) {
            throw new Error("Divisao por zero nao permitida.");
        }

        const resultado = num1 / num2;
        console.log(`\n✅ SUCESSO: Cada maquina recebera ${resultado.toFixed(2)} kg`);

    } catch (erro) {
        console.log(`\n⚠️  ALERTA: ${erro.message}`);
    }
}