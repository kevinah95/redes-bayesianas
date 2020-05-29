%ComputeJointDistribution calcula la distribution conjunta de una distribución definida
% por un conjunto de factores
%
%   Joint = ComputeJointDistribution(F) calcula la distribucion conjunta
%   definida por un conjunto de factores
%
%   Joint es un factor que encapsula la distribucion conjunta dada por F
%   F es el vector de factores (array de struct) que contiene los factores
%     que definen la distribución
%

function Joint = ComputeJointDistribution(F)

  % Reviso por una lista de factores vacua
  if (numel(F) == 0)
      warning('Error: empty factor list');
      Joint = struct('var', [], 'card', [], 'val', []);      
      return;
  end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SU CODIGO AQUI:
% Calcule la distribucion conjunta definida por F
% Puede asumir que se le da un vector con funciones de probabilidad
% bien definidas, tal que no debe hacer revision de sus entradas
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
Joint = struct('var', [], 'card', [], 'val', []); % Devuelve un
                                                  % factor vacio,
                                                  % cambie esto

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

