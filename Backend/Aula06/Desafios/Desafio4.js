const entrada = require("readline-sync")

const cinema = [
    {nome: "Backrooms", classificacao: "Terror", idade_minima: 16},
    {nome: "Homem-aranha", classificacao: "Ficção", idade_minima: 12},
    {nome: "Pixels", classificacao: "Comédia", idade_minima: 10},
];

const idade = entrada.questionInt("Informe sua idade: ");

console.log("Filmes que você pode assistir:");

for (let i = 0; i < cinema.length; i++) {
    if (idade >= cinema[i].idade_minima) {
        console.log(cinema[i].nome);
    }
}