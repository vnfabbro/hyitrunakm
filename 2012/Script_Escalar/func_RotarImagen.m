function [ mat_rotada ] = func_RotarImagen(img_original,coeficiente)
    angle=0;
    [img_filas  img_columnas] = size(img_original);

    angulo=angle*2*pi/360;

    coeficiente_inv = coeficiente^(-1);

    mat_rotada=zeros(size(img_original));

  for fil= 1 : img_filas 
  for col= 1 : img_columnas

                prodMat = round(coeficiente_inv*[fil;col]);
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

