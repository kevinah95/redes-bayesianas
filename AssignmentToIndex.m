% AssignmentToIndex Convierte un assignment a un index.
%
%   I = AssignmentToIndex(A, D) converte un assignment, A, sobre variables
%   con cardinalidad D a un index al vector .val vector de un factor. 
%   Si A es una matriz entonces la function convierte cada fila de A a un index.
%
%   See also IndexToAssignment.m and FactorTutorial.m

function I = AssignmentToIndex(A, D)

D = D(:)'; % garantiza que D es un vector fila
if (any(size(A) == 1)),
    I = cumprod([1, D(1:end - 1)]) * (A(:) - 1) + 1;
else
    I = sum(repmat(cumprod([1, D(1:end - 1)]), size(A, 1), 1) .* (A - 1), 2) + 1;
end;

end
