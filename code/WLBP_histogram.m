function wlbp_histogram = WLBP_histogram(image,s,k,sigma,map)
[d_differential,d_LBP]=WLBP(image,sigma,map);
%WLBP的划分方法  
K=k;
m=2*s+1;
wlbp_histogram=zeros(1,59*m);

[x_size,y_size]=size(d_LBP);
orientation_index=0;
%统计每个方向上的差励直方图
%quantize gradient orientation to 8 directions

for i=0:58

% %均匀划分
%     index=find(d_LBP==i);
%     d=d_differential(index);
%     d_num=size(d,1);
%     %gradient(index)=i;
%     for j=1:d_num
%         if d(j)==pi/2;
%            wld_histogram(1,orientation_index*m*s+m*s)=wld_histogram(1,orientation_index*m*s+m*s)+1;
%         else
%             bin_index=fix((d(j)+pi/2)/pi*m*s)+1;
%             wld_histogram(1,orientation_index*m*s+bin_index)= wld_histogram(1,orientation_index*m*s+bin_index)+1;
%         end
%     end

%WLBP的划分方法    
    index=find(d_LBP==i);
    d=d_differential(index);
    d_num=size(d,1);
    %gradient(index)=i;

    for j=1:d_num
        if d(j)==pi/2;
            wlbp_histogram(1,orientation_index*m+m)=wlbp_histogram(1,orientation_index*m+m)+1;
        elseif d(j)>=-K && d(j)<=K
            wlbp_histogram(1,orientation_index*m+s+1)= wlbp_histogram(1,orientation_index*m+s+1)+1;
        elseif d(j)<-K
            bin_index=fix((d(j)+pi/2)/(pi-2*K)*2*s)+1;
            wlbp_histogram(1,orientation_index*m+bin_index)= wlbp_histogram(1,orientation_index*m+bin_index)+1;
        elseif d(j)>K
            bin_index=fix((d(j)-K)/(pi-2*K)*2*s)+1+(s+1);
            wlbp_histogram(1,orientation_index*m+bin_index)= wlbp_histogram(1,orientation_index*m+bin_index)+1;
        end
    end
    orientation_index=orientation_index+1;
end
end
