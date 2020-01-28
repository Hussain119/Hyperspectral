function [] = BandimShow(im2)
%SHOWBAND Summary of this function goes here
This file is a part of the Advanced Image Processing Research Lab (KFUEIT) Toolbox for MATLAB
 
% Press n for next band grey-scale Image
% Press p for previous band grey-scale Image
% Press b for to end


i=1;
while 1
    figure(2)
   imshow(im2(:,:,i),[]);
   title(i)
 w = waitforbuttonpress;
 ch=get(gcf,'CurrentCharacter');
 disp('you entered');ch
 i
 if ch=='n'
     i=i+1;
     imshow(im2(:,:,i),[]);
 elseif ch=='p'
     if i>=2
         i=i-1;
         imshow(im2(:,:,i),[]);
         title(i)
     else
         disp('Error Index')
     end
 elseif ch=='b'
     break
 end
end
end

