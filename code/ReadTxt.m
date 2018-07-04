
 function  filenames= ReadTxt(txtfile)
 fid=fopen(txtfile,'r');
 index=0;
 while 1
     tline=fgetl(fid);
     if ~ischar(tline)
         break;
     end
     index=index+1;
     filenames(1,index)={tline};
 end
 fclose(fid);
 end
     

 
 
 
