import pytest
from calculadora import Calculadora

# Criar uma instância da classe
calculadora = Calculadora()

def test_divisao_por_zero():
    with pytest.raises(ZeroDivisionError):
        calculadora.divisao(30,0)

def test_divisao_por_zero2():
    with pytest.raises(ZeroDivisionError) as exec_info:
        calculadora.divisao(30,0)
    assert "Não é possível dividir por zero." in str(exec_info)
