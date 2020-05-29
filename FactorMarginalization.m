% FactorMarginalization Suma las variables dadas fuera del factor
%   B = FactorMarginalization(A,V) calcula el factor con las variables
%   en V sumadas. La estructura factor tiene los siguientes campos
%       .var    Vector de variables en el factor, e.g. [1 2 3]
%       .card   Vector de cardinalidades correspondientes a .var, e.g. [2 2 2] 
%       .val    Valor de la tabla de size prod(.card)
%
%   El factor resultante debe tener por lo menos una variable, si no la función
%   produce error
% 
%   Vea tambien FactorProduct.m, IndexToAssignment.m, and AssignmentToIndex.m

function B = FactorMarginalization(A, V)

% Revisa por un factor vacio o lista de variables vacua
if (isempty(A.var) || isempty(V)), B = A; return; end;

% Construye la salida sobre over A.var \ V (las variables en A.var que no están en V)
% y mapeo de variable entre A y B
[B.var, mapB] = setdiff(A.var, V);

% Check for empty resultant factor
if isempty(B.var)
  error('Error: Resultant factor has empty scope');
end;

% Inicializa B.card y B.val
B.card = A.card(mapB);
B.val = zeros(1, prod(B.card));

% Calcula algunos indices de ayuda
% Seran muy stiles para calcular B.val
% asegurese de que entiende lo que hacen estas lineas de coding
assignments = IndexToAssignment(1:length(A.val), A.card);
indxB = AssignmentToIndex(assignments(:, mapB), B.card);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PONGA SU CODIGO AQUI
% Agregue los valores del factor B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:length(A.val)
    B.val(indxB(i)) += A.val(i);
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
