%**************************************************************************
% FINAL
%   GIAR
%   Grupo de Inteligencia Artificial y Robotica
%   Fecha: 18/10/2011 
%   Ultima Edición: 20/12/2011
%   Autor: Verónica Fabbro, Federico Quintas
%
%   Descripcion: Dada una imagen con X objetos dentro, se busca
%   obtener X imagenes separadas del mismo tamaño que la original, y luego
%   obtener X imagenes del tamaño del objeto.
%
%**************************************************************************
function [ NumLabels, Matriz_EtiquetasPosta ] = func_Etiquetar(Imagen_Original )

% Imagen_Original =255-uint8(Imagen_Original);
[cant_fil cant_col] = size(Imagen_Original);

%Editar Imagenes (binarizo)
Imagen_Original= func_Binarizar(cant_fil,cant_col,Imagen_Original);



%primero la inicializo con ceros, y luego pongo todos los pixeles en Blanco
Matriz_Etiquetas = zeros(cant_fil,cant_col);

Matriz_Etiquetas= func_PonerMatrizEnBlanco(cant_fil,cant_col,Matriz_Etiquetas);
Numero_Etiqueta = 1; 

for col=2:(cant_col - 1)
    for fil=2:(cant_fil-1)
        %si en la Matriz de la imagen original, el pixel en el que estoy es
        %negro, entonces analiza
        if Imagen_Original(fil,col) ==0
            %Crea vector de 4 posiciones e inicializo en 0
            for pos=1:4
                Vec_Vecinos(pos)=0;
            end
            
             %Guardo los 4 vecinos que ya recorri en el vector
             Vec_Vecinos(1)= Matriz_Etiquetas(fil-1,col);
             Vec_Vecinos(2)= Matriz_Etiquetas(fil-1,col-1);
             Vec_Vecinos(3)= Matriz_Etiquetas(fil,col-1);
             Vec_Vecinos(4)= Matriz_Etiquetas(fil+1,col-1);
             
             if (Vec_Vecinos(1)~= 255)% si no es blanco, asigno ese valor a la etiqueta menor
                 Etiqueta_Menor= Vec_Vecinos(1);
             else
                 Etiqueta_Menor =1500; %si es blanco, entonces le pongo un valor 1500 para que no moleste cuando calculo el menor
             end
             
             for pos=1:4 
                 %si el valor que tengo de etiqueta es mayor que otro del
                 %vector, mientras que no sea blanco, asigno ese valor a la
                 %etiqueta menor
                 if (Etiqueta_Menor> Vec_Vecinos(pos)) && (Vec_Vecinos(pos)~= 255)
                     Etiqueta_Menor = Vec_Vecinos(pos);
                 end
             end
             
             if Etiqueta_Menor ~=1500 
                Matriz_Etiquetas(fil,col) = Etiqueta_Menor;
             else %si el valor quedo en 1500 es porque todos sus vecinos son blancos, entonces tengo que asignar una nueva etiqueta 
                 Matriz_Etiquetas(fil,col)= Numero_Etiqueta;
                 Numero_Etiqueta = Numero_Etiqueta + 1;
                 
                 
                 %Comento las siguientes 3 líneas porque podrían borrarse
                 %if Numero_Etiqueta == 255 %si el numero de etiqueta aumento tanto hasta 255 no tiene que tomar ese valor porque es el del color blanco
                 %    Numero_Etiqueta = Numero_Etiqueta + 1;
                 %end
                 
             end
        end
    end
    end
%Cargo un vector del largo de la cantidad de etiquetas, y en cada posición
%"i" cargo el número "i".
pos_Vec= 1;
for i= 1:Numero_Etiqueta
    Vec_Etiquetas(i)=i;
end

%Hago una pasada, trabajando con el vector de etiquetas 

for col=2: (cant_col-1)
    for fil =2: (cant_fil-1)
        if Imagen_Original(fil,col)==0
               %se guardan todos los vecinos
               Matriz_Vecinos(1,1) = Matriz_Etiquetas(fil-1,col-1);
               Matriz_Vecinos(1,2)= Matriz_Etiquetas(fil-1,col);
               Matriz_Vecinos(1,3) = Matriz_Etiquetas(fil-1,col+1);
               Matriz_Vecinos(2,1) = Matriz_Etiquetas(fil,col-1);
               Matriz_Vecinos(2,2)= Matriz_Etiquetas(fil,col);
               Matriz_Vecinos(2,3)= Matriz_Etiquetas(fil,col+1);
               Matriz_Vecinos(3,1) = Matriz_Etiquetas(fil+1,col-1);
               Matriz_Vecinos(3,2) = Matriz_Etiquetas(fil+1,col);
               Matriz_Vecinos(3,3) = Matriz_Etiquetas(fil+1,col+1);
               
               etiqueta_actual= Matriz_Vecinos(2,2);
           
        encontro= 0;
        
        %Busco la etiqueta menor
            if (Matriz_Vecinos(1,1) ~= 255) 
               Etiqueta_Menor= Matriz_Vecinos(1,1);
           else
               Etiqueta_Menor = etiqueta_actual;
           end
          
           for f=1:3
               for c=1:3
                   if (Matriz_Vecinos(f,c)~= 255)&& (Etiqueta_Menor> Matriz_Vecinos(f,c))
                       Etiqueta_Menor = Matriz_Vecinos(f,c);                    
                   end
               end
          end
       %Si encontro una etiqueta menor a la actual, voy guardar en el vector de etiquetas en la posicion actual
       %el valor del vector de la posicion de la etiqueta menor   
           if Etiqueta_Menor ~= etiqueta_actual
               encontro=1;
               etiqueta_encontrada = Etiqueta_Menor;
           end 
        
        if encontro==1 
            Vec_Etiquetas(etiqueta_actual) = Vec_Etiquetas(etiqueta_encontrada);
        end      
                   
        end
    end
end

%Modifico la imagen de etiquetas con los valores del vector

for col= 2: (cant_col-1)
    for fil= 2 : (cant_fil-1)
        
        if Imagen_Original(fil,col) ==0
            pixel = Matriz_Etiquetas(fil,col);
            Matriz_Etiquetas(fil,col) = Vec_Etiquetas(pixel);
        end
    end   
end


 
  nro_objetos = 1;
  Vec_Contador_Objetos(nro_objetos) =0;
  
  %contador de objetos
  for col= 2: (cant_col -1) 
      for fil =2:(cant_fil-1)
  
          if (Matriz_Etiquetas(fil,col) ~= 0) && (Matriz_Etiquetas(fil,col) ~= 255)
              Repetido= 0;              
              for pos= 1: nro_objetos 
                  if Matriz_Etiquetas (fil,col) ==Vec_Contador_Objetos(pos)
                      Repetido = 1;
                  end
              end              
              if Repetido ==0
                  nro_objetos= nro_objetos+1;
                  Vec_Contador_Objetos(nro_objetos)= Matriz_Etiquetas(fil,col);
              end
      
          end
  
      end
 
  end
  
 %n0= Vec_Contador_Objetos(1) 
 %n1= Vec_Contador_Objetos(2)
 %n2= Vec_Contador_Objetos(3)
 %n3= Vec_Contador_Objetos(4)
 %n4= Vec_Contador_Objetos(5)
 
 a= Numero_Etiqueta;
 b= Matriz_Etiquetas;
 c= (nro_objetos-1);
 f=2;
 
 for i=1:4
     VecEtiquetasFinal(i)=333;
 end
 b=2;
 VecEtiquetasFinal(1)= Vec_Etiquetas(1);
 for i=1:(length(Vec_Etiquetas)-1)
     for j=1:4
     if (VecEtiquetasFinal(j) == Vec_Etiquetas(i))
         a=0;
     else
         a=a+1;
     end
     end
     
     if (a==4)
         VecEtiquetasFinal(b)= Vec_Etiquetas(i);
         b=b+1;
     end
     a=0;
 end
         
 %VecEtiquetas = [1 34 38 43];
 
 Matriz_EtiquetasPosta = zeros(size(Matriz_Etiquetas));
%  
%  for i=1:length(VecEtiquetas)
%      Matriz_EtiquetasPosta(Matriz_Etiquetas == VecEtiquetas(i)) = i ; 
%  end
%  Matriz_EtiquetasPosta(Matriz_Etiquetas == 1) = 1 ; 
%  Matriz_EtiquetasPosta(Matriz_Etiquetas == 34) = 2 ; 
%  Matriz_EtiquetasPosta(Matriz_Etiquetas == 38) = 3 ; 
%  Matriz_EtiquetasPosta(Matriz_Etiquetas == 43) = 4 ; 
 
   
  Matriz_EtiquetasPosta(Matriz_Etiquetas == VecEtiquetasFinal(1)) = 1 ; 
  Matriz_EtiquetasPosta(Matriz_Etiquetas == VecEtiquetasFinal(2)) = 2 ; 
  Matriz_EtiquetasPosta(Matriz_Etiquetas == VecEtiquetasFinal(3)) = 3 ; 
  Matriz_EtiquetasPosta(Matriz_Etiquetas == VecEtiquetasFinal(4)) = 4 ; 
 
 save('LabelMatrix.mat','Matriz_EtiquetasPosta','c','Matriz_Etiquetas')
 
% figure;
%image(Matriz_Etiquetas);

NumLabels = c;


%Para mostrar las etiquetas.
%for i=1:NumLabels
%    MatrixAux = Matriz_EtiquetasPosta == i ;
%    imshow(MatrixAux);
%    title(sprintf('Etiqueta : %d ',i));
%    pause;
%end
   
 