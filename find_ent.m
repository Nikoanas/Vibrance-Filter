function [ent,final_image] = find_ent(kra)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
R=kra(:,:,1);G=kra(:,:,2);B=kra(:,:,3);
R=make_image(double(R));G=make_image(double(G));B=make_image(double(B));
final_image=cat(3,R,G,B);
ent = entropy(final_image);

end