import pytest
from calculadora import Calculadora

# Criar uma instância da classe
calculadora = Calculadora()

@pytest.mark.basico
@pytest.mark.parametrize("n1_soma, n2_soma, resultado_esperado_soma", [(1, 5, 6), (5, 10, 15), (6, 8, 14)])
def test_soma(n1_soma, n2_soma, resultado_esperado_soma):
    assert calculadora.soma(n1_soma, n2_soma) == resultado_esperado_soma

@pytest.mark.basico
@pytest.mark.parametrize("n1_subtracao, n2_subtracao, resultado_esperado_subtracao", [(8, 6, 2), (5, 2, 3), (16, 8, 8)])
def test_subtracao(n1_subtracao, n2_subtracao, resultado_esperado_subtracao):
    assert calculadora.subtracao(n1_subtracao, n2_subtracao) == resultado_esperado_subtracao

@pytest.mark.basico
@pytest.mark.parametrize("n1_multiplicacao, n2_multiplicacao, resultado_esperado_multiplicacao", [(3, 2, 6), (6, 5, 30), (8, 2, 16)])
def test_multiplicacao(n1_multiplicacao, n2_multiplicacao, resultado_esperado_multiplicacao):
    assert calculadora.multiplicacao(n1_multiplicacao, n2_multiplicacao) == resultado_esperado_multiplicacao

@pytest.mark.basico
@pytest.mark.parametrize("n1_divisao, n2_divisao, resultado_esperado_divisao", [(8, 2, 4), (15, 5, 3), (21, 7, 3)])
def test_divisao(n1_divisao, n2_divisao, resultado_esperado_divisao):
    assert calculadora.divisao(n1_divisao, n2_divisao) == resultado_esperado_divisao

@pytest.mark.avancado
@pytest.mark.parametrize("n1_potenciacao, n2_potenciacao, resultado_esperado_potenciacao", [(2, 2, 4), (10, 2, 100), (4, 2, 16)])
def test_potenciacao(n1_potenciacao, n2_potenciacao, resultado_esperado_potenciacao):
    assert calculadora.potenciacao(n1_potenciacao, n2_potenciacao) == resultado_esperado_potenciacao

@pytest.mark.avancado
@pytest.mark.parametrize("n1_media, n2_media, resultado_esperado_media", [(18, 16, 17), (20, 14, 17), (45, 65, 55)])
def test_media(n1_media, n2_media, resultado_esperado_media):
    assert calculadora.media(n1_media, n2_media) == resultado_esperado_media
