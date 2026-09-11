const temperatura = 90

if (temperatura <= 60) {
    console.log(`Temperatura: ${temperatura}C°`);
    console.log("situacao NORMAL");
} else if (temperatura >= 61 && temperatura <= 80) {
    console.log(`Temperatura: ${temperatura}C°`);
    console.log("situacao ATENCAO");
} else {
    console.log(`Temperatura: ${temperatura}C°`);
    console.log("situacao CRITICA");
};