%ComputeMarginal calcula la distribucion marginal sobre un conjunto de variables
%   M = ComputeMarginal(V, F, E) calcula la marginal sobre las variables V
%   en la distribution inducida por el conjunto de factores F, dada la evidencia E
%
%   M es un factor que contiene la marginal sobre las variables V
%   V es un vector que contiene las variables en la marginal, e.g. [1 2 3] para
%     X_1, X_2 y X_3.
%   F es un vector de factores (struct array) con los factores que
%     definen la distribucion
%   E es una matriz N-por-2, cada fila es un par de variable/valor.
%     Variables se encuentran el la primer columna, valores en la segunda.
%     Si no hay evidencia, se pasa la matriz vacia [] para E.


function M = ComputeMarginal(V, F, E)

% Check for empty factor list
if (numel(F) == 0)
      warning('Warning: empty factor list');
      M = struct('var', [], 'card', [], 'val', []);      
      return;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SU CODIGO AQUI:
% M debe ser un factor
% Recuerde renormalizar las entradas de M
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M = struct('var', [], 'card', [], 'val', []); % Devuelve un factor
                                              % vacio, cambie esto

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
