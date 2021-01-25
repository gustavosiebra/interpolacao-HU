%%
% AUTOR: GUSTAVO SIEBRA
% DATA: 27/09/2019
% LOCAL: MACAPA
% 
% ESSAS INFORMACOES ESTAO NO ARQUIVO TCC-RESULTADOS 
% NA SHEET HIDROGRAMA SCS
%
% O ARQUIVO HU.txt DEVE CONTER AS SEGUINTES INFORMACOES:
% 
% COLUNA C: t (h)		
% COLUNA D: separador
% COLUNA E: q (m³/s)
% 
% O ARQUIVO HU1.txt DEVE CONTER AS SEGUINTES INFORMACOES:
% 
% COLUNA F: t (h)		
% 
% COM ESSAS INFORMACOES O NUMEROS PRECISAM ESTAR SALVOS NO PADRAO AMERICANO
% EXEMPLO: 10.4, 2.7, 4.3
% 
% NA DISMA USA PONTO E PARA SEPARAR USA VIRGULA.

%%
clc
clear all
close all

%% Carregando arquivo
data1 = load('HU.txt');
data2 = load('HU1.txt');

%% Condições

dataset1 = data1;
dataset2 = data2;

[linha1, col1] = size(data1);
[linha2, acol2] = size(data2);

%vazaoEntrada(1,1) = 0;
%vazaoNegativa(1,1) = 0;
vazaoSaida(1,1) = 0;

%vazaoPositiva(2,1) = dataset2(1,2) + vazaoNegativa(1,1);
%j = 3;

%%
for i=1:linha2
   
    m = 0;
    k = 1;
    while(m == 0)
        if (dataset1(k,1) <= dataset2(i,1) && dataset1(k+1,1) >= dataset2(i,1))
            m1 = dataset1(k,1);
            m2 = dataset1(k+1,1);
            n1 = dataset1(k,2);
            n2 = dataset1(k+1,2);
            %p1 = dataset1(k,3);
            %p2 = dataset1(k+1,3);

            calculoVazao = (n2*(m2-m1)-(n2-n1)*(m2-dataset2(i,1)))/(m2-m1);
            %calculoVazaoSaida = (p2*(m2-m1)-(p2-p1)*(m2-dataset2(i,1)))/(m2-m1);

            m = 1;
        end
        k = k + 1;
    end

    %vazaoNegativa(i,1) = calculoVazaoNegativa;
    vazaoSaida(i,1) = calculoVazao;
    %vazaoPositiva(j,1) = dataset2(i,2) + vazaoNegativa(i,1);
    %j = j+1;
end