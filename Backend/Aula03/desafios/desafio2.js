const numeros = [12, 5, 8, 21, 14, 3, 10, 7];
const pares = [];

for (let num of numeros) {
    if (num % 2 === 0) {
        pares.push(num);
    }
}

// Somando os valores do array
let soma = 0;

for (let num of pares) {
    soma += num;
}

// Calculando a média
const media = soma / pares.length;

console.log("Números pares:", pares);
console.log("Média dos números pares:", media.toFixed(2));
