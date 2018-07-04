function  image_data= ReadImageData( path )
fid=fopen(path,'r');
file_data=fread(fid);
data=file_data(1025:end);
image_data=reshape(uint8(data),64,64);
fclose(fid);
end
