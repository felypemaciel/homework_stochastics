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




