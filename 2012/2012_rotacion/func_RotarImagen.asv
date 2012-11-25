function [ mat_rotada ] = func_RotarImagen(img_original,angle)
    [img_filas  img_columnas] = size(img_original);

    angulo=angle*2*pi/360;
    angulo

    %obtengo la matriz de rotación y la matriz inversa
    mat_rot = [cos(angulo) -sin(angulo); 
               sin(angulo) cos(angulo)];
    mat_rot_inv = mat_rot^(-1);
    %saco los extremos de la nueva imagen
    ext0=[0;0];
    ext1=mat_rot*[0;img_columnas-1];
    ext2=mat_rot*[img_filas-1;0];
    ext3=mat_rot*[img_filas-1;img_columnas-1];

    max_filas=floor(max([ext0(1) ext1(1) ext2(1) ext3(1)]));
    max_columnas=round(max([ext0(2) ext1(2) ext2(2) ext3(2)]));
    min_filas=round(min([ext0(1) ext1(1) ext2(1) ext3(1)]));
    min_columnas=round(min([ext0(2) ext1(2) ext2(2) ext3(2)])); 


    mat_rotada = zeros(img_columnas, img_filas);

    mov_filas=(min_filas);
    mov_columnas=(min_columnas);

        for col= 1 : (length(min_filas:max_filas)+1) 
            for fil= 1 : (length(min_columnas:max_columnas)+1)
                prodMat = round(mat_rot_inv*[fil-1+mov_filas;col+mov_columnas-1]);
                x= prodMat(1,1);
                if((x<0||x>(img_filas-1)))
                    x=-1;
                end
                y= prodMat(2,1);
                 if((y<0||y>(img_columnas-1)))
                    y=-1;
                 end
                 if (x<0||y<0)
                    mat_rotada(fil,col)= 255;
                 else
                    mat_rotada(fil, col) = img_original(x+1,y+1) ;
                 end 
            end
     end

end

