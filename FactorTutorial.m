% Descripcion detallada de la estructura de factor y funciones relacionadas
% -----------------------------------------------------------------------
% Usaremos estructuras para implementar el tipo de dato factor. el código
%
%   phi = struct('var', [3 1 2], 'card', [2 2 2], 'val', ones(1, 8));
%
% crea un factor sobre las variables X_3, X_1, X_2, las cuales son todas binarias
% phi ha sido inicializado tal que 
% phi(X_3, X_1, X_2) = 1 para cualquier asignación de las variables
%
% Los valores de un factor se guardan en formato de filas el campo vector .val
% utilizando un ordenamiento como se expresa en el siguiente cuadro
%
% -+-----+-----+-----+-------------------+   
%  | X_3 | X_1 | X_2 | phi(X_3, X_1, X_2)|
% -+-----+-----+-----+-------------------+
%  |  1  |  1  |  1  |     phi.val(1)    |
% -+-----+-----+-----+-------------------+
%  |  2  |  1  |  1  |     phi.val(2)    |
% -+-----+-----+-----+-------------------+
%  |  1  |  2  |  1  |     phi.val(3)    |
% -+-----+-----+-----+-------------------+
%  |  2  |  2  |  1  |     phi.val(4)    |
% -+-----+-----+-----+-------------------+
%  |  1  |  1  |  2  |     phi.val(5)    |
% -+-----+-----+-----+-------------------+
%  |  2  |  1  |  2  |     phi.val(6)    |
% -+-----+-----+-----+-------------------+
%  |  1  |  2  |  2  |     phi.val(7)    |
% -+-----+-----+-----+-------------------+
%  |  2  |  2  |  2  |     phi.val(8)    |
% -+-----+-----+-----+-------------------+
%
%
% Se proveen las funciones AssignmentToIndex and IndexToAssignment
% que calculan este mapeo de asignaciones a indices y viceversa
% 
%   I = AssignmentToIndex(A, D)
%   A = IndexToAssignment(I, D)
%
% Poe ejmplo, para el factor definido arriba, con la assignation
%
%    A = [2 1 2] 
%
% para X_3, X_1 y X_2 respectivamente (dado por phi.var = [3 1 2]), I = 6 
% como phi.val(6) corresponde al valor de phi(X_3 = 2, X_1 = 1, X_2 = 2).
% Entonces, AssignmentToIndex([2 1 2], [2 2 2]) retorna 6, y conversamente, 
% IndexToAssignment(6, [2 2 2]) retorna el vector [2 1 2]. El segundo parametro
% en la funcion corresponde a la cardinalidad del factor phi, phi.card, que 
% en este ejemplo es [2 2 2].
%
% Mas generalmente, la asignacion al vector A es un vector fila que corresponde
% a asignaciones de variables en un factor, con el entendimiento de que las
% variables para el cual se refieren las asignaciones estan dadas por el campo .var
% del factor. 
%
% Si se le da a AssignmentToIndex una matriz A, una assignemt por fila, provocara que 
% retorne un vector de indices I, tal que I(k) es el indice 
% que corresponde a al assignment en A(k, :) (la fila k). 
% 
% Similarmente, si se le da a IndexToAssignment un vector I de indices este genera
% una matriz A de assignments, uno por fila, tal que A(k, :) (la k-esima fila de A)
% corresponde al assignment mapeado por el indice I(k).
%
% Obtener y setear valores en los factores
% -------------------------------------
%
% Se provee por conveniencia las funciones GetValueOfAssignment y
% SetValueOfAssignment tal que no necesita manipular los valores del campo .val
% directamente.
%
% Por ejemplo, si ejecuta 
%
%   GetValueOfAssignment(phi, [1 2 1]) 
%
% esto obtiene los campos con valor phi(X_3 = 1, X_1 = 2, X_2 = 1). De nuevo, las variablas 
% para las cuales se refiere assignments estan dadas por el campo .var del factor.
%
% De la misma manera, si ejecuta 
%
%    phi = SetValueOfAssignment(phi, [2 2 1], 6) 
%
% provoca que el valor de phi(X_3 = 2, X_1 = 2, X_2 = 1) se fije a 6. Note 
% que como MATLAB/Octave pasa los argumentos de una funcion por valor y no por 
% referencia, SetValueOfAssignment *NO modifica* el factor que le envio. 
% Mas bien retorna un nuevo factor con el valor para el assignment específico modificado, 
% Esta es la razon por la cual se reasigno a phi con el resultado de SetValueOfAssignment.
%
% Mas detalles sobre estas funciones en sus respectivos archivos .m
% files.

% Ejemplos de Factores y su Salida
% --------------------------
%
% In the following, we have provided you with some sample input factors, as 
% well as the output that you should receive when various operations are
% performed on these factors. You may find these sample inputs and outputs
% helpful in debugging your implementation. For instance, FACTORS.PRODUCT 
% is the factor you should get when you execute 
%
%   FactorProduct(FACTORS.INPUT(1), FACTORS.INPUT(2))
%
% These sample factors define a simple chain Bayesian network over binary 
% variables: X_1 -> X_2 -> X_3
%

% FACTORS.INPUT(1) contains P(X_1)
FACTORS.INPUT(1) = struct('var', [1], 'card', [2], 'val', [0.11, 0.89]);

% FACTORS.INPUT(2) contains P(X_2 | X_1)
FACTORS.INPUT(2) = struct('var', [2, 1], 'card', [2, 2], 'val', [0.59, 0.41, 0.22, 0.78]);

% FACTORS.INPUT(3) contains P(X_3 | X_2)
FACTORS.INPUT(3) = struct('var', [3, 2], 'card', [2, 2], 'val', [0.39, 0.61, 0.06, 0.94]);

% Factor Product
% FACTORS.PRODUCT = FactorProduct(FACTORS.INPUT(1), FACTORS.INPUT(2));
% The factor definido aqui es correcto con 4 decimales.
FACTORS.PRODUCT = struct('var', [1, 2], 'card', [2, 2], 'val', [0.0649, 0.1958, 0.0451, 0.6942]);

% Factor Marginalization
% FACTORS.MARGINALIZATION = FactorMarginalization(FACTORS.INPUT(2), [2]);
FACTORS.MARGINALIZATION = struct('var', [1], 'card', [2], 'val', [1 1]); 

% Observe Evidence
% FACTORS.EVIDENCE = ObserveEvidence(FACTORS.INPUT, [2 1; 3 2]);
FACTORS.EVIDENCE(1) = struct('var', [1], 'card', [2], 'val', [0.11, 0.89]);
FACTORS.EVIDENCE(2) = struct('var', [2, 1], 'card', [2, 2], 'val', [0.59, 0, 0.22, 0]);
FACTORS.EVIDENCE(3) = struct('var', [3, 2], 'card', [2, 2], 'val', [0, 0.61, 0, 0]);

% Compute Joint Distribution
% FACTORS.JOINT = ComputeJointDistribution(FACTORS.INPUT);
FACTORS.JOINT = struct('var', [1, 2, 3], 'card', [2, 2, 2], 'val', [0.025311, 0.076362, 0.002706, 0.041652, 0.039589, 0.119438, 0.042394, 0.652548]);

% Compute Marginal
%FACTORS.MARGINAL = ComputeMarginal([2, 3], FACTORS.INPUT, [1, 2]);
FACTORS.MARGINAL = struct('var', [2, 3], 'card', [2, 2], 'val', [0.0858, 0.0468, 0.1342, 0.7332]);
