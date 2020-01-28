function  x5reflectance(~,~)
%This file is a part of the Advanced Image Processing Research Lab (KFUEIT) Toolbox for MATLAB
%Summary:
%The code will diplay the reflectance spectra of indvidual pixel on which user will click using mouse button.
 
% To run;Place following code in your main code:
% y=6;
%  global reflectance;
% [sx,sy,sz]=size(Data(y).im2);
%  reflectance=zeros(sx,sy,sz);
%  reflectance=Data(y).reflectance;
% figure(1);
%   set(gcf,'WindowButtonDownFcn',@x5reflectance),imshow(Data(y).FalseIm,[])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Press n to display new pixel spectra
% Press g to hold this spectra and place a next one over it (for comparison)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wavelength = [397.66,400.28,402.90,405.52,408.13,410.75,413.37,416.00,418.62,421.24,423.86,426.49,429.12,431.74,434.37,437.00,439.63,442.26,444.89,447.52,450.16,452.79,455.43,458.06,460.70,463.34,465.98,468.62,471.26,473.90,476.54,479.18,481.83,484.47,487.12,489.77,492.42,495.07,497.72,500.37,503.02,505.67,508.32,510.98,513.63,516.29,518.95,521.61,524.27,526.93,529.59,532.25,534.91,537.57,540.24,542.91,545.57,548.24,550.91,553.58,556.25,558.92,561.59,564.26,566.94,569.61,572.29,574.96,577.64,580.32,583.00,585.68,588.36,591.04,593.73,596.41,599.10,601.78,604.47,607.16,609.85,612.53,615.23,617.92,620.61,623.30,626.00,628.69,631.39,634.08,636.78,639.48,642.18,644.88,647.58,650.29,652.99,655.69,658.40,661.10,663.81,666.52,669.23,671.94,674.65,677.36,680.07,682.79,685.50,688.22,690.93,693.65,696.37,699.09,701.81,704.53,707.25,709.97,712.70,715.42,718.15,720.87,723.60,726.33,729.06,731.79,734.52,737.25,739.98,742.72,745.45,748.19,750.93,753.66,756.40,759.14,761.88,764.62,767.36,770.11,772.85,775.60,778.34,781.09,783.84,786.58,789.33,792.08,794.84,797.59,800.34,803.10,805.85,808.61,811.36,814.12,816.88,819.64,822.40,825.16,827.92,830.69,833.45,836.22,838.98,841.75,844.52,847.29,850.06,852.83,855.60,858.37,861.14,863.92,866.69,869.47,872.25,875.03,877.80,880.58,883.37,886.15,888.93,891.71,894.50,897.28,900.07,902.86,905.64,908.43,911.22,914.02,916.81,919.60,922.39,925.19,927.98,930.78,933.58,936.38,939.18,941.98,944.78,947.58,950.38,953.19,955.99,958.80,961.60,964.41,967.22,970.03,972.84,975.65,978.46,981.27,984.09,986.90,989.72,992.54,995.35,998.17,1000.99,1003.81];

global mousePos;
mousePos=get(gca,'CurrentPoint');
    disp(['You clicked X:',num2str(mousePos(1)),',  Y:',num2str(mousePos(2))]);

  global reflectance;
  if mousePos(1)>0 && mousePos(2)>0
  x=ceil(mousePos(1));
  y=ceil(mousePos(2));


  meanReflectanceROI1=zeros(1,224);

  meanReflectanceROI1=squeeze(reflectance(x,y,:))';
 w = waitforbuttonpress;
 ch=get(gcf,'CurrentCharacter');
 disp('you entered');ch
 if ch=='g'
figure(2); 
plot(wavelength,meanReflectanceROI1)
hold on
 
 hold on
 elseif ch=='n'
     
figure,plot(wavelength,meanReflectanceROI1)



 
      
 end
 
 
 
 
  end
  
 

end

