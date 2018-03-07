clear;
clc;
close all;
 
 faceDetector = vision.CascadeObjectDetector;
 
 New = imread('nik.jpg');
Im_original=New;
HSV = rgb2hsv(New);
 bboxes = step(faceDetector, New);
   n = length(bboxes(:,1));
 
  IFaces = insertObjectAnnotation(New, 'rectangle', bboxes, ['Face',num2str(n)]);
  figure (11), imshow(IFaces);
   title(['Detected faces_:',num2str(n)]);
 
    
  H = HSV(:,:,1); 
  S = HSV(:,:,2);
  V = HSV(:,:,3);
   
   for i=1:n
     
    h= bboxes(i,1);
    p = bboxes(i,4);
    z= h:(h+p);
    h1 = bboxes(i,2);
    p1 = bboxes(i,4);
    z1 = h1:(h1+p1);
   k =  HSV(h1:(h1+p1),h:(h+p),:); 
      figure (1), imshow(k)
  Hk = k(:,:,1);
  Sk = k(:,:,2);
  Vk = k(:,:,3);
  skin = find( Hk <= 0.11 & Hk >= 0 & Sk >= 0.2 & Sk <= 0.7 );
   
 % H_skin = skin(:,:,1);
  %S_skin = skin(:,:,2);
   
  M = median(Hk(skin)); % h mesi timh tou Hue 
 
  Va = var(Hk(skin));
  s = (Va).^(0.5) ;
   
   
  
  MS = median(Sk(skin));
  VaS = var(Sk(skin));
  s1 = (VaS).^(0.5);
   
  MV = median(Vk(skin));
  Vav = var(Vk(skin));
  s3 = (Vav).^(0.5);
  
 
   end 
    
 ark = 3;  
 
Down = M - ark*(s); 
Up = M +  ark* (s) ;
DownS = MS - ark*s1;
UpS = MS + ark* s1; 
 
DownV = MV - ark*(s3);
UpV = MV + ark*(s3);
 
 
 
 
 
%img_skin = find(H >Down & H<Up & S > DownS & S< UpS & V >DownV & V < UpV );
%non_skin = find(H < Down | H>Up | S < DownS | S> UpS | V< DownV | V> UpV );
 
img_skin = find(H >Down & H<Up & S > DownS & S< UpS );
non_skin = find(H < Down | H>Up | S < DownS | S> UpS );
 
%{
H(non_skin) = 0;
S(non_skin) = 0;
V(non_skin) = 0;
 
last = cat(3,H,S,V);
 
figure (1000), imshow(hsv2rgb(last))
 
%}
%
 
S(skin) = 1.1*S(skin);
 
nikolas = S(non_skin);
%nast = histogram(S);
 
LOW = find(nikolas < 0);
Petrou = nikolas(LOW);
nikolas(LOW) = 0.23;
 
 
High = find( nikolas > 0.57);
nikolas(High) = 1;
 
 
Up1 = find(nikolas >= 0 & nikolas <= 0.57);
 
nikolas(Up1) = ((3)^(1/2) )* nikolas(Up1);
 
AN =nikolas(Up1);
anast = find( AN >1);
AN(anast) =1;
 
nikolas(Up1) = AN;
 
S(non_skin) = nikolas;
 
 
nikos = V(skin);
 

V = adapthisteq(V,'NumTiles',[8 8],'ClipLimit',0.004);
 
 
 
V(skin) = nikos;
 
 
img = cat(3,H,S,V);
kra = hsv2rgb(img);
[sf_Original,Im_original] = find_ent(Im_original);
[sf,final_image] = find_ent(kra);
sf_Original,sf
figure (231), imshow(final_image)

