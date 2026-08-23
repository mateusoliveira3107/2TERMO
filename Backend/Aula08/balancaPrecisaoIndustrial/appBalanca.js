const entrada = require('readline-sync');
const funcao = require('./funcoesBalanca');

while (true) {
    try {
        const resposta = entrada.question("Digite o peso da peça [g] ou digite 'sair' para fechar o programa: ");

        if (resposta.toLowerCase() === "sair") {
            break;
        }
    const pesoVerificado = funcao.verificarPeso(resposta);
    console.log(pesoVerificado);

    } catch (erro) {
        console.log(`Alerta: ${erro.message}`);
    }
}
