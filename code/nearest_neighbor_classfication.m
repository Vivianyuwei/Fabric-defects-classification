function class_index = nearest_neighbor_classfication(histogram_dictionary,sample_histogram,every_train_number,sub)
[drow,dcol]=size(histogram_dictionary);
[srow,scol]=size(sample_histogram);
chi_aquare_measure=zeros(drow,srow);
%卡方统计
for sample_index=1:srow
    for dictionary_index=1:drow
        distance=0;
        for col_index=1:dcol
            if sample_histogram(sample_index,col_index)~=0||histogram_dictionary(dictionary_index,col_index)~=0
                distance=distance+(histogram_dictionary(dictionary_index,col_index)-sample_histogram(sample_index,col_index))^2/(2*(histogram_dictionary(dictionary_index,col_index)+sample_histogram(sample_index,col_index))); 
            end
        end
        chi_aquare_measure(dictionary_index,sample_index)=distance;
    end
end

%最近邻
[mindistance,rowindex]=min(chi_aquare_measure);
if sub==1
    class_index=rowindex;
else
    class_index=ceil(rowindex/every_train_number);
end
end

