function [im2,imD2,imW2,reflectance] = readHyperCube(path)
%this function can be used to read hyperspectral_data along with Dark and white reference.
%The function also calculate the reflectance of a hyper-cube according (Empirical Line Method)ELM
%pathDir= path of the capture folder of HSI data.



cd(path)
logAllFiles=dir('*.log');
rawAllFiles=dir('*.raw');
FalseImDir=dir('*.png');

for j=1:length(logAllFiles)
    logFile=logAllFiles(j).name;
    rawFile=rawAllFiles(j).name;
    
     fid=fopen(logFile);
      a='';
        while 1
            tline = fgetl(fid);
           k = strfind(tline,'frames recorded');
           if k~=0
            for i=3:k-2
                a=strcat(a,tline(i));
            end
            break;
           end
        end
        b=str2num(a);   
        
 fclose(fid);


 if j==1
  
 im2 =multibandread(rawFile,[b,512,224],'int16',0,'bil','ieee-le');
elseif j==2
  
   imD2 = multibandread(rawFile,[b,512,224],'uint16',0,'bil','ieee-le');
elseif j==3
     imW2 = multibandread(rawFile,[b,512,224],'uint16',0,'bil','ieee-le');

end

end

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
