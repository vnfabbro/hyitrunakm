function [ ImagenInvertida ] = func_InvertirImagen(Imagen,ColorBase,ColorFinal )
[Fil,Col]= size(Imagen);
ImagenInvertida=zeros(size(Imagen));

for fil=1:Fil
    for col=1:Col
        if Imagen(fil,col)==ColorBase
            ImagenInvertida(fil,col)=ColorFinal;
        else
            ImagenInveritda(fil,col)=ColorBase;
        end
    end
end

end

