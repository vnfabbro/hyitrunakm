clc;
close all;
clear all;
fclose all;

%Cargo las Imagenes
kernel= func_CargarImagen('kernel.jpg','.\Imagenes');

Img=func_CargarImagen('ImgCompleta.jpg','.\Imagenes');

figure;
imshow(Img);

%escalo y roto con funcion de matlab
ImgE= imresize(Img,2);
size(ImgE)
ImgR = imrotate(ImgE,45);

size(ImgR)
figure;
imshow(ImgR);

MatCorrelacion= func_Correlacionar(kernel,ImgR);
figure;
imshow(MatCorrelacion);

MatMaximos= func_ObtenerMaximos2(MatCorrelacion)


a=norm([(163-122) (96-55)])

angulo= func_ObtenerAngulo(MatMaximos);

mat_rotada = func_RotarImagen(ImgR,angulo );

MatMaximos2= func_ObtenerMaximos2(mat_rotada)
b=norm([(112-170) (192-190)])

figure;
imshow(mat_rotada);
prop = b/a



