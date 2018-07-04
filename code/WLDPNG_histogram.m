function wldpng_histogram= WLDPNG_histogram(image,m,s,map,quantization,database)
[d_differential,d_LBP]=WLD_PNG(image,map);
max_v=pi+pi*pi/4;
min_v=-(pi+pi*pi/4);
if quantization==1
    % 均匀量化优化
    d_differential=fix((d_differential-min_v)./(max_v-min_v)*m*s);
    index=find(d_differential==m*s);
    d_differential(index)=m*s-1;
    wldpng=[d_differential(:),d_LBP(:)];
    h=hist3(wldpng,{0:(m*s-1),0:(map.num-1)});
    wldpng_histogram=h(:)';

% % 最值均匀量化
%     wldpng_histogram=zeros(1,map.num*m*s);
%     orientation_index=0;
%     for i=0:58
%         index=find(d_LBP==i);
%         dp=d_differential(index);
%         d_num=size(dp,1);    
%         for j=1:d_num        
%            if dp(j)>=max_v
%               wldpng_histogram(1,orientation_index*m*s+m*s)=wldpng_histogram(1,orientation_index*m*s+m*s)+1;
%            elseif dp(j)<min_v
%               wldpng_histogram(1,orientation_index*m*s+1)=wldpng_histogram(1,orientation_index*m*s+1)+1; 
%            else
%               bin_index=fix((dp(j)-min_v)/(max_v-min_v)*m*s)+1;
%               wldpng_histogram(1,orientation_index*m*s+bin_index)= wldpng_histogram(1,orientation_index*m*s+bin_index)+1;
%            end       
%            
%         end       
%         orientation_index=orientation_index+1;
%     end
elseif quantization==2
    if isequal(database,'TILDA')
        max_v=2.3392;
        min_v=-2.1195;
    elseif isequal(database,'common_defect')
        max_v=4.4736;
        min_v= -4.0237;
    end
    % 最值均匀量化
    wldpng_histogram=zeros(1,map.num*m*s);
    orientation_index=0;
    for i=0:58
        index=find(d_LBP==i);
        dp=d_differential(index);
        d_num=size(dp,1);    
        for j=1:d_num        
           if dp(j)>=max_v
              wldpng_histogram(1,orientation_index*m*s+m*s)=wldpng_histogram(1,orientation_index*m*s+m*s)+1;
           elseif dp(j)<min_v
              wldpng_histogram(1,orientation_index*m*s+1)=wldpng_histogram(1,orientation_index*m*s+1)+1; 
           else
              bin_index=fix((dp(j)-min_v)/(max_v-min_v)*m*s)+1;
              wldpng_histogram(1,orientation_index*m*s+bin_index)= wldpng_histogram(1,orientation_index*m*s+bin_index)+1;
           end       
           
        end       
        orientation_index=orientation_index+1;
    end
elseif quantization==3
    %不均匀量化TILDA
    wldpng_histogram=zeros(1,map.num*m*s);
    orientation_index=0;
    for i=0:58
        index=find(d_LBP==i);
        dp=d_differential(index);
        d_num=size(dp,1);
        for j=1:d_num
           if dp(j)==max_v
              wldpng_histogram(1,orientation_index*6*s+6*s)=wldpng_histogram(1,orientation_index*6*s+6*s)+1;
           end
           if dp(j)<(-(4*pi+pi*pi)/50)
              bin_index=fix((dp(j)+pi+pi*pi/4)/(pi+pi*pi/4-(4*pi+pi*pi)/50)*s)+1;
              wldpng_histogram(1,orientation_index*6*s+bin_index)= wldpng_histogram(1,orientation_index*6*s+bin_index)+1;
           end
           if dp(j)>=(-(4*pi+pi*pi)/50)&dp(j)<(-(4*pi+pi*pi)/100)
              bin_index=fix((dp(j)+(4*pi+pi*pi)/50)/((4*pi+pi*pi)/50-(4*pi+pi*pi)/100)*s)+1+s;
              wldpng_histogram(1,orientation_index*6*s+bin_index)= wldpng_histogram(1,orientation_index*6*s+bin_index)+1; 
           end       
           if dp(j)>=(-(4*pi+pi*pi)/100)&dp(j)<0
              bin_index=fix((dp(j)+(4*pi+pi*pi)/100)/((4*pi+pi*pi)/100)*s)+1+2*s;
              wldpng_histogram(1,orientation_index*6*s+bin_index)= wldpng_histogram(1,orientation_index*6*s+bin_index)+1; 
           end 
           if dp(j)>=0&dp(j)<(4*pi+pi*pi)/100
              bin_index=fix((dp(j))/((4*pi+pi*pi)/100)*s)+1+3*s;
             wldpng_histogram(1,orientation_index*6*s+bin_index)= wldpng_histogram(1,orientation_index*6*s+bin_index)+1; 
           end
           if dp(j)>=(4*pi+pi*pi)/100&dp(j)<(4*pi+pi*pi)/50
              bin_index=fix((dp(j)-(4*pi+pi*pi)/100)/((4*pi+pi*pi)/50-(4*pi+pi*pi)/100)*s)+1+4*s;
              wldpng_histogram(1,orientation_index*6*s+bin_index)= wldpng_histogram(1,orientation_index*6*s+bin_index)+1; 
           end
           if dp(j)>(4*pi+pi*pi)/50
              bin_index=fix((dp(j)-(4*pi+pi*pi)/50)/(pi+pi*pi/4-(4*pi+pi*pi)/50)*s)+1+5*s;
              wldpng_histogram(1,orientation_index*6*s+bin_index)= wldpng_histogram(1,orientation_index*6*s+bin_index)+1;
           end
        end 
    orientation_index=orientation_index+1;
end
end
wldpng_histogram=wldpng_histogram/norm(wldpng_histogram,1);
        






% % % % % % % %不均匀量化R3
% % % % % % % for i=0:58
% % % % % % %     index=find(d_LBP==i);
% % % % % % %     dp=d_differential_p(index);
% % % % % % %     dn=d_differential_n(index);
% % % % % % %     d_num=size(dp,1);
% % % % % % %     
% % % % % % %     for j=1:d_num
% % % % % % %         if abs(dp(j))>=abs(dn(j))
% % % % % % %             max_value=dp(j)-dn(j)+abs(dp(j)*dn(j));
% % % % % % %         else
% % % % % % %             max_value=dn(j)-dp(j)-abs(dp(j)*dn(j));
% % % % % % %         end
% % % % % % %         
% % % % % % %        if max_value==max_v
% % % % % % %            wld_histogram(1,orientation_index*6*s+6*s)=wld_histogram(1,orientation_index*6*s+6*s)+1;
% % % % % % %        end
% % % % % % %        if max_value<(-(4*pi+pi*pi)/50)
% % % % % % %           bin_index=fix((max_value+pi+pi*pi/4)/(pi+pi*pi/4-(4*pi+pi*pi)/50)*s)+1;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1;
% % % % % % %        end
% % % % % % %        if max_value>=(-(4*pi+pi*pi)/50)&max_value<(-(4*pi+pi*pi)/100)
% % % % % % %           bin_index=fix((max_value+(4*pi+pi*pi)/50)/((4*pi+pi*pi)/50-(4*pi+pi*pi)/100)*s)+1+s;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1; 
% % % % % % %        end       
% % % % % % %        if max_value>=(-(4*pi+pi*pi)/100)&max_value<0
% % % % % % %           bin_index=fix((max_value+(4*pi+pi*pi)/100)/((4*pi+pi*pi)/100)*s)+1+2*s;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1; 
% % % % % % %        end 
% % % % % % %        if max_value>=0&max_value<(4*pi+pi*pi)/100
% % % % % % %           bin_index=fix((max_value)/((4*pi+pi*pi)/100)*s)+1+3*s;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1; 
% % % % % % %        end
% % % % % % %        if max_value>=(4*pi+pi*pi)/100&max_value<(4*pi+pi*pi)/50
% % % % % % %           bin_index=fix((max_value-(4*pi+pi*pi)/100)/((4*pi+pi*pi)/50-(4*pi+pi*pi)/100)*s)+1+4*s;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1; 
% % % % % % %        end
% % % % % % %        if max_value>(4*pi+pi*pi)/50
% % % % % % %           bin_index=fix((max_value-(4*pi+pi*pi)/50)/(pi+pi*pi/4-(4*pi+pi*pi)/50)*s)+1+5*s;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1;
% % % % % % %        end
% % % % % % %     end
% % % % % % % 
% % % % % % %        
% % % % % % %     orientation_index=orientation_index+1;
% % % % % % % end

% % % % % % % %不均匀量化0226
% % % % % % % inteval=[-3,-1.5,0,1.5,3];
% % % % % % % 
% % % % % % % for i=0:58
% % % % % % %     index=find(d_LBP==i);
% % % % % % %     dp=d_differential_p(index);
% % % % % % %     dn=d_differential_n(index);
% % % % % % %     d_num=size(dp,1);
% % % % % % %     
% % % % % % %     for j=1:d_num
% % % % % % %         if abs(dp(j))>=abs(dn(j))
% % % % % % %             max_value=dp(j)-dn(j)+abs(dp(j)*dn(j));
% % % % % % %         else
% % % % % % %             max_value=dn(j)-dp(j)-abs(dp(j)*dn(j));
% % % % % % %         end
% % % % % % %         
% % % % % % %        if max_value==max_v
% % % % % % %            wld_histogram(1,orientation_index*6*s+6*s)=wld_histogram(1,orientation_index*6*s+6*s)+1;
% % % % % % %        end
% % % % % % %        if max_value<inteval(1)
% % % % % % %           bin_index=fix((max_value+pi+pi*pi/4)/(pi+pi*pi/4+inteval(1))*s)+1;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1;
% % % % % % %        end
% % % % % % %        if max_value>=inteval(1)&max_value<inteval(2)
% % % % % % %           bin_index=fix((max_value-inteval(1))/(inteval(2)-inteval(1))*s)+1+s;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1; 
% % % % % % %        end       
% % % % % % %        if max_value>=inteval(2)&max_value<inteval(3)
% % % % % % %           bin_index=fix((max_value-inteval(2))/(inteval(3)-inteval(2))*s)+1+2*s;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1; 
% % % % % % %        end 
% % % % % % %        if max_value>=inteval(3)&max_value<inteval(4)
% % % % % % %           bin_index=fix((max_value-inteval(3))/(inteval(4)-inteval(3))*s)+1+3*s;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1; 
% % % % % % %        end
% % % % % % %        if max_value>=inteval(4)&max_value<inteval(5)
% % % % % % %           bin_index=fix((max_value-inteval(4))/(inteval(5)-inteval(4))*s)+1+4*s;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1; 
% % % % % % %        end
% % % % % % %        if max_value>=inteval(5)
% % % % % % %           bin_index=fix((max_value-inteval(5))/(pi+pi*pi/4-inteval(5))*s)+1+5*s;
% % % % % % %           wld_histogram(1,orientation_index*6*s+bin_index)= wld_histogram(1,orientation_index*6*s+bin_index)+1;
% % % % % % %        end
% % % % % % %     end
% % % % % % % 
% % % % % % %        
% % % % % % %     orientation_index=orientation_index+1;
% % % % % % % end

end
