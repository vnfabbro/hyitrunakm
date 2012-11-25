clc;
close all;
clear all;
fclose all;


kernel= func_CargarImagen('ImgSimple2.jpg','.\Imagenes');

Img=func_CargarImagen('ImgRotada.jpg','.\Imagenes');
figure;
imshow(Img);

MatCorrelacion= func_Correlacionar(kernel,Img);

MatMaximos= func_ObtenerMaximos2(MatCorrelacion);

angulo= func_ObtenerAngulo(MatMaximos);
mat_rotada = func_RotarImagen(Img,angulo );

figure;
imshow(uint8(mat_rotada));
