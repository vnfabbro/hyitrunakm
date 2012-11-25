clc;
close all;
clear all;
fclose all;

%Cargo las Imagenes
kernel= func_CargarImagen('kernel.jpg','.\Imagenes');

Img=func_CargarImagen('ImgCompleta.jpg','.\Imagenes');
MaxOrig = func_ObtenerMaximos2(Img)
DistanciaOriginal=norm([(MaxOrig(4,1)-MaxOrig(3,1)) (MaxOrig(4,2)-MaxOrig(3,2))])

figure;
imshow(Img);

%escalo y roto con funcion de matlab
ImgE= imresize(Img,2);
size(ImgE)
ImgR = imrotate(ImgE,45);

figure;
imshow(ImgR);

MatCorrelacion= func_Correlacionar(kernel,ImgR);
figure;
imshow(MatCorrelacion);

MatMaximos= func_ObtenerMaximos2(MatCorrelacion)


angulo= func_ObtenerAngulo(MatMaximos);

mat_rotada = func_RotarImagen(ImgR,angulo );

MatMaximos2= func_ObtenerMaximos2(mat_rotada)
%saco la distancia de la esquina de arriba a la derecha y de abajo a la
%derecha
DistanciaFinal=norm([(MatMaximos2(4,1)-MatMaximos2(3,1)) (MatMaximos2(4,2)-MatMaximos2(3,2))])

figure;
imshow(mat_rotada);

%saco la proporcion y la escalo usando esa proporcion
prop = DistanciaFinal/DistanciaOriginal

ImgFinal= func_EscalarImagen(mat_rotada,1/prop);
figure;
imshow(ImgFinal);



