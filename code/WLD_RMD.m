function [d_differential_excitation,direction]=WLD_RMD(image)
%  WLD returns the local texture pattern of an image.
d_image=double(image);
[ysize xsize] = size(d_image);% Determine the dimensions of the input image.
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
f00=[1, 1, 1; 1, -8, 1; 1, 1, 1];
f01=[1, 0, -1; 1, 0, -1; 1, 0, -1];
f02=[1, 1, 1;0, 0, 0; -1, -1, -1];
% Calculate dx and dy;
dx = xsize - bsizex;
dy = ysize - bsizey;

% two matriies 
% Initialize the result matrix with zeros.
d_differential_excitation = zeros(dy+1,dx+1);
direction=ones(dy+1,dx+1).*(pi/2);
gray_different=imfilter(d_image,f00);
orign=ceil(bsizey/2);
d_differential_excitation = atan(ALPHA.*gray_different(orign:(orign+dy),orign:(orign+dx))./(d_image(orign:(orign+dy),orign:(orign+dx))+BELTA));
d_h=imfilter(d_image,f01);
direction_h=d_h(orign:(orign+dy),orign:(orign+dx));
d_v=imfilter(d_image,f02);
direction_v=d_v(orign:(orign+dy),orign:(orign+dx));
index=find(abs(direction_h)>=EPSILON);
direction(index)=atan(direction_v(index)./direction_h(index));
index=find(direction_h< -EPSILON);
direction(index)=direction(index)+pi;
index=find(direction_v< -EPSILON & direction_h > EPSILON);
direction(index)=direction(index)+2*pi;
direction=direction.*180/PI;
end