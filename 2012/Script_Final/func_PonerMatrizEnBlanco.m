function [Imagen] = func_PonerMatrizEnBlanco(cant_fil,cant_col,Imagen)
for col = 1: (cant_col)
    for fil =1: (cant_fil) 
       Imagen(fil,col)= 255;
    end
end
end 