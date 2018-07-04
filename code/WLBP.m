function [d_differential_excitation,LBP]=WLBP(image,sigma,map)
%  WLD returns the local texture pattern of an image.
d_image=double(image);
[ysize xsize] = size(image);% Determine the dimensions of the input image.
% Block size, each WLD code is computed within a block of size bsizey*bsizex
bsizey=3;
bsizex=3;
BELTA=5; % to avoid that center pixture is equal to zero
ALPHA=1; % like a lens to magnify or shrink the difference between neighbors
EPSILON=0.0000001;
PI=3.141592653589;
numNeighbors=8;  % using 3*3 patch for example

% Minimum allowed size for the input image depends on the radius of the used LBP operator.
if(xsize < bsizex || ysize < bsizey)
  error('Too small input image. Should be at least (2*radius+1) x (2*radius+1)');
end
% filter
%    1  2  3  4   5  6  7  8  9
f00=fspecial('log',[3,3],sigma);
f00=f00.*(8/f00(2,2));
% Calculate dx and dy;
dx = xsize - bsizex;
dy = ysize - bsizey;
orign=ceil(bsizey/2);

gray_different=imfilter(d_image,f00);
d_differential_excitation = atan(ALPHA.*gray_different(orign:(orign+dy),orign:(orign+dx))./(d_image(orign:(orign+dy),orign:(orign+dx))+BELTA));
pixel_diff = neighbor_interpolation(d_image,1,8,map);
s=sign(pixel_diff);
s(find(s==0))=1;
s(find(s<0))=0;
LBP=s(1,:,:)+s(2,:,:).*2++s(3,:,:).*4+s(4,:,:).*8+s(5,:,:).*16+s(6,:,:).*32+s(7,:,:).*64+s(8,:,:).*128;
LBP=reshape(LBP,dy+1,dx+1);
LBP=map.table(LBP+1);
end
