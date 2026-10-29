% Fundamentos da Inteligencia Artificial - Mateus Neres da Silva
% Executar no Octave: gorjetas
clear; clc;
% Pertinencias: ruim, regular e bom, para notas de 0 a 10.
mu = @(x) [max(0, 1-x/5), max(0, 1-abs(x-5)/5), max(0, (x-5)/5)];
% Linhas: comida; colunas: servico. Consequentes Sugeno em %.
regras = [5 5 10; 5 10 15; 10 15 15];
casos = [0 0; 2 2; 2.49 5; 2.51 5; 4.9 5; 5 5; 5.1 5; 8 8; 10 10; 0 10; 10 0];
resultado = zeros(rows(casos), 4);
for k = 1:rows(casos)
  comida = casos(k,1); servico = casos(k,2);
  assert(isfinite(comida) && isfinite(servico));
  assert(comida >= 0 && comida <= 10 && servico >= 0 && servico <= 10);
  % Solucao convencional: categorias exclusivas por maior pertinencia.
  if comida < 2.5; ic = 1; elseif comida <= 7.5; ic = 2; else; ic = 3; endif
  if servico < 2.5; is = 1; elseif servico <= 7.5; is = 2; else; is = 3; endif
  convencional = regras(ic,is);
  % Solucao nebulosa: todas as nove regras, operador E por produto.
  mc = mu(comida); ms = mu(servico);
  pesos = mc' * ms;
  nebulosa = sum(sum(pesos .* regras)) / sum(pesos(:));
  resultado(k,:) = [comida, servico, convencional, nebulosa];
endfor
fprintf('Comida Servico Convencional(%%) Nebulosa(%%)\n');
fprintf('%5.1f %7.1f %15.2f %11.2f\n', resultado');
csvwrite('resultados_gorjetas.csv', resultado);
notas = 0:0.25:10;
[C,S] = meshgrid(notas,notas); G = zeros(size(C));
for k = 1:numel(C)
  pesos = mu(C(k))' * mu(S(k));
  G(k) = sum(sum(pesos .* regras)) / sum(pesos(:));
endfor
figure; surf(C,S,G);
xlabel('Qualidade da comida'); ylabel('Qualidade do servico');
zlabel('Gorjeta (%)'); title('Sistema nebuloso Sugeno');
print('superficie_gorjetas.png','-dpng');
