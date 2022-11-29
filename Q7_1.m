clc;
clear;
close all;

load refim.mat;
load im2.mat;


figure,imshow(refim); title('Reference (fixed) image');
figure,imshow(im2);    title('Source (float) image');

imwrite(refim,'refim.jpg');
imwrite(im2,'im2.jpg');




















