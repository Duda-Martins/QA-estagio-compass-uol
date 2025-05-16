# O Pedro da minha Squad deu a ideia de separar a lógica da parte que executaria o programa.

from calculadora import Calculadora

print("Bem vindo a Calculadora!")

operacao = input("Operações disponíveis:\nSoma - s\nSubtração - sb\nMultiplicação - m\nDivisão - d\nPotenciação - p\nCalcular a média de dois números - m2\nEscolha uma operação: ")

n1 = float(input("Escreva o primeiro número: "))

n2 = float(input("Escreva o segundo número: "))

# Criar uma instância da classe
calculadora = Calculadora()

if operacao == "s":
    resultado = calculadora.soma(n1, n2)
    print("A soma é " + str(resultado))
elif operacao == "sb":
    resultado = calculadora.subtracao(n1, n2)
    print("A subtração é " + str(resultado))
elif operacao == "m":
    resultado = calculadora.multiplicacao(n1, n2)
    print("A multiplicação é " + str(resultado))
elif operacao == "d":
    resultado = calculadora.divisao(n1, n2)
    print("A divisão é " + str(resultado))
elif operacao == "p":
    resultado = calculadora.potenciacao(n1, n2)
    print("A potenciação é " + str(resultado))
elif operacao == "m2":
    resultado = calculadora.media(n1, n2)
    print("A média desses dois números é " + str(resultado))
else:
    print("Operação inválida")