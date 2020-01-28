function [reflectance] = ELM(im2,imW2,imD2)
%Summary of function goes here
%This function calculates the reflectance of a hypercube using Empirical
%Line method
%   Detailed explanation goes here
%im2= 'Hyper cube of scene radiance'
%imW2='White tile radiance'
%imD2='Dark frames radiance'
[sx,sy,sz]=size(im2);

Dmean=mean(squeeze(mean(imD2)));

Wmean=squeeze(mean(imW2));

reflectance=zeros(sx,sy,sz);
for i=1:sx
    for j=1:sz
    Stemp=(squeeze(im2(i,:,:)));

    reflectance(i,:,j)=(((Stemp(:,j)-Dmean(j)))./(Wmean(:,j)-Dmean(j)));
    end
end
end

