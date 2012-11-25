function [ VectorMaximos ] = func_ObtenerAnclajes(Img1)

%clc;
%close all;
%clear all;
%fclose all;

%cargo las imágenes
FileName = 'ImgSimple.jpg';
PathFile = '.\Imagenes';
FullFileName = fullfile(PathFile,FileName);
CargarIm_Matriz = imread(FullFileName);
kernel =(CargarIm_Matriz( : , : ,1));
[imgKF , imgKC] = size(kernel);

for i= 1: imgKC
    for j= 1: imgKF
        
        if kernel(j,i)>128 
            kernel(j,i)=0;
        else
            kernel(j,i) =255;
        end
    end
end
%FileName = 'ImgCompleta.jpg';
%PathFile = '.\Imagenes';
%FullFileName = fullfile(PathFile,FileName);
%CargarIm_Matriz = imread(FullFileName);
%imshow(CargarIm_Matriz)

%Img1 =(CargarIm_Matriz( : , : ,1));
%[imgF , imgC] = size(Img);

%for i= 1: imgC
%    for j= 1: imgF
        
%        if Img1(j,i)>128 
%            Img1(j,i)=0;
%        else
%            Img1(j,i) =255;
%        end
%    end
%end

Img2=Img1;
%[kF , kC] = size(kernel);
%MatCorrelacion = zeros(size(Img));

%Agrando la imagen para que entre el kernel
%Img_adaptada1 = [zeros(kF - 1 , imgC); Img];
%Img_adaptada2 = [Img_adaptada1; zeros(kF - 1 , imgC)];
%Img_adaptada3 = [Img_adaptada2 zeros((imgF + 2*kF - 2), kC-1)] ;
%Img_Final = [zeros(imgF + 2*kF - 2, kC-1) Img_adaptada3];

%[imgFinalF , imgFinalC] = size(Img_Final);



%Obtengo la Matriz Correlacion, que va a ser el kernel multiplicado punto a
%punto por la imagen original
%for i= 1:(imgFinalC-kC)
%   for j=1:(imgFinalF-kF)
%      SubMat = Img_Final( j:(j-1)+kF , i:(i-1)+kC );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
%      Correlacion = sum(sum(SubMat.*kernel));
%      MatCorrelacion(i,j) = Correlacion ;
%    end
%end

%f=1;
%c=1;

%figure;
%imshow(uint8(MatCorrelacion/max(max(abs(MatCorrelacion)))*255));
%imshow(uint8(Img/max(max(abs(Img)))*255));

[f_k c_k b_k]=size(kernel);

extra=1; 
tamanio=round(f_k/2) + extra ;%Aca tapo con el tamaño de kernel, le sumo un extra para que
%termine de tapar todo el circulo (se arraiga error cuando hago la
%correlacion)
VectorMaximos = zeros(4,2);
for i=1:4
    [f c V]=func_max_imag(Img2);%esta funcion me da fila,columna del maximo y su valor
    VectorMaximos(i,1 )=f;
    VectorMaximos(i,2 )=c;
    Img2((f-tamanio):(f+tamanio),(c-tamanio):(c+tamanio))=0;%tapo en 0 el area
 %   figure;
%    imshow(uint8(Img/max(max(abs(Img)))*255));
end
