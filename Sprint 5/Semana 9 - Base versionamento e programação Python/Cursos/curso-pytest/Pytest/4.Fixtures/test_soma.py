import pytest
def soma_dobro(numeros):
    return sum(x * 2 for x in numeros) 

@pytest.fixture
def lista_numeros():
    return [1, 2, 3, 4, 5]

def test_soma_dobro(lista_numeros):
    resultado = soma_dobro(lista_numeros)
    assert resultado == 30, "A soma dobro dos números deve ser 30"

def test_soma_dobro_lista_vazia(lista_numeros):
    lista_numeros.clear()  
    resultado = soma_dobro(lista_numeros)
    assert resultado == 0, "A soma dobro de uma lista vazia deve ser 0"
