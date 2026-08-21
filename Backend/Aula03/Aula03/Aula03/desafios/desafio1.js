const dias = Number(prompt("Digite a quantidade de dias:"));
    const km = Number(prompt("Digite a quantidade de quilômetros:"));

    let valorKm;

    if (km <= 100) {
        valorKm = km * 0.20;
    } else {
        valorKm = km * 0.15;
    }

    const total = dias * 90213 + valorKm;

    alert("Total a pagar: R$" + total.toFixed(2));