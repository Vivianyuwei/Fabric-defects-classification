function variance= PWM(image)
d_image=double(image);
[row,col]=size(d_image);
variance=zeros(row-2,col-2);
for i=2:(row-1)
    for j=2:(col-1)
        data=d_image(i-1:i+1,j-1:j+1);
        data_ordered=sort(data(:));
        data_num=size(data_ordered,1);
        index=[1:data_num]';
        temp=data_ordered-2.*(1-(index-0.5)/data_num).*data_ordered;
        variance(i-1,j-1)=sqrt(pi)/data_num*sum(temp);
    end
end
end
