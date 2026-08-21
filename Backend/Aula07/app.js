const entrada = require("readline-sync");

// Importar o módulo funcoesOficina
const oficina = require('./funcoesOficina');

console.log("=== SISTEMA DE GESTAO DE OFICINA ===");

const peca = entrada.questionFloat("Preco da peca: R$");
const horas = entrada.questionInt("Horas de servico: ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");

const statusGarantia = oficina.verificarGarantia(tempoUso);
const total = oficina.calcularOrcamento(peca, horas);
let valorComDesconto = oficina.totalComDesconto(total)

// Relatório Final
console.log("\n------- RELATORIO DE SERVICO -------");
console.log(`Orcamento: R$${total.toFixed(2)}`);
console.log(`Orcamento com desconto (5%): R$${valorComDesconto.toFixed(2)}`);
console.log(`Status da Garantia ${statusGarantia}`);
console.log("----".repeat(12));