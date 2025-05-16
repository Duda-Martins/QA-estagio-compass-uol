import pytest
def fatorial(n):
    if n == 0:
        return 1
    else:
        return n * fatorial(n-1)
    
@pytest.mark.parametrize("entrada, esperado", [
    (0, 1),
    (1, 1),
    (5, 120),
    (6, 720)
])
def test_fatorial(entrada, esperado):
    assert fatorial(entrada) == esperado

@pytest.mark.parametrize("entrada_negativa", [-1, -2, -10])
def test_fatorial_negativo(entrada_negativa):
    with pytest.raises(RecursionError):
        fatorial(entrada_negativa)
