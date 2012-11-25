function [MatCorrelacion] = func_Correlacionar(kernel,Img)
[imgF , imgC] = size(Img);
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

MatCorrelacion=MatCorrelacion/max(max(abs(MatCorrelacion)))*255;

end

