%**************************************************************************
% 
%   GIAR
%   Grupo de Inteligencia Artificial y Robotica
%   A�o: 14-10-2010
%   Autor: Veronica Fabbro, Federico Quintas.
%
%   Descripcion:Dada una imagen y un �ngulo, se rotan.
%   
%**************************************************************************

close all;
clear all;
fclose all;
clc;

%cargo las im�genes
FileName = 'Imagen_Simple.jpg';
PathFile = '.\Imagenes';
FullFileName = fullfile(PathFile,FileName);
CargarIm_Matriz = imread(FullFileName);
kernel =not(CargarIm_Matriz( : , : ,1));

FileName = 'Imagen_Completa.jpg';
PathFile = '.\Imagenes';
FullFileName = fullfile(PathFile,FileName);
CargarIm_Matriz = imread(FullFileName);
img_original =CargarIm_Matriz( : , : ,1);


imshow(img_original);

angle = 20;

mat_rotada = func_RotarImagen(img_original,angle);

 figure;
  
 imshow(uint8(mat_rotada));