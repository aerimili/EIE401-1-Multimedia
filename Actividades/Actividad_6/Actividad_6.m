%Actividad 6  Alejandra Villalobos
clc;clear

%Ruta del audio
ruta = "Pedro.wav";

%Importación de archivo de audio
[audio, fs] = audioread(ruta);

%Para escuchar audio descomentar
%sound(audio, fs); 

%Se crea la reverberación con sus propiedades
reverb = reverberator("PreDelay", 1, "WetDryMix", 0.5);
%Pre-delay de 1 segundo y razón de wet-to-dry-mix de 0.5

%Se añade reverberación al audio original
audioOut = reverb(audio);

%Para escuchat audio con reverberación descomentar
%sound(audioOut, fs);

%Definición de vector tiempo para señal original
t = linspace(0, length(audio)/fs, length(audio));

%Definición de vector tiempo para señal con reverberación
tt = linspace(0, length(audioOut)/fs, length(audioOut));

%Gráficas de audio original y con reverberación
subplot(2,1,1)
plot(t, audio)
title("Señal de audio original")
xlabel("Tiempo(s)")
ylabel("Amplitud")

subplot(2,1,2)
plot(tt, audioOut, color = "magenta")
title("Señal de audio con reverberación")
xlabel("Tiempo(s)")
ylabel("Amplitud")
ylim([-0.6, 0.6])
