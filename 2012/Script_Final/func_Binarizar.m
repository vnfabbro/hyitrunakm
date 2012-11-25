function [Matriz_Binarizada] = func_Binarizar(cant_fil,cant_col,Imagen_Original)

for x=1 :cant_fil
    for y=1: cant_col
        if  Imagen_Original(x,y)<200 
            Imagen_Original(x,y)=0;
        else 
            Imagen_Original(x,y)=255;
        end
    end
end
Matriz_Binarizada = Imagen_Original;
end 