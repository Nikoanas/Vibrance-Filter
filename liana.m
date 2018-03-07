clc; clear all; close all;
 
x=imread('final_image.jpg');
 Im_original = x;
figure (1), imshow(x)
R=x(:,:,1);
G=x(:,:,2);
B=x(:,:,3);
k=1;sigma=2;K_contrast=5;showplots=2;wavetype='db4';
% 
[R2,SF_xR,SF_fiR,contrast_xR,contrast_fiR]=gray1(R,wavetype,sigma,k,K_contrast,showplots);
[G2,SF_xG,SF_fiG,contrast_xG,contrast_fiG]=gray1(G,wavetype,sigma,k,K_contrast,showplots);
[B2,SF_xB,SF_fiB,contrast_xB,contrast_fiB]=gray1(B,wavetype,sigma,k,K_contrast,showplots);
% 
 

R2=uint8(R2);G2=uint8(G2);B2=uint8(B2);
Final_Image=cat(3,R2,G2,B2);
imwrite(Final_Image,'Sharpening.jpg');
figure (2)
imshow(Final_Image,[])
[sf_Original,Im_original] = find_ent(Im_original);
[sf,final_image] = find_ent(Final_Image);
sf_Original,sf

%{
imwrite(Final_Image,'Final_Image.tif','Resolution',300)
Final_Image=255*double(Final_Image);
 
SF1=spatial_frequency(x);
disp([' SF initial image = ',num2str(SF1)])
SF2=spatial_frequency(Final_Image);
disp([' SF final image = ',num2str(SF2)])
 
contrast_x=contrast_coef(x,K_contrast);
contrast_fi=contrast_coef(Final_Image,K_contrast);
disp([' Contrast of the initial image =' num2str(contrast_x)])
disp([' Contrast of the final image =' num2str(contrast_fi)])
 
E=Matrix_Entropy(x     );
disp([' Entropy initial image = ',num2str(E)])
E=Matrix_Entropy(Final_Image);
disp([' Entropy final image = ',num2str(E)])
 
R=Final_Image(:,:,1);
G=Final_Image(:,:,2);
B=Final_Image(:,:,3);
entropia=(entropy(R)+entropy(G)+entropy(B))/3;
entropia
entropy(Final_Image)
%}
