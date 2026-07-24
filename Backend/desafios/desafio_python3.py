produto = {"nome": "Teclado Mecânico", "preco": 200.00, "estoque": 15}

def aplicar_desconto(a):
    desconto = int(input("Digite a porcentagem de desconto: "))
    preco_desconto = a['preco'] * (desconto/100)
    a['preco'] -= preco_desconto
    print(f"O produto {a['nome']} agora custa R${a['preco']}")

aplicar_desconto(produto)