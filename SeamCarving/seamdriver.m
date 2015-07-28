%% seamdriver.m
%
% 9/23/13 Dan Calderon, ELEC 547 Homework 2
%
% This is a simple driver that loads the target image, performs seam
% carving according to user-defined parameters, and outputs the resulting
% image.
%
% usage: Run, and the output will be the seam carving of the input image Y.
%                                    
%
function seamdriver


%% blur gauss
sigma = sqrt(2);                  % USER SET: Specify blur kernel sigma value; Default is sqrt(2);
[gau dgau2D] = blurgauss(sigma);

%% Seam Carving Settings Per Testcase
%% Christmas
nsum = 200;                       % USER SET: set this to decide how many seams to add/remove
ar = 0;                           % USER SET Logical: if 1, adds columns. If 0, removes columns.
C = imread('christmas_original.png','png');         %USER SET: Decide what Image to Load

OutChrist = seamcarver(C,gau,dgau2D,nsum,ar);
OutChrist = uint8(OutChrist);
imwrite(OutChrist, 'christmasnew','png');
imagesc(uint8(OutChrist));

save outchristmas.mat
% 
%% Waterfall
nsum = 350;                       
ar = 0;                           
C = imread('waterfall.png','png');

OutWater = seamcarver(C,gau,dgau2D,nsum,ar);
OutWater = uint8(OutWater);
imwrite(OutWater, 'waterfallnew','png');
figure()
imagesc(uint8(OutWater));

save outWater.mat

%% Fuji Add Columns
nsum = 243;
ar = 1;
C = imread('Fuji','png');

OutFuji = seamcarver(C,gau,dgau2D,nsum,ar);
OutFuji = uint8(OutFuji);
imwrite(OutFuji, 'Fujinew','png');
figure()
imagesc(uint8(OutFuji));

save outFuji.mat

%% User 1: St Petersburg Rooftop (add columns)
nsum = 132;
ar = 1;
C = imread('st-petersburg-roof-jump.jpg');

OutPeter=seamcarver(C,gau,dgau2D,nsum,ar);
OutPeter = uint8(OutPeter);
imwrite(OutPeter, 'Petersburgnew','png');
figure()
imagesc(uint8(OutPeter));

save outPeter.mat

User 2: Yezhov and Stalin (remove columns); desired future case: object removal?
clear C;
nsum = 250;
ar = 0;
R = imread('Yezhov.jpg','jpeg');
size(R)
for k = 1:3
    C(:,:,k) = R;
end
OutYezhov = seamcarver(C,gau,dgau2D,nsum,ar);
OutYezhov = uint8(OutYezhov);
 imwrite(OutYezhov, 'yezhovnew','png');
figure()
imagesc(uint8(OutYezhov));

save outYezhov.mat


end


