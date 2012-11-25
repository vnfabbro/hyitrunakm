function [ Vector ] = func_ObtenerCentrodeMasa( Imagen )
[Filas,Columnas] = size(Imagen);
M=0;
SumFil=0;
SumCol=0;

for fil=1:Filas
    for col=1:Columnas
        if Imagen(fil,col) == 255
            SumFil=SumFil+fil;
            SumCol=SumCol+col;
            M=M+1;
    end
    end
    
Vector(1,1)=round(SumFil/M);
Vector(1,2)=round(SumCol/M);

end

