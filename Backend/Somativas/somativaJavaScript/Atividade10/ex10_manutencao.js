const entrada = require('readline-sync');
const funcoes = require('./funcoesManutencao')

const nomeMaquina = entrada.question("Informe o nome da maquina: ");
const valorPecas = entrada.questionInt("Informe o valor das pecas: ");
const horasServico = entrada.questionInt("Informe as horas de servico: ");
const mesesUltimaManutencao = entrada.questionInt("Informe os meses desde a ultima manutencao: ");

const maoDeObra = funcoes.calcularMaoDeObra(horasServico);
const total = funcoes.calcularTotal(valorPecas, maoDeObra);
const garantia = funcoes.verificarGarantia(mesesUltimaManutencao);

console.log("\n===== Relatorio de Manutencao =====");
console.log(`Nome da maquina: ${nomeMaquina}`);
console.log(`Mao de Obra: ${maoDeObra.toFixed(2)}`);
console.log(`Pecas: R$${valorPecas.toFixed(2)}`);
console.log(`Total: R$${total.toFixed(2)}`);
console.log(`Situacao da Garantia: ${garantia}`);