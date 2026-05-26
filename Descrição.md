# Método de Newton Quasi-Newton BFGS com Procura Linear de Armijo

# Introdução

Neste trabalho foi implementado o método **BFGS (Broyden–Fletcher–Goldfarb–Shanno)** para a resolução de problemas de otimização não linear sem restrições.

O método BFGS pertence à classe dos métodos **Quasi-Newton**, cujo principal objetivo é aproximar a matriz Hessiana da função objetivo sem necessidade de calcular explicitamente segundas derivadas. Desta forma, obtém-se um método significativamente mais eficiente do que o método de Newton clássico, especialmente em problemas de maior dimensão.

Para garantir convergência global, o comprimento de passo foi determinado através de uma **procura linear de Armijo com backtracking**.

Além disso, sempre que a condição de curvatura não é satisfeita, foi utilizada uma estratégia de **Damped BFGS Update**, permitindo preservar a positividade definida da aproximação da Hessiana inversa.

---

# Formulação do Problema

Pretende-se resolver o seguinte problema de otimização:

[
\min_{w \in \mathbb{R}^n} F(w)
]

onde:

* (F : \mathbb{R}^n \rightarrow \mathbb{R}) é diferenciável;
* (w) representa o vetor de variáveis.

---

# Método BFGS

## Ideia Geral

O método BFGS constrói iterativamente uma aproximação da inversa da Hessiana da função objetivo.

Em cada iteração é calculada uma direção de descida dada por:

[
p_k = -H_k \nabla F(w_k)
]

onde:

* (H_k) representa a aproximação da inversa da Hessiana;
* (\nabla F(w_k)) é o gradiente da função no ponto atual.

O novo ponto é obtido através de:

[
w_{k+1} = w_k + \eta_k p_k
]

onde:

* (\eta_k) é o comprimento de passo obtido pela procura linear de Armijo.

---

# Procura Linear de Armijo com Backtracking

## Objetivo

A procura linear tem como objetivo encontrar um comprimento de passo adequado que produza diminuição suficiente da função objetivo.

Foi utilizada a condição de Armijo:

[
F(w_k+\eta_k p_k)
\le
F(w_k)+c_1\eta_k \nabla F(w_k)^T p_k
]

com:

* (c_1 = 10^{-4})
* (\eta_0 = 1)

---

## Algoritmo de Backtracking

O procedimento inicia-se com:

[
\eta_k = 1
]

Caso a condição de Armijo não seja satisfeita, o passo é reduzido sucessivamente através de:

[
\eta_k \leftarrow \beta \eta_k
]

com:

[
0 < \beta < 1
]

até que a condição seja satisfeita.

---

# Atualização BFGS

Após o cálculo do novo ponto, definem-se:

[
s_k = w_{k+1} - w_k
]

e

[
y_k = \nabla F(w_{k+1}) - \nabla F(w_k)
]

A atualização da aproximação da Hessiana inversa é dada por:

[
H_{k+1} = (I-\rho_k s_k y_k^T) H_k (I-\rho_k y_k s_k^T) + \rho_k s_k s_k^T
]

onde:

[
\rho_k = \frac{1}{y_k^T s_k}
]

Esta atualização permite obter uma boa aproximação da inversa da Hessiana utilizando apenas informação de primeira ordem.

---

# Condição de Curvatura

Para que a matriz (H_{k+1}) permaneça positiva definida, é necessário verificar a condição:

[
s_k^T y_k > 0
]

Caso esta condição não seja satisfeita, a atualização BFGS standard pode perder estabilidade numérica.

---

# Estratégia de Amortecimento — Damped BFGS Update

Quando a condição de curvatura $s_k^T y_k > 0$ não é satisfeita, a atualização BFGS standard pode perder a positividade definida de $H_k$. Para evitar este problema, utiliza-se a estratégia de amortecimento descrita na Secção 18.3 de Nocedal & Wright.

Define-se o parâmetro de amortecimento:

[
\theta_k =
\begin{cases}
1, & \text{se } s_k^T y_k \ge 0.2 \, s_k^T B_k s_k \\[6pt]
\dfrac{0.8 \, s_k^T B_k s_k}{s_k^T B_k s_k - s_k^T y_k}, & \text{caso contrário}
\end{cases}
]

e substitui-se $y_k$ pelo vetor amortecido:

[
r_k = \theta_k \, y_k + (1 - \theta_k) \, B_k \, s_k
]

A atualização BFGS utiliza então $r_k$ em vez de $y_k$, garantindo que $s_k^T r_k > 0$ e preservando a positividade definida da aproximação da Hessiana inversa em todas as iterações.

---

# Critério de Paragem

O algoritmo termina quando:

[
|\nabla F(w_k)|_\infty \le 10^{-6}
]

ou quando é atingido o número máximo de iterações:

[
K_{\max} = 1000
]

---

# Informação Registada

Em cada iteração foi armazenada a seguinte informação:

| Iteração (k) | (w^{(k)}) | (|\nabla F(w^{(k)})|_\infty) | (\eta_k) | (F(w^{(k)})) |
| ------------ | --------- | ---------------------------- | -------- | ------------ |

Este registo permite analisar:

* a convergência do método;
* a evolução da função objetivo;
* o comportamento dos comprimentos de passo;
* a diminuição da norma do gradiente.

---

# Conclusão

O método BFGS revelou-se eficiente na resolução dos problemas de otimização considerados, apresentando convergência rápida sem necessidade de calcular explicitamente a Hessiana da função objetivo.

A utilização da procura linear de Armijo permitiu garantir estabilidade e convergência global do algoritmo, enquanto o mecanismo de **Damped BFGS Update** assegurou a manutenção da positividade definida da aproximação da Hessiana inversa.

Comparativamente ao método de Newton clássico, o BFGS apresenta menor custo computacional e maior robustez prática, sendo um dos métodos Quasi-Newton mais utilizados em otimização não linear.
