function [ vectorMax ] = func_obtenerPuntosAnclaje( Img, kernel )

    [imgF , imgC] = size(Img);
    [kF , kC] = size(kernel);
    MatCorrelacion = zeros(size(Img));

    %NumVer = floor(imgF/kF);
    %NumHor = floor(imgC/kC);

    %LimVer = NumVer*kF ;
    %LimHor = NumHor*kC ;
    %LimVer = imgF - kF ;
    %LimHor = imgC - kC ;


    Img_adaptada1 = [zeros(kF - 1 , imgC); Img];
    Img_adaptada2 = [Img_adaptada1; zeros(kF - 1 , imgC)];
    Img_adaptada3 = [Img_adaptada2 zeros((imgF + 2*kF - 2), kC-1)] ;
    Img_Final = [zeros(imgF + 2*kF - 2, kC-1) Img_adaptada3];

    [imgFinalF , imgFinalC] = size(Img_Final);


    vectorMax=zeros(1,4);
    
    tic
    for i= kC:(imgFinalC-kC)
        for j=kF:(imgFinalF-kF)
             SubMat = Img_Final( j:(j-1)+kF , i:(i-1)+kC );
             Correlacion = sum(sum(SubMat.*kernel)) ;
             MatCorrelacion(i,j) = Correlacion ;    
            %disp(('%d %d',i,j));
            % MatCorrelacion(i,j) = sum(sum(Img_Final( j:(j-1)+kF , i:(i-1)+kC ).*kernel)) ;    
        end
    end
    toc

    i=0;
    f=1;
    for i= kC:(imgFinalC-kC) %Con estos for busco qué pixeles tienen el mayor y los guardo. El objetivo del script es que devuelva las coordenadas
        % de los puntos máximos para saber si están alineados.
        for j=kF:(imgFinalF-kF)
           if MatCorrelacion(i,j) == max(max(MatCorrelacion))
            vectorMax(1,f) = MatCorrelacion(i,j);
            f=f+1;
           end
        end
    end
    %MatCorrelacion = MatCorrelacion / max(max(MatCorrelacion)); %%Por qué hace ésto?

end

