const fs = require('fs');

console.log("=== RELATÓRIO DE FERRAMENTAL ===");

const nomeArquivo = 'ferramentas.json';

try {
    if (!fs.existsSync(nomeArquivo)) {
        throw new Error(`O arquivo '${nomeArquivo}' não foi encontrado.`);
    }

    const textoArquivo = fs.readFileSync(nomeArquivo, 'utf-8');
    const ferramentas = JSON.parse(textoArquivo);

    console.log(`\nItens cadastrados: ${ferramentas.length}`);
    console.log("\n--- ESTOQUE DE FERRAMENTAS ---");

    let valorTotalEstoque = 0;
    let quantidadeTotal = 0;

    for (let i = 0; i < ferramentas.length; i++) {
        const ferramenta = ferramentas[i];

        const valorItem =
            ferramenta.quantidade * ferramenta.custo_unitario;

        quantidadeTotal += ferramenta.quantidade;
        valorTotalEstoque += valorItem;

        console.log(
            `${ferramenta.nome.padEnd(25, ' ')} | ` +
            `Quantidade: ${String(ferramenta.quantidade).padStart(3, ' ')} | ` +
            `Unitário: R$ ${ferramenta.custo_unitario.toFixed(2)} | ` +
            `Total: R$ ${valorItem.toFixed(2)}`
        );
    }

    console.log("\n--- RESUMO DO ESTOQUE ---");

    console.log(`Tipos de ferramentas: ${ferramentas.length}`);
    console.log(`Quantidade total de peças: ${quantidadeTotal}`);
    console.log(
        `Valor total do estoque: R$ ${valorTotalEstoque.toFixed(2)}`
    );

} catch (erro) {
    console.log(`Erro ao processar o arquivo: ${erro.message}`);
}