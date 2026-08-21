const entrada = require('readline-sync');

let sistemaAtivo = true;

while (sistemaAtivo) {
    try {
        console.log("\n=== PAINEL DE CONTROLE INDUSTRIAL ===");
        console.log("Dica: Digite 'sair' para encerrar o sistema.\n");

        const leituraCarga = entrada.question("Digite o valor da carga (kg): ");
        
        // Opção para sair do loop
        if (leituraCarga.toLowerCase() === 'sair') {
            sistemaAtivo = false;
            console.log("Encerrando sistema...");
            break; 
        }

        const leituraMaquinas = entrada.question("Dividir por quantas maquinas? ");

        const num1 = Number(leituraCarga);
        const num2 = Number(leituraMaquinas);

        if (isNaN(num1) || isNaN(num2)) {
            throw new Error("Voce digitou letras. Digite apenas numeros!");
        }

        if (num2 === 0) {
            throw new Error("Divisao por zero nao permitida.");
        }

        const resultado = num1 / num2;
        console.log(`\n✅ SUCESSO: Cada maquina recebera ${resultado.toFixed(2)} kg`);

    } catch (erro) {
        // A rede de proteção avisa o erro...
        console.log("\n-------------------------------------------");
        console.log(`⚠️  ALERTA DE SISTEMA: ${erro.message}`);
        console.log("-------------------------------------------");
        // ...mas como estamos dentro do 'while', o programa VOLTA para o 'try'!
    }
}

console.log("Sistema desligado com segurança.");