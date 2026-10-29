# Fundamentos da Inteligência Artificial

Projeto acadêmico desenvolvido para a disciplina **Fundamentos da Inteligência Artificial**, do curso Superior de Tecnologia em Ciência de Dados da UNOPAR.

O projeto contempla duas atividades práticas: cálculo de gorjetas com e sem lógica nebulosa e implementação de uma rede neural simples em Python.

## Identificação

- **Aluno:** Mateus Neres da Silva
- **Professor:** Anderson Inacio Salata de Abreu
- **Instituição:** UNOPAR

## Atividades desenvolvidas

### 1. Cálculo de gorjetas

Implementação em GNU Octave de duas abordagens para determinar a gorjeta a partir das notas de qualidade da comida e do serviço, no intervalo de 0 a 10:

- **Modelo convencional:** classifica cada nota em uma categoria exclusiva: ruim, regular ou bom.
- **Modelo nebuloso:** utiliza funções de pertinência e nove regras em um sistema Sugeno de ordem zero.

A gorjeta varia entre **5% e 15%**. A comparação demonstra como o modelo nebuloso produz transições graduais entre os valores.

### 2. Rede neural artificial

Implementação de um neurônio com função de ativação sigmoide utilizando NumPy.

O treinamento utiliza quatro exemplos didáticos, dois atributos de entrada e um termo de viés. A classe desejada corresponde ao primeiro atributo.

São realizadas **10.000 atualizações dos pesos**, com acompanhamento do erro quadrático médio e das classes previstas.

## Arquivos principais

| Arquivo | Descrição |
| --- | --- |
| `gorjetas.m` | Cálculo convencional e nebuloso de gorjetas, com geração de tabela e gráfico. |
| `rede_neural.py` | Implementação e treinamento da rede neural. |

## Requisitos

Para executar as atividades, é necessário ter:

- GNU Octave, com suporte gráfico para gerar a superfície de gorjetas.
- Python 3.
- Biblioteca NumPy.

Instale a dependência do código Python com:

```bash
python -m pip install numpy
```

## Como executar

### Cálculo de gorjetas no GNU Octave

Abra o GNU Octave, acesse a pasta que contém `gorjetas.m` e execute:

```octave
gorjetas
```

O programa exibe os resultados e gera:

- `resultados_gorjetas.csv`: notas de entrada e percentuais calculados pelos dois modelos.
- `superficie_gorjetas.png`: gráfico da superfície de resposta do sistema nebuloso.

### Rede neural em Python

No terminal, acesse a pasta que contém `rede_neural.py` e execute:

```bash
python rede_neural.py
```

O programa exibe os pesos iniciais e finais, o histórico do erro, as saídas da função sigmoide, as classes previstas e a acurácia no conjunto de treinamento.

## Resultados e limitações

O modelo nebuloso apresenta respostas graduais para pequenas mudanças nas notas. Por exemplo, mantendo o serviço em 5, alterar a nota da comida de 2,49 para 2,51 muda a gorjeta nebulosa de 7,49% para 7,51%. No modelo convencional, essa alteração provoca um salto de 5% para 10%.

A rede neural classificou corretamente os quatro exemplos utilizados no treinamento. Esse resultado se refere exclusivamente ao conjunto didático empregado: não foi utilizado um conjunto independente de teste para avaliar a generalização.

Os cálculos da lógica nebulosa foram conferidos com uma implementação equivalente em Python. **A execução nativa do arquivo `gorjetas.m` no GNU Octave ainda precisa ser confirmada.**

## Referências

- UNOPAR. *Fundamentos da Inteligência Artificial: roteiro de aula prática*. Unidades 3 e 4.
- [GNU Octave — Functions and Scripts](https://docs.octave.org/interpreter/Functions-and-Scripts.html)
- [MathWorks — Sugeno Fuzzy Inference System](https://www.mathworks.com/help/fuzzy/sugfis.html)
- [NumPy — Documentação](https://numpy.org/doc/stable/)

## Finalidade

Material desenvolvido para fins acadêmicos e para estudo de lógica nebulosa e redes neurais artificiais.
