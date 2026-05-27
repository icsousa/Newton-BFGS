# Método de Newton BFGS (T3)

# Introdução

Neste trabalho foi implementado o método **BFGS (Broyden-Fletcher-Goldfarb-Shanno)** para a resolução de problemas de otimização não linear sem restrições.

O método BFGS pertence à classe dos métodos **Quasi-Newton**, cujo principal objetivo é aproximar a matriz Hessiana da função objetivo sem necessidade de calcular explicitamente segundas derivadas. Desta forma, obtém-se um método significativamente mais eficiente do que o método de Newton clássico, especialmente em problemas de maior dimensão.

Para garantir convergência global, o comprimento de passo foi determinado através de uma **procura linear de Armijo com backtracking**.

Além disso, sempre que a condição de curvatura não é satisfeita, foi utilizada uma estratégia de **Damped BFGS Update**, permitindo preservar a positividade definida da aproximação da Hessiana inversa.

