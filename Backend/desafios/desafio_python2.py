numeros = [12, 5, 8, 21, 14, 3, 10, 7]
soma_pares = 0
pares = []

for i in numeros:
    if i % 2 == 0:
        pares.append(i)
        soma_pares += i
    else:
        continue
media = soma_pares / len(pares)
print(f"Números pares da lista: {pares}")
print(f"Média dos números pares: {media:.2f}")