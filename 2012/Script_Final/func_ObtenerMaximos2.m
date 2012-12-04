function [ MatMaximos ] = func_ObtenerMaximos2(MatCorrelacion )
%Aca filtro con el umbral que yo asigno, para obtener las áreas máximas, el
%tercer argumento es para que filtre por arriba de ese umbral(1)

ImgFiltrada = func_filtrarImagenUmbral(MatCorrelacion, 255,1);

ImgFiltradaInvertida= func_InvertirImagen(ImgFiltrada,0,255);

%etiqueto y obtengo 4 áreas
[Cant_Objetos, ImgEtiquetada]  = func_Etiquetar(ImgFiltradaInvertida);
o=Cant_Objetos;


%Obtengo las 4 imágenes de los puntos individuales con
%func_filtradoEspecial, y calculo su centro de masa
ImgFiltrada1= func_filtradoEspecial(ImgEtiquetada,1);
Vector1= func_ObtenerCentrodeMasa(ImgFiltrada1);

ImgFiltrada2= func_filtradoEspecial(ImgEtiquetada,2);

Vector2= func_ObtenerCentrodeMasa(ImgFiltrada2);
ImgFiltrada3= func_filtradoEspecial(ImgEtiquetada,3);

Vector3= func_ObtenerCentrodeMasa(ImgFiltrada3);
ImgFiltrada4= func_filtradoEspecial(ImgEtiquetada,4);
Vector4= func_ObtenerCentrodeMasa(ImgFiltrada4);
%Lo asigno a la matrizMaximos
MatMaximos(1,1)=Vector1(1,1);
MatMaximos(1,2)=Vector1(1,2);
MatMaximos(2,1)=Vector2(1,1);
MatMaximos(2,2)=Vector2(1,2);
MatMaximos(3,1)=Vector3(1,1);
MatMaximos(3,2)=Vector3(1,2);
MatMaximos(4,1)=Vector4(1,1);
MatMaximos(4,2)=Vector4(1,2);

end

