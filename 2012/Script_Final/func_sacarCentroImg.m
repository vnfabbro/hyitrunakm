function [ Centro ] = func_sacarCentroImg( Img )
 [ fil,col ] = size(Img);
 a= round(fil/2);
 b= round(col/2);
 Centro = [ a b];
end

