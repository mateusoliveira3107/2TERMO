const entrada = require('readline-sync');
const funcao = require('./funcoesBalanca');

while (true) {
    try {
        const resposta = entrada.question("Digite o peso da peca [g] ou digite 'sair' para fechar o programa: ");
        
        if (resposta.toLowerCase() === "sair") {
            break;
    }
    
    const peso = Number(resposta);
    
    const pesoVerificado = funcao.verificarPeso(peso);
    console.log(pesoVerificado);
    
    } catch (erro) {
        console.log(`ALERTA: Entrada inválida.\n`);
    }
}