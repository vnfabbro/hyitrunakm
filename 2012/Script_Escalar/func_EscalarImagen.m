function [ img_escalada] = func_EscalarImagen(img_original,coeficiente)
    angle=0;
    [img_filas  img_columnas] = size(img_original);
    

    angulo=angle*2*pi/360;

    coeficiente_inv = coeficiente^(-1);

    ext0=[0;0];
    ext1=coeficiente*[0;img_columnas-1];
    ext2=coeficiente*[img_filas-1;0];
    ext3=coeficiente*[img_filas-1;img_columnas-1];

    max_filas=floor(max([ext0(1) ext1(1) ext2(1) ext3(1)]));
    max_columnas=round(max([ext0(2) ext1(2) ext2(2) ext3(2)]));
    min_filas=round(min([ext0(1) ext1(1) ext2(1) ext3(1)]));
    min_columnas=round(min([ext0(2) ext1(2) ext2(2) ext3(2)])); 

    img_escalada=zeros(length(min_filas:max_filas),length(min_columnas:max_columnas));


  for fil= 1 : (length(min_filas:max_filas)) 
  for col= 1 : (length(min_columnas:max_columnas))

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
                    img_escalada(fil,col)= 255;
                 else
                    img_escalada(fil, col) = img_original(x+1,y+1) ;
                 end 
            end
  end

  
end

