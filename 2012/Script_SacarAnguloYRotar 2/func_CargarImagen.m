function [ imagen] = func_CargarImagen(FileName,PathFile)

FullFileName = fullfile(PathFile,FileName);
CargarIm_Matriz = imread(FullFileName);
imagen =(CargarIm_Matriz( : , : ,1));
[imgKF , imgKC] = size(imagen);

for i= 1: imgKC
    for j= 1: imgKF
        
        if imagen(j,i)>128 
            imagen(j,i)=0;
        else
            imagen(j,i) =255;
        end
    end
end

end

