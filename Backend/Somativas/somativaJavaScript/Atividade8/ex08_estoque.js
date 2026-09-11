const entrada = require('readline-sync');

const componentes = [];

for (let i = 0; i < 3; i++) {
    const nome = entrada.question("\nInforme o nome do componente: ");
    const qntd = entrada.questionInt("Informe a quantidade: ");
    const estoqueMinimo = entrada.questionInt("Informe a quantidade minima de estoque: ");

    let componente = {
        nome: nome,
        quantidade: qntd,
        estoqueMinimo: estoqueMinimo
    }

    componentes.push(componente);
};

for (let i = 0; i < componentes.length; i++) {
    if (componentes[i].quantidade < componentes[i].estoqueMinimo) {
        console.log(`${componentes[i].nome}: REPOR ESTOQUE`);
    } else {
        console.log(`${componentes[i].nome}: ESTOQUE OK`);
    };
};
