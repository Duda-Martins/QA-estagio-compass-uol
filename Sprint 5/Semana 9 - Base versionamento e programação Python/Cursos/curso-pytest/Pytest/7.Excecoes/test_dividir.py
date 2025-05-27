import pytest

def dividir(a, b):
    if b == 0:
        raise ValueError("O divisor não pode ser zero.")
    return a / b

def test_dividir_com_divisor_zero():
    with pytest.raises(ValueError) as excinfo:
        dividir(10, 0)
    assert "O divisor não pode ser zero." in str(excinfo.value)

def test_dividir_com_divisao_normal():
    assert dividir(10, 2) == 5, "Deve retornar o resultado correto da divisão"
