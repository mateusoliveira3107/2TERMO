const esperar = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

async function executar() {
    await esperar(1000);
}


for (let i = 10; i >= 0; i-=1) {
    console.log(`Contagem regressiva: ${i}`);
    executar()
    }
console.log("Decolar!");
