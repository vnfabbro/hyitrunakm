function [ MatCorrelacion] = func_Correlacionar2(kernel,Img)
%esta version sólo me correlaciona en un área dada( el size del kernel)

[imgF , imgC] = size(Img);
[kF , kC] = size(kernel);
MatCorrelacion = zeros(size(Img));

%Agrando la imagen para que entre el kernel
Img_adaptada1 = [zeros(kF - 1 , imgC); Img];
Img_adaptada2 = [Img_adaptada1; zeros(kF - 1 , imgC)];
Img_adaptada3 = [Img_adaptada2 zeros((imgF + 2*kF - 2), kC-1)] ;
Img_Final = [zeros(imgF + 2*kF - 2, kC-1) Img_adaptada3];

[imgFinalF , imgFinalC] = size(Img_Final);

%Obtengo la Matriz Correlacion, que va a ser el kernel multiplicado punto a
%punto por la imagen original

for i= 1:(kC+ kC)
   for j=1:(kF+ kF)
      SubMat = Img_Final( j:(j-1)+kF , i:(i-1)+kC );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      Correlacion = sum(sum(SubMat.*kernel));
      MatCorrelacion(j ,i ) = Correlacion ;
   end
end

for i= (imgFinalC-kC-kC-kC):(imgFinalC-kC)
   for j=1:(kF+kF)
      SubMat = Img_Final( j:(j-1)+kF , i:(i-1)+kC );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      Correlacion = sum(sum(SubMat.*kernel));
      MatCorrelacion(j ,i ) = Correlacion ;
   end
end

for i= 1:(kC+kC)
   for j=(imgFinalF-kF-kF-kF):(imgFinalF-kF)
      SubMat = Img_Final( j:(j-1)+kF , i:(i-1)+kC );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      Correlacion = sum(sum(SubMat.*kernel));
      MatCorrelacion(j ,i ) = Correlacion ;
   end
end

for i= (imgFinalC-kC-kC-kC):(imgFinalC-kC)
   for j=(imgFinalF-kF-kF-kF):(imgFinalF-kF)
      SubMat = Img_Final( j:(j-1)+kF , i:(i-1)+kC );                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
      Correlacion = sum(sum(SubMat.*kernel));
      MatCorrelacion(j ,i ) = Correlacion ;
   end
end

MatCorrelacion=MatCorrelacion/max(max(abs(MatCorrelacion)))*255;

end

