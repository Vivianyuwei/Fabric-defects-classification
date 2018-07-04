function [d_differential_excitation,LBP]=WLD_PNG(image,map)
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
f00=[1, 1, 1; 1,-8, 1; 1, 1, 1];

% Calculate dx and dy;
dx = xsize - bsizex;
dy = ysize - bsizey;

% two matriies 
% Initialize the result matrix with zeros.
d_differential_excitation_p = zeros(dy+1,dx+1);
d_differential_excitation_n = zeros(dy+1,dx+1);
d_differential_excitation = zeros(dy+1,dx+1);
spoints=[-1 -1; -1 0; -1 1; 0 1; 1 1; 1 0; 1 -1; 0 -1];
pixel_diff=zeros(8,dy+1,dx+1);
orign=ceil(bsizey/2);
LBP=zeros(dy+1,dx+1);

for index=1:8
    pixel_diff(index,:,:)= d_image((orign:(orign+dy))+spoints(index,1),(orign:(orign+dx))+spoints(index,2))-d_image(orign:(orign+dy),orign:(orign+dx));
end
temp=sum(pixel_diff);
temp_abs=sum(abs(pixel_diff));
gray_different_sub=reshape(temp,dy+1,dx+1);
gray_different_plus=reshape(temp_abs,dy+1,dx+1);
neigh_p=(gray_different_sub+gray_different_plus)./2;
neigh_n=gray_different_plus-neigh_p;
d_differential_excitation_p=atan(ALPHA.*neigh_p./(d_image(orign:(orign+dy),orign:(orign+dx))+BELTA));
d_differential_excitation_n=atan(ALPHA.*neigh_n./(d_image(orign:(orign+dy),orign:(orign+dx))+BELTA));
d_differential_excitation = d_differential_excitation_p+d_differential_excitation_n+d_differential_excitation_p.*d_differential_excitation_n;
index=find(neigh_n>neigh_p);
d_differential_excitation(index)=-d_differential_excitation(index);
s=sign(pixel_diff);
s(find(s==0))=1;
s(find(s<0))=0;
LBP=s(1,:,:)+s(2,:,:).*2+s(3,:,:).*4+s(4,:,:).*8+s(5,:,:).*16+s(6,:,:).*32+s(7,:,:).*64+s(8,:,:).*128;
LBP=reshape(LBP,dy+1,dx+1);
LBP=map.table(LBP+1);
end