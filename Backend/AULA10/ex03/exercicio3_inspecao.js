const fs = require('fs');

const relatorioInspecao = {
    data: "2026-09-23",
    inspetor: "Carlos Alberto",
    amostras: [
        15.2,
        12.5,
        16.8,
        21.3
    ],
    loteAprovado: true
};

for (let a of relatorioInspecao.amostras) {
    if (a < 12) {
        relatorioInspecao.loteAprovado = false;
    };
};

const textoRelatorio = JSON.stringify(relatorioInspecao, null, 2);

fs.writeFileSync('inspecao_qualidade.json', textoRelatorio);

let status;

if (relatorioInspecao.loteAprovado === true) {
    status = "APROVADO"
} else {
    status = "REPROVADO"
};

console.log("\nCadastro Realizado com sucesso!");
console.log("-------- Relatorio --------");
console.log(`Status do relatorio: ${status}`);