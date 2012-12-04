clc;
close all;
clear all;
fclose all;

%Cargo las Imagenes
kernel= func_CargarImagen('kernel.jpg','.\Imagenes');

Img=func_CargarImagen('ImgCompleta2.jpg','.\Imagenes');
MaxOrig = func_ObtenerMaximos2(Img)
DistanciaOriginal=norm([(MaxOrig(4,1)-MaxOrig(3,1)) (MaxOrig(4,2)-MaxOrig(3,2))])
figure('name','Imagen Original','NumberTitle','off');
MatCorrelacion= func_Correlacionar(kernel,Img);
imshow(MatCorrelacion);


figure('name','Imagen Original','NumberTitle','off');
imshow(Img);
MatCorrelacion= func_Correlacionar2(kernel,Img);
figure('name','Imagen Original','NumberTitle','off');
imshow(MatCorrelacion);