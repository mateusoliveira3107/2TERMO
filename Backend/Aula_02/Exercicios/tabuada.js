const entrada = require("readline-sync");
const num = entrada.questionInt("Tabuada de qual numero? ");

for(let i = 1; i <= 10; i++) {
    console.log(`${num} x ${i} = ${num * i}`);
}