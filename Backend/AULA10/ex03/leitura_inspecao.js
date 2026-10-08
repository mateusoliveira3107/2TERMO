const fs = require('fs');

console.log("=== CONSULTA DE INSPEÇÃO DE QUALIDADE ===");

const nomeArquivo = 'inspecao_qualidade.json';

try {
    if (!fs.existsSync(nomeArquivo)) {
        throw new Error(`O arquivo '${nomeArquivo}' não foi encontrado.`);
    }

    const textoArquivo = fs.readFileSync(nomeArquivo, 'utf-8');
    const relatorio = JSON.parse(textoArquivo);

    console.log("\n--- DADOS DA INSPEÇÃO ---");

    console.log(`Data: ${relatorio.data}`);
    console.log(`Inspetor: ${relatorio.inspetor}`);

    console.log("\nMedições:");

    let menorMedida = relatorio.amostras[0];
    let maiorMedida = relatorio.amostras[0];
    let soma = 0;

    for (let i = 0; i < relatorio.amostras.length; i++) {
        const medida = relatorio.amostras[i];

        console.log(`Amostra ${i + 1}: ${medida.toFixed(2)} mm`);

        soma += medida;

        if (medida < menorMedida) {
            menorMedida = medida;
        }

        if (medida > maiorMedida) {
            maiorMedida = medida;
        }
    }

    const media = soma / relatorio.amostras.length;

    console.log("\n--- ANÁLISE DO LOTE ---");

    console.log(`Menor medida: ${menorMedida.toFixed(2)} mm`);
    console.log(`Maior medida: ${maiorMedida.toFixed(2)} mm`);
    console.log(`Média: ${media.toFixed(2)} mm`);

    let statusLote;

    if (relatorio.loteAprovado === true) {
        statusLote = "APROVADO"
    } else {
        statusLote = "REPROVADO"
    };

    console.log(`Status registrado: ${statusLote}`);

    if (!relatorio.loteAprovado) {
        console.log(
            "Atenção: o lote possui pelo menos uma medida " +
            "abaixo da tolerância mínima."
        );
    }

} catch (erro) {
    console.log(`Falha ao consultar a inspeção: ${erro.message}`);
}