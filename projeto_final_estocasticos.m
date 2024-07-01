###acho que sao 3 pessoas(2 homens e 1 mulher)

###look in the corner to find the..blabla shirt...nine men unica coisa q entendi

####blz mas n eh pra entender oq falaram, eh so pra separar as vozes

pkg load signal;
load Mic1.mat;
load Mic2.mat;
load Mic3.mat;
load Voz_conhecida.mat;



sound(Mic1,Fs)

sound(Mic2,Fs)

sound(Mic3,Fs)

sound(Parcial,Fs)



###questao 3
[acf1,lags1] = xcorr(Mic1,'normalized');
[acf2,lags2] = xcorr(Mic2,'normalized');
[acf3,lags3] = xcorr(Mic3,'normalized');
[acf4,lags4] = xcorr(Parcial,'normalized');




figure(1)
plot(lags1,acf1)
figure(2)
plot(lags2,acf2)
figure(3)
plot(lags3,acf3)
figure(4)
plot(lags4,acf4)


####pergunta da questao: posso concluir que eh aproximadamente estacionario?tem as propriedades quando é estacionario: a funçao é par, o valor maximo é no zero...
####e tipo, so faz sentido pedir a PSD se eh estacionario

####questao 4

[pxx1, f1] = pwelch(Mic1, Fs=Fs);  % Calcula a PSD para Mic1
[pxx2, f2] = pwelch(Mic2, Fs=Fs);  % Calcula a PSD para Mic2
[pxx3, f3] = pwelch(Mic3, Fs=Fs);  % Calcula a PSD para Mic3
[pxx4, f4] = pwelch(Parcial, Fs=Fs);  % Calcula a PSD para Parcial


% Plotar a PSD para Mic1
figure(5)
plot(f1, 10*log10(pxx1));    ##lembrando que a PSD eh no dominio da frequencia
xlabel('Frequência (Hz)');
ylabel('Densidade Espectral de Potência (dB/Hz)');
title('Densidade Espectral de Potência (PSD) - Mic1');
grid on;

% Plotar a PSD para Mic2
figure(6)
plot(f2, 10*log10(pxx2));
xlabel('Frequência (Hz)');
ylabel('Densidade Espectral de Potência (dB/Hz)');
title('Densidade Espectral de Potência (PSD) - Mic2');
grid on;

% Plotar a PSD para Mic3
figure(7)
plot(f3, 10*log10(pxx3));
xlabel('Frequência (Hz)');
ylabel('Densidade Espectral de Potência (dB/Hz)');
title('Densidade Espectral de Potência (PSD) - Mic3');
grid on;

% Plotar a PSD para Parcial
figure(8)
plot(f4, 10*log10(pxx4));
xlabel('Frequência (Hz)');
ylabel('Densidade Espectral de Potência (dB/Hz)');
title('Densidade Espectral de Potência (PSD) - Parcial');
grid on;

##sobre questao 5: fiquei na duvida com o que ele quis dizer com variavel aleatoria... na verdade o sinal de audio eh
### uma instancia do processo estocastico, ne.

