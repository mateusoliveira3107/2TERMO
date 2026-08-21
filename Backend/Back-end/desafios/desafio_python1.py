aluguel = 90
preco_km = 0.20
preco_km_mais_100 = 0.15

def receber():
    km_cliente = float(input("Digite a quantidade de km rodados pelo cliente: "))
    dias = int(input("Digite a quantidade de dias que o cliente ficou com o carro: "))
    aluguel_dias = dias * aluguel

    if km_cliente < 100:
        total = aluguel_dias + (km_cliente * preco_km)
    else:
        total = aluguel_dias + (km_cliente * preco_km_mais_100)
    print(f"O valor total a ser pago pelo cliente é: R$ {total:.2f}")

receber()