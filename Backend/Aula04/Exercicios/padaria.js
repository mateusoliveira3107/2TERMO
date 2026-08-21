const entrada = require('readline-sync');

let opcao = 0;

// O programa vai repetir tudo o que estiver aqui dentro
while (opcao !== 3) {
    console.log("\n=== MENU DA PADARIA ===");
    console.log("1. Calcular Venda");
    console.log("2. Ver Horario de Funcionamento");
    console.log("3. Sair");
   
    opcao = entrada.questionInt("Escolha uma opcao: ");

    if (opcao === 1) {
        let preco = entrada.questionFloat("Preco do produto: ");
        let qtd = entrada.questionInt("Quantidade: ");
        console.log(`Total: R$ ${(preco * qtd).toFixed(2)}`);
    } else if (opcao === 2) {
        console.log("Funcionamos das 07h as 22h.");
    } else if (opcao === 3) {
        console.log("Saindo do sistema...");
    } else {
        console.log("Opcao invalida!");
    }
}
