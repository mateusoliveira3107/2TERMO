const entrada = require('readline-sync');

const listaVisitantes = [];

while (true) {
    const resposta = entrada.keyInYNStrict("Deseja cadastrar um novo visitante?");

    if (resposta === true) {
        const nome = entrada.question("Informe o nome: ");
        const empresa = entrada.question("Informe a empresa: ");

        const novoVisitante =  {
            nome: nome,
            empresa: empresa
        };
        listaVisitantes.push(novoVisitante);
    } else {
        console.log("\n===== Lista de Visitantes =====");
        for (let visitantes of listaVisitantes) {
            console.log(`Nome: ${visitantes.nome}  |  Empresa: ${visitantes.empresa};`);
        };
        break;
    };
};