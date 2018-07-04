function wldpwm_histogram= WLDPWM_histogram(image,m,s,v,database)
if isequal(database,'Brodatz32')
    % brodatz
    max_varient=108.6668;
    min_varient=-1.1196e-014;
elseif isequal(database,'KTH-TIPS2-a')
    % kth-tips2-a
    max_varient=108.7106;
    min_varient=-2.7988e-014;
end
wld_histogram(1,:)= WLD_histogram(image,m,s);
variant=PWM(image);
[row,col]=size(variant);
v_num=row*col;
h=zeros(1,v);
% for j=1:v_num
%     if variant(j)==max_varient;
%        h(1,v)=h(1,v)+1;
%     else
%         bin_index=fix((variant(j)-min_varient)/(max_varient-min_varient)*v)+1;
%         h(1,bin_index)= h(1,bin_index)+1;
%     end
% end
variant=fix((variant-min_varient)./(max_varient-min_varient)*v);
index=find(variant==v);
variant(index)=v-1;
h=hist(variant(:),[0:(v-1)]);
h=h/norm(h,1);
wldpwm_histogram=[wld_histogram,h];
end
