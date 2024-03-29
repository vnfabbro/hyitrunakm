clc;
close all;
clear all;
fclose all;

%cargo las im�genes
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

FileName = 'ImgRotada.jpg';
PathFile = '.\Imagenes';
FullFileName = fullfile(PathFile,FileName);
CargarIm_Matriz = imread(FullFileName);

Img1 =(CargarIm_Matriz( : , : ,1));
[imgF , imgC] = size(Img1);

for i= 1: imgC
    for j= 1: imgF
        
        if Img1(j,i)>128 
            Img1(j,i)=0;
        else
            Img1(j,i) =255;
        end
    end
end
figure;
imshow(Img1);
Img=Img1;
[kF , kC] = size(kernel);
MatCorrelacion = zeros(size(Img));

%Agrando la imagen para que entre el kernel
Img_adaptada1 = [zeros(kF - 1 , imgC); Img];
Img_adaptada2 = [Img_adaptada1; zeros(kF - 1 , imgC)];
Img_adaptada3 = [Img_adaptada2 zeros((imgF + 2*kF - 2), kC-1)] ;
Img_Final = [zeros(imgF + 2*kF - 2, kC-1) Img_adaptada3];

[imgFinalF , imgFinalC] = size(Img_Final);

vectorMax=zeros(4,2);


%Obtengo la Matriz Correlacion, que va a ser el kernel multiplicado punto a
%punto por la imagen original
for i= 1:(imgFinalC-kC)
   for j=1:(imgFinalF-kF)
      SubMat = Img_Final( j:(j-1)+kF , i:(i-1)+kC );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      Correlacion = sum(sum(SubMat.*kernel));
      
      MatCorrelacion(j ,i ) = Correlacion ;

   end
    
end

figure;
imshow(uint8(MatCorrelacion/max(max(abs(MatCorrelacion)))*255));


%Con esta funcion saco los 4 puntos maximos. MatMaximos es una matriz de
%4x2 que contiene las coordenadas de los puntos de Anclaje de
%MatCorrelaci�n

MatMaximos = func_ObtenerMaximos(MatCorrelacion,4);

%Obtengo la fila y la columna de lo que ser�a un punto que agrego. Este
%punto tiene la misma fila que el punto v�rtice ya calculado, y la misma
%columna que el punto inferior derecho de la imagen original. As� se forma
%un tri�ngulo rect�ngulo, con el cual se pueden calcular el opuesto y el
%adyacente, para sacar el �ngulo con el arcotangente.
F5 = MatMaximos(2,1);
C5=MatMaximos(4,2);


opuesto=abs( MatMaximos(4,1)- F5) ;
adyacente= abs(C5 - MatMaximos(2,2));

x= opuesto/adyacente;
RadianAngle= atan(x);

angulo=-RadianAngle*0/pi; %pongo el - para que gire para el otro lado

img_rotada = func_EscalarImagen(Img,2);

figure;
imshow(uint8(img_rotada));

