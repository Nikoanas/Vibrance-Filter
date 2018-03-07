
function [ A,H,V,D ] = klados( image,k,N,sigma,wavetype )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 
im1=un_sharp_mask(image,k,sigma);
[C,S]=wavedec2(im1,N,wavetype);
A=appcoef2(C,S,wavetype,N);
[H,V,D]=detcoef2('all',C,S,N);
 
end