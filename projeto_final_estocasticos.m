###acho que sao 3 pessoas(2 homens e 1 mulher)

###look in the corner to find the..blabla shirt...nine men unica coisa q entendi

####blz mas n eh pra entender oq falaram, eh so pra separar as vozes
pkg load signal;
pkg load statistics;
load Mic1.mat;
load Mic2.mat;
load Mic3.mat;
load Voz_conhecida.mat;

# repodução dos áudios
#sound(Mic1,Fs)

#sound(Mic2,Fs)

#sound(Mic3,Fs)

#sound(Parcial,Fs)

% Plotando os sinais de áudio
figure;
subplot(4,1,1);
plot(Mic1);
title('Dados do Mic1');

subplot(4,1,2);
plot(Mic2);
title('Dados do Mic2');

subplot(4,1,3);
plot(Mic3);
title('Dados do Mic3');

subplot(4,1,4);
plot(Parcial);
title('Dados da Voz Conhecida');

###questao 3
[acf1,lags1] = xcorr(Mic1,'normalized');
[acf2,lags2] = xcorr(Mic2,'normalized');
[acf3,lags3] = xcorr(Mic3,'normalized');
[acf4,lags4] = xcorr(Parcial,'normalized');




figure(2)
plot(lags1(lags1>0),acf1(lags1>0)) # plotando apenas os lags positivos para melhorar a vizualização
figure(3)
plot(lags2(lags2>0),acf2(lags2>0))
figure(4)
plot(lags3(lags3>0),acf3(lags3>0))
figure(5)
plot(lags4(lags4>0),acf4(lags4>0))


####pergunta da questao: posso concluir que eh aproximadamente estacionario?tem as propriedades quando é estacionario: a funçao é par, o valor maximo é no zero...
####e tipo, so faz sentido pedir a PSD se eh estacionario
####tem tbm as analises de média e variancia la em baixo

####questao 4

[pxx1, f1] = pwelch(Mic1, [], [], [], Fs);  % Calcula a PSD para Mic1
[pxx2, f2] = pwelch(Mic2, [], [], [], Fs);   % Calcula a PSD para Mic2
[pxx3, f3] = pwelch(Mic3, [], [], [], Fs);   % Calcula a PSD para Mic3
[pxx4, f4] = pwelch(Parcial,[], [], [], Fs);   % Calcula a PSD para Parcial

% Plotar a PSD para Mic1
figure(6)
plot(f1, 10*log10(pxx1));    ##lembrando que a PSD eh no dominio da frequencia
xlabel('Frequência (Hz)');
ylabel('Densidade Espectral de Potência (dB/Hz)');
title('Densidade Espectral de Potência (PSD) - Mic1');
grid on;

% Plotar a PSD para Mic2
figure(7)
plot(f2, 10*log10(pxx2));
xlabel('Frequência (Hz)');
ylabel('Densidade Espectral de Potência (dB/Hz)');
title('Densidade Espectral de Potência (PSD) - Mic2');
grid on;

% Plotar a PSD para Mic3
figure(8)
plot(f3, 10*log10(pxx3));
xlabel('Frequência (Hz)');
ylabel('Densidade Espectral de Potência (dB/Hz)');
title('Densidade Espectral de Potência (PSD) - Mic3');
grid on;

% Plotar a PSD para Parcial
figure(9)
plot(f4, 10*log10(pxx4));
xlabel('Frequência (Hz)');
ylabel('Densidade Espectral de Potência (dB/Hz)');
title('Densidade Espectral de Potência (PSD) - Parcial');
grid on;

##sobre questao 5: fiquei na duvida com o que ele quis dizer com variavel aleatoria... na verdade o sinal de audio eh
### uma instancia do processo estocastico, ne. Sim, seria uma realização das variáveos aleatorias indexadas no tempo



# Só para uma análise mais a fundo (verificando se a média e a variância
# ao decorrer do tempo tende a ter valores próximos
window_size = 1024;  % Tamanho da janela (ajuste conforme necessário)
overlap = 512;       % Sobreposição entre janelas (ajuste conforme necessário)

% Função para calcular a média e a variância em janelas temporais
function [mean_vals, var_vals] = window_stats(signal, window_size, overlap)
    step = window_size - overlap;
    num_windows = floor((length(signal) - overlap) / step);
    mean_vals = zeros(1, num_windows);
    var_vals = zeros(1, num_windows);
    for i = 1:num_windows
        start_idx = (i-1) * step + 1;
        end_idx = start_idx + window_size - 1;
        window_data = signal(start_idx:end_idx);
        mean_vals(i) = mean(window_data);
        var_vals(i) = var(window_data);
    end
end

% Calcular e plotar média e variância para Mic1
[mean_vals1, var_vals1] = window_stats(Mic1, window_size, overlap);
figure;
subplot(2,1,1);
plot(mean_vals1);
title('Média em janelas temporais - Mic1');
subplot(2,1,2);
plot(var_vals1);
title('Variância em janelas temporais - Mic1');

% Repetir para Mic2, Mic3 e Parcial
[mean_vals2, var_vals2] = window_stats(Mic2, window_size, overlap);
figure;
subplot(2,1,1);
plot(mean_vals2);
title('Média em janelas temporais - Mic2');
subplot(2,1,2);
plot(var_vals2);
title('Variância em janelas temporais - Mic2');

[mean_vals3, var_vals3] = window_stats(Mic3, window_size, overlap);
figure;
subplot(2,1,1);
plot(mean_vals3);
title('Média em janelas temporais - Mic3');
subplot(2,1,2);
plot(var_vals3);
title('Variância em janelas temporais - Mic3');

[mean_vals4, var_vals4] = window_stats(Parcial, window_size, overlap);
figure;
subplot(2,1,1);
plot(mean_vals4);
title('Média em janelas temporais - Parcial');
subplot(2,1,2);
plot(var_vals4);
title('Variância em janelas temporais - Parcial');


