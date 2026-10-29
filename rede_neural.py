"""Rede de uma camada com sigmoide. Executar: python rede_neural.py."""
import numpy as np


def sigmoide(z):
    return 1.0 / (1.0 + np.exp(-z))


def derivada_sigmoide(saida):
    return saida * (1.0 - saida)


def treinar():
    # Dados didaticos escolhidos: classe igual a primeira entrada.
    # A terceira coluna constante representa o bias.
    X = np.array([[0, 0, 1], [0, 1, 1],
                  [1, 0, 1], [1, 1, 1]], dtype=float)
    y = np.array([[0], [0], [1], [1]], dtype=float)
    rng = np.random.default_rng(1)
    pesos = rng.uniform(-1.0, 1.0, size=(3, 1))
    iniciais = pesos.copy()
    taxa = 1.0
    historico = []
    for epoca in range(10001):
        saida = sigmoide(X @ pesos)
        erro = y - saida
        if epoca in (0, 100, 1000, 5000, 10000):
            historico.append((epoca, float(np.mean(erro ** 2))))
        if epoca == 10000:
            break
        delta = erro * derivada_sigmoide(saida)
        pesos += taxa * (X.T @ delta) / len(X)
    classes = (saida >= 0.5).astype(int)
    print('Pesos iniciais:', iniciais.ravel())
    print('Pesos finais:', pesos.ravel())
    print('Epoca e erro quadratico medio:', historico)
    print('Saidas apos 10000 atualizacoes:\n', saida)
    print('Classes previstas:\n', classes)
    print('Acuracia no treinamento:', np.mean(classes == y))
    return X, y, saida, pesos, iniciais, historico


if __name__ == '__main__':
    treinar()
