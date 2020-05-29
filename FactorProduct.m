% FactorProduct calcula el producto de dos factores
%   C = FactorProduct(A,B) calcula el producto de dos factores, A y B,
%   donde cada factor esta definido sobre un computo de variables con dimension dada
%   La estructura del factor tiene los siguientes campos:
%       .var    Vector de variables en el factor, e.g. [1 2 3]
%       .card   Vector de cardinalidades correspondientes al .var, e.g. [2 2 2]
%       .val    Tabla de valores de tamaño size prod(.card)
%
%   Vea también FactorMarginalization.m, IndexToAssignment.m, and
%   AssignmentToIndex.m

function C = FactorProduct(A, B)

% Revisa por factores vacíos
if (isempty(A.var)), C = B; return; end;
if (isempty(B.var)), C = A; return; end;

% Revisa que las variables en A y B tienen la misma carnalidad
[dummy iA iB] = intersect(A.var, B.var);
if ~isempty(dummy)
	% A and B have at least 1 variable in common
	assert(all(A.card(iA) == B.card(iB)), 'Dimensionality mismatch in factors');
end

% Setea las variables de C
C.var = union(A.var, B.var);

% Construye el map de variables entre variables de A y B y las de C.
% En el codigo siguiente tenemos que
%
%   mapA(i) = j, if and only if, A.var(i) == C.var(j)
% 
% and similarly 
%
%   mapB(i) = j, if and only if, B.var(i) == C.var(j)
%
% Por ejemplo, si A.var = [3 1 4], B.var = [4 5], y C.var = [1 3 4 5],
% entonces, mapA = [2 1 3] y mapB = [3 4]; mapA(1) = 2 porque A.var(1) = 3
% y C.var(2) = 3, asi A.var(1) == C.var(2).

[dummy, mapA] = ismember(A.var, C.var);
[dummy, mapB] = ismember(B.var, C.var);

% Setea la cardinalidad de variables en C
C.card = zeros(1, length(C.var));
C.card(mapA) = A.card;
C.card(mapB) = B.card;

% Inicializa los valores del factor de C:
%   prod(C.card) is the number of entries in C
C.val = zeros(1, prod(C.card));

% Calcula indices stiles
% These will be very useful for calculating C.val
% so make sure you understand what these lines are doing.
assignments = IndexToAssignment(1:prod(C.card), C.card);
indxA = AssignmentToIndex(assignments(:, mapA), A.card);
indxB = AssignmentToIndex(assignments(:, mapB), B.card);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SU CODIGO AQUI:
% Agregue correctamente los valores del factor C
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end
