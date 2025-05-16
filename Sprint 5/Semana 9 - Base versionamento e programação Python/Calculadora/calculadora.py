# Copiei o esqueleto da classe do Gemini.

class Calculadora:
    def __init__(self):
        pass

    def soma(self, n1, n2):
        resultado = n1 + n2
        return resultado

    def subtracao(self, n1, n2):
        resultado = n1 - n2
        return resultado
    
    def multiplicacao(self, n1, n2):
        resultado = n1 * n2
        return resultado
    
    def divisao(self, n1, n2):
        # Mensagem de erro tirada do curso de pytest.
        if n2 == 0:
            raise ZeroDivisionError("Não é possível dividir por zero.")
        resultado = n1 / n2
        return resultado
    
    def potenciacao(self, n1, n2):
        resultado = n1 ** n2
        return resultado
    
    def media(self, n1, n2):
        resultado = (n1 + n2) / 2
        return resultado
