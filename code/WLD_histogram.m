function wld_histogram= WLD_histogram(image,m,s)
[d_differential,d_gradient_orientation]=WLD(image);
[x_size,y_size]=size(d_gradient_orientation);
wld_histogram=zeros(1,8*m*s);
%统计每个方向上的差励直方图
index=find(d_gradient_orientation<22.5|d_gradient_orientation>=(360-22.5));
d=d_differential(index);
d_num=size(d,1);
orientation_index=0;
for j=1:d_num
    if d(j)==pi/2;
       wld_histogram(1,orientation_index*m*s+m*s)=wld_histogram(1,orientation_index*m*s+m*s)+1;
    else
        bin_index=fix((d(j)+pi/2)/pi*m*s)+1;
        wld_histogram(1,orientation_index*m*s+bin_index)= wld_histogram(1,orientation_index*m*s+bin_index)+1;
    end
end
for i=2:8
    index=find(d_gradient_orientation>=(i-1)*45-22.5&d_gradient_orientation<i*45-22.5);
    d=d_differential(index);
    d_num=size(d,1);
    orientation_index=orientation_index+1;
    for j=1:d_num
        if d(j)==pi/2;
           wld_histogram(1,orientation_index*m*s+m*s)=wld_histogram(1,orientation_index*m*s+m*s)+1;
        else
            bin_index=fix((d(j)+pi/2)/pi*m*s)+1;
            wld_histogram(1,orientation_index*m*s+bin_index)= wld_histogram(1,orientation_index*m*s+bin_index)+1;
        end
    end
end
wld_histogram=wld_histogram/norm(wld_histogram,1);
end
