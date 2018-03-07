clear;
clc;
close all;

I = imread('nik.jpg');
P = rgb2hsv(I);

A= P(:,:,2);
B= P(:,:,1);
V = P(:,:,3);

V = adapthisteq(V,'NumTiles',[8 8],'ClipLimit',0.01);

J = cat(3,B,A,V);

imshow(hsv2rgb(J))