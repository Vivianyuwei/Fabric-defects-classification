function varargout = index(varargin)
% INDEX M-file for index.fig
%      INDEX, by itself, creates a new INDEX or raises the existing
%      singleton*.
%
%      H = INDEX returns the handle to a new INDEX or the handle to
%      the existing singleton*.
%
%      INDEX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INDEX.M with the given input arguments.
%
%      INDEX('Property','Value',...) creates a new INDEX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before index_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to index_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help index

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @index_OpeningFcn, ...
                   'gui_OutputFcn',  @index_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before index is made visible.
function index_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to index (see VARARGIN)

% Choose default command line output for index
handles.output = hObject;
movegui(hObject,'center');
% Update handles structure
guidata(hObject, handles);
Initialization(hObject, eventdata, handles);

% UIWAIT makes index wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function Initialization(hObject, eventdata, handles)
set(handles.Save_Image, 'Enable', 'off');
set(handles.Clear_Image, 'Enable', 'off');
Te_Lable_OFF(hObject, eventdata, handles);
set(handles.WLD_C, 'Enable', 'off');
set(handles.WLBP_C, 'Enable', 'off');
set(handles.WLDPNG_C, 'Enable', 'off');
set(handles.WLDPWM_C, 'Enable', 'off');
set(handles.WLDsobel_C, 'Enable', 'off');
set(handles.WLDRMD_C, 'Enable', 'off');
set(handles.fd_WLDPNG, 'Enable', 'off');
set(handles.df_WLDPNG_AR, 'Enable', 'off');
set(handles.df_WLDPNG_NAR, 'Enable', 'off');
set(handles.save_data, 'Enable', 'off');
set(handles.test_select, 'Enable', 'off');
set(handles.test_image_select, 'Enable', 'off');
% Classifer_Lable_OFF(hObject, eventdata, handles);
% Texture_Lable_OFF(hObject, eventdata, handles);
% Dataload_Lable_OFF(hObject, eventdata, handles);
set(handles.axes1,'Visible','on');
set(handles.axes2,'Visible','on');
set(handles.edit1,'Visible','off');
set(handles.edit2,'Visible','off');
set(handles.popupmenu1, 'Visible', 'off');
set(handles.Wait_Bar,'Visible','off');
set(handles.uipanel1,'Title','');
set(handles.uipanel1,'Visible','off');
set(handles.Wait_Bar,'FontSize',10.0);
set(handles.edit1,'FontSize',10.0);
set(handles.edit2,'FontSize',10.0);
set(handles.popupmenu1,'FontSize',10.0);
set(handles.Wait_Bar,'HorizontalAlignment','center');
set(handles.Wait_Bar,'String','');
cla(handles.axes1);
cla(handles.axes2);
Image=zeros(100,100);
axes(handles.axes1);
imshow(Image);
axes(handles.axes2);
imshow(Image);
pause(0.001);
%set(handles.Time,'string','0.0');
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = index_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function Wait_Bar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wait_Bar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on Wait_Bar and none of its controls.
function Wait_Bar_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to Wait_Bar (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function WLD_texture_Callback(hObject, eventdata, handles)
% hObject    handle to WLD_texture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Image_Select_Callback(hObject, eventdata, handles)
% hObject    handle to Image_Select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.tif;*.bmp;*.png;*.jpg;*.jpeg;*.gif;*.xv','图像文件(*.tif;*.bmp;*.png;*.jpg;*.jpeg;*.gif)'},'选择图像');
if isequal(filename,0) | isequal(pathname,0)
   msgbox('用户取消！');
   return;
else
   Initialization(hObject, eventdata, handles)
   set(handles.WLD, 'Enable', 'on');
   set(handles.WLBP, 'Enable', 'on');
   set(handles.WLDPNG, 'Enable', 'on');
   set(handles.WLDPWM, 'Enable', 'on');
   set(handles.WLDsobel, 'Enable', 'on');
   set(handles.WLDRMD, 'Enable', 'on');
end
[pathstr, name, ext] = fileparts(filename);
if isequal(ext,'.xv')
    Image=ReadImageData([pathname filename]);
else    
    [Image,map] = imread([pathname filename]);
end
[width,height,Cnums]=size(Image);
if Cnums == 3
    %為彩色圖
    colorKey = 1;
    Image = rgb2gray(Image);
else
    colorKey = 0;
end
Image1 = Image;
axes(handles.axes1);
imshow(Image1);
Image2 = zeros([width,height]);
axes(handles.axes2);
imshow(Image2);
set(handles.edit1, 'Visible', 'on');
set(handles.edit1, 'String', '原图像');
set(handles.popupmenu1, 'Visible', 'on');
set(handles.popupmenu1, 'String', ' ');
handles.image = Image;
guidata(hObject, handles);

function set_txtVisible(hObject, eventdata, handles, name)
% hObject    handle to LBPtexture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'Visible', 'on');
set(handles.edit1, 'String', '原图像');
set(handles.popupmenu1, 'Visible', 'on');
set(handles.popupmenu1, 'String', ' ');
guidata(hObject, handles);

function Te_Lable_OFF(hObject, eventdata, handles)
set(handles.WLD, 'Enable', 'off');
set(handles.WLBP, 'Enable', 'off');
set(handles.WLDPNG, 'Enable', 'off');
set(handles.WLDPWM, 'Enable', 'off');
set(handles.WLDsobel, 'Enable', 'off');
set(handles.WLDRMD, 'Enable', 'off');

% --------------------------------------------------------------------
function WLD_Callback(hObject, eventdata, handles)
% hObject    handle to WLD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.popupmenu1, 'String', {'差分激励';'方向'});
set(handles.uipanel1,'Visible','on');
set(handles.Wait_Bar,'Visible','on');
set(handles.Wait_Bar,'HorizontalAlignment','center');
set(handles.Wait_Bar,'String','图像处理中……');
pause(0.01);
[d_differential_excitation,direction]=WLD(handles.image);
d_differential_excitation_max=max(max(d_differential_excitation));
d_differential_excitation_min=min(min(d_differential_excitation));
Image=uint8((d_differential_excitation-d_differential_excitation_min)/(d_differential_excitation_max-d_differential_excitation_min)*255);
axes(handles.axes2);
imshow(Image);
pause(0.001);
handles.Result_Image=Image;
handles.feature1=d_differential_excitation;
handles.feature2=direction;
set(handles.popupmenu1,'Value',1);
set(handles.Wait_Bar,'String','WLD纹理描述完成！');
set(handles.Save_Image, 'Enable', 'on');
set(handles.Clear_Image, 'Enable', 'on');
guidata(hObject, handles);

% --- Executes on selection change in popupmenu2.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
switch get(handles.popupmenu1,'Value')
    case 1
        d_differential_excitation=handles.feature1;
        d_differential_excitation_max=max(max(d_differential_excitation));
        d_differential_excitation_min=min(min(d_differential_excitation));
        Image=uint8((d_differential_excitation-d_differential_excitation_min)/(d_differential_excitation_max-d_differential_excitation_min)*255);
        axes(handles.axes2);
        imshow(Image);
        handles.Result_Image=Image;
        pause(0.001);
    case 2
        direction=handles.feature2;
        direction_max=max(max(direction));
        direction_min=min(min(direction));
        Image=uint8((direction-direction_min)/(direction_max-direction_min)*255);
        axes(handles.axes2);
        imshow(Image);
        handles.Result_Image=Image;
        pause(0.001);
    case 3
        variance=handles.feature3;
        variance_max=max(max(variance));
        variance_min=min(min(variance));
        Image=uint8((variance-variance_min)/(variance_max-variance_min)*255);
        axes(handles.axes2);
        imshow(Image);
        handles.Result_Image=Image;
        pause(0.001);
    otherwise
end
guidata(hObject, handles);


% --------------------------------------------------------------------
function Save_Image_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.bmp';'*.jpg';'*.jpeg'}, '保存图像 ');
    if isequal(filename,0) | isequal(pathname,0)
       msgbox('取消保存');
       return;
    end
imwrite(handles.Result_Image,[pathname filename]);
set(handles.Wait_Bar,'String','保存完成！');
guidata(hObject, handles);

% --------------------------------------------------------------------
function Clear_Image_Callback(hObject, eventdata, handles)
% hObject    handle to Clear_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Initialization(hObject, eventdata, handles);
set(handles.Wait_Bar,'Visible','on');
set(handles.uipanel1,'Title','');
set(handles.uipanel1,'Visible','on');
set(handles.Wait_Bar,'HorizontalAlignment','center');
set(handles.Wait_Bar,'String','清理完成！');
guidata(hObject, handles);


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function Wait_Bar_Callback(hObject, eventdata, handles)
% hObject    handle to Wait_Bar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Wait_Bar as text
%        str2double(get(hObject,'String')) returns contents of Wait_Bar as a double



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function WLBP_Callback(hObject, eventdata, handles)
% hObject    handle to WLBP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'请输入高斯拉普拉斯算子的方差取值(默认取0.6):'};
dlg_title = '参数设置';
num_lines= 1;
def     = {'0.6'};
answer  = inputdlg(prompt,dlg_title,num_lines,def);
if size(answer,1)==0
    return;
end
if answer{1}<0
   msgbox('方差不能为负!','错误提示'); 
end
sigma=str2double(answer{1});
set(handles.popupmenu1, 'String', {'差分激励';'uLBP'});
set(handles.uipanel1,'Visible','on');
set(handles.Wait_Bar,'Visible','on');
set(handles.Wait_Bar,'HorizontalAlignment','center');
set(handles.Wait_Bar,'FontSize',10.0);
set(handles.Wait_Bar,'String','图像处理中……');
pause(0.01);
load map.mat
[d_differential_excitation,LBP]=WLBP(handles.image,sigma,map);
d_differential_excitation_max=max(max(d_differential_excitation));
d_differential_excitation_min=min(min(d_differential_excitation));
Image=uint8((d_differential_excitation-d_differential_excitation_min)/(d_differential_excitation_max-d_differential_excitation_min)*255);
axes(handles.axes2);
imshow(Image);
pause(0.001);
handles.Result_Image=Image;
handles.feature1=d_differential_excitation;
handles.feature2=LBP;
set(handles.popupmenu1,'Value',1);
set(handles.Wait_Bar,'String','WLBP纹理描述完成！');
set(handles.Save_Image, 'Enable', 'on');
set(handles.Clear_Image, 'Enable', 'on');
guidata(hObject, handles);


% --------------------------------------------------------------------
function WLDPNG_Callback(hObject, eventdata, handles)
% hObject    handle to WLDPNG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.popupmenu1, 'String', {'差分激励';'uLBP'});
set(handles.uipanel1,'Visible','on');
set(handles.Wait_Bar,'Visible','on');
set(handles.Wait_Bar,'HorizontalAlignment','center');
set(handles.Wait_Bar,'FontSize',10.0);
set(handles.Wait_Bar,'String','图像处理中……');
pause(0.01);
load map.mat
[d_differential_excitation,LBP]=WLD_PNG(handles.image,map);
d_differential_excitation_max=max(max(d_differential_excitation));
d_differential_excitation_min=min(min(d_differential_excitation));
Image=uint8((d_differential_excitation-d_differential_excitation_min)/(d_differential_excitation_max-d_differential_excitation_min)*255);
axes(handles.axes2);
imshow(Image);
pause(0.001);
handles.Result_Image=Image;
handles.feature1=d_differential_excitation;
handles.feature2=LBP;
set(handles.popupmenu1,'Value',1);
set(handles.Wait_Bar,'String','WLD-PNG纹理描述完成！');
set(handles.Save_Image, 'Enable', 'on');
set(handles.Clear_Image, 'Enable', 'on');
guidata(hObject, handles);


% --------------------------------------------------------------------
function WLDPWM_Callback(hObject, eventdata, handles)
% hObject    handle to WLDPWM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.popupmenu1, 'String', {'差分激励';'方向';'概率权重矩'});
set(handles.uipanel1,'Visible','on');
set(handles.Wait_Bar,'Visible','on');
set(handles.Wait_Bar,'HorizontalAlignment','center');
set(handles.Wait_Bar,'FontSize',10.0);
set(handles.Wait_Bar,'String','图像处理中……');
pause(0.01);
[d_differential_excitation,direction]=WLD(handles.image);
variance=PWM(handles.image);
d_differential_excitation_max=max(max(d_differential_excitation));
d_differential_excitation_min=min(min(d_differential_excitation));
Image=uint8((d_differential_excitation-d_differential_excitation_min)/(d_differential_excitation_max-d_differential_excitation_min)*255);
axes(handles.axes2);
imshow(Image);
pause(0.001);
handles.Result_Image=Image;
handles.feature1=d_differential_excitation;
handles.feature2=direction;
handles.feature3=variance;
set(handles.popupmenu1,'Value',1);
set(handles.Wait_Bar,'String','WLD-PWM纹理描述完成！');
set(handles.Save_Image, 'Enable', 'on');
set(handles.Clear_Image, 'Enable', 'on');
guidata(hObject, handles);


% --------------------------------------------------------------------
function WLDsobel_Callback(hObject, eventdata, handles)
% hObject    handle to WLDsobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'请输入高斯滤波预处理的方差取值(默认取0.6):'};
dlg_title = '参数设置';
num_lines= 1;
def     = {'0.6'};
answer  = inputdlg(prompt,dlg_title,num_lines,def);
if size(answer,1)==0
    return;
end
if answer{1}<0
   msgbox('方差不能为负!','错误提示'); 
end
sigma=str2double(answer{1});
set(handles.popupmenu1, 'String', {'差分激励';'方向'});
set(handles.uipanel1,'Visible','on');
set(handles.Wait_Bar,'Visible','on');
set(handles.Wait_Bar,'HorizontalAlignment','center');
set(handles.Wait_Bar,'FontSize',10.0);
set(handles.Wait_Bar,'String','图像处理中……');
pause(0.01);
g=fspecial('gaussian',[3,3],sigma);
handles.image=imfilter(handles.image,g);
[d_differential_excitation,direction]=WLD_sobel(handles.image);
d_differential_excitation_max=max(max(d_differential_excitation));
d_differential_excitation_min=min(min(d_differential_excitation));
Image=uint8((d_differential_excitation-d_differential_excitation_min)/(d_differential_excitation_max-d_differential_excitation_min)*255);
axes(handles.axes2);
imshow(Image);
pause(0.001);
handles.Result_Image=Image;
handles.feature1=d_differential_excitation;
handles.feature2=direction;
set(handles.popupmenu1,'Value',1);
set(handles.Wait_Bar,'String','WLD-sobel纹理描述完成！');
set(handles.Save_Image, 'Enable', 'on');
set(handles.Clear_Image, 'Enable', 'on');
guidata(hObject, handles);


% --------------------------------------------------------------------
function WLDRMD_Callback(hObject, eventdata, handles)
% hObject    handle to WLDRMD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.popupmenu1, 'String', {'差分激励';'方向'});
set(handles.uipanel1,'Visible','on');
set(handles.Wait_Bar,'Visible','on');
set(handles.Wait_Bar,'HorizontalAlignment','center');
set(handles.Wait_Bar,'FontSize',10.0);
set(handles.Wait_Bar,'String','图像处理中……');
pause(0.01);
[d_differential_excitation,direction]=WLD_RMD(handles.image);
d_differential_excitation_max=max(max(d_differential_excitation));
d_differential_excitation_min=min(min(d_differential_excitation));
Image=uint8((d_differential_excitation-d_differential_excitation_min)/(d_differential_excitation_max-d_differential_excitation_min)*255);
axes(handles.axes2);
imshow(Image);
pause(0.001);
handles.Result_Image=Image;
handles.feature1=d_differential_excitation;
handles.feature2=direction;
set(handles.popupmenu1,'Value',1);
set(handles.Wait_Bar,'String','WLD-RMD纹理描述完成！');
set(handles.Save_Image, 'Enable', 'on');
set(handles.Clear_Image, 'Enable', 'on');
guidata(hObject, handles);


% --------------------------------------------------------------------
function database_classification_Callback(hObject, eventdata, handles)
% hObject    handle to database_classification (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function fd_train_Callback(hObject, eventdata, handles)
% hObject    handle to fd_train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function texture_database_Callback(hObject, eventdata, handles)
% hObject    handle to texture_database (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function WLD_C_Callback(hObject, eventdata, handles)
% hObject    handle to WLD_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt1 = {'请输入差分激励划分的频段数M(默认取6):'};
dlg_title = '参数设置';
num_lines= 1;
def1     = {'6'};
answer1  = inputdlg(prompt1,dlg_title,num_lines,def1);
if size(answer1,1)==0
    return;
end
if answer1{1}<0
   msgbox('频段数不能为负!','错误提示'); 
end
m=str2double(answer1{1});
prompt2 = {'请输入每个频段划分的格数S(默认取1):'};
def2     = {'1'};
answer2  = inputdlg(prompt2,dlg_title,num_lines,def2);
if size(answer2,1)==0
    return;
end
if answer2{1}<0
   msgbox('频段数不能为负!','错误提示'); 
end
s=str2double(answer2{1});
handles.m=m;
handles.s=s;
handles.method='WLD';
handles.sigma=0;
handles.k=0;
handles.v=0;
guidata(hObject, handles);
feature_extraction(hObject, eventdata, handles);




function feature_extraction(hObject, eventdata, handles)
set(handles.uipanel1,'Visible','on');
set(handles.Wait_Bar,'Visible','on');
set(handles.uipanel1,'Title','');
set(handles.Wait_Bar,'string','训练样本处理中，请等待...');
set(handles.edit1,'Visible','on');
set(handles.edit2,'Visible','on');
set(handles.edit2,'string','图像示例2');
set(handles.edit1,'string','图像示例1');
train_histogram=ExtractImageFeature(hObject, eventdata, handles,'train');
set(handles.uipanel1,'Title','');
set(handles.Wait_Bar,'string','测试样本处理中，请等待...');
set(handles.edit2,'string','图像示例2');
set(handles.edit1,'string','图像示例1');
test_histogram=ExtractImageFeature(hObject, eventdata, handles,'test');
set(handles.uipanel1,'Title','');
set(handles.Wait_Bar,'string','图像分类中，请等待...');
pause(1);
class_index = nearest_neighbor_classfication(train_histogram,test_histogram,handles.every_train_number,handles.sub);
accuracy=calculate(hObject, eventdata, handles,class_index);
set(handles.Wait_Bar,'string','分类完成!');
if isequal(handles.database,'Brodatz32')
    str=sprintf('Brodatz32纹理库上的分类准确率为:%.2f%%',accuracy*100);
elseif isequal(handles.database,'KTH-TIPS2-a')
    str=sprintf('KTH-TIPS2-a纹理库上的分类准确率为:%.2f%%',accuracy*100);
end
msgbox(str);
guidata(hObject, handles);

function right_percent=calculate(hObject, eventdata, handles,class_index)
right=0;
error=[];
value=[];
if handles.sub~=1
    every_test_number=handles.every_test_number;
    class_number=handles.class_Num;
    test_number=class_number*every_test_number;
    for index=1:test_number
       if class_index(index)==ceil(index/every_test_number)
           right=right+1;
       else
           error=[error,class_index(index)];
           value=[value,ceil(index/every_test_number)];
       end
    end
    right_percent=right/test_number;
else
    train_name=handles.train_names;
    test_name=handles.test_names;
    test_number=length(test_name);
    for index=1:test_number
       if strcmp(test_name{index}(1:2),train_name{class_index(index)}(1:2))
           right=right+1;
       end
    end
    
right_percent=right/test_number;
end



function feature_histogram= ExtractImageFeature(hObject, eventdata, handles, train_or_test)
m=handles.m;
s=handles.s;
method=handles.method;
load map.mat
pathname=handles.Image_path;
if handles.sigma~=0 && ~isequal(handles.method,'WLBP')
    g=fspecial('gaussian',[3,3],handles.sigma);
end
if isequal(train_or_test,'train')
    filenames=handles.train_names;
else
    filenames=handles.test_names;
end
len=length(filenames);
count_len=round(len*0.05);
count=count_len;
if isequal(train_or_test,'train')
    str='训练样本处理中...';
else
    str='测试样本处理中...';
end 
h= waitbar(0,str,'WindowStyle','modal');
set(findobj(h,'type','patch'), 'edgecolor','b','facecolor','b');
for i=1:len
    image_path=[pathname,filenames{i}];
    if handles.sub==0
        Test_Image=ReadImageData(image_path);
    else
        Test_Image=imread(image_path);
    end
    if i==1
        Example_Image2=Test_Image;
    end
        Example_Image1=Test_Image;
    if i==2
        axes(handles.axes1);
        imshow(Example_Image1);
        axes(handles.axes2);
        imshow(Example_Image2);
        Example_Image2=Example_Image1;    
        pause(0.001);
    end
    if i==count
        axes(handles.axes1);
        imshow(Example_Image1);
        axes(handles.axes2);
        imshow(Example_Image2);
        Example_Image2=Example_Image1;
        pause(0.001);
        count=count+count_len;
    end
    [row,col,Cnums]=size(Test_Image);
    if Cnums == 3
        %為彩色圖
        Test_Image=rgb2gray(Test_Image);
    end
    Test_Image=double(Test_Image);
    if handles.sigma~=0 && ~isequal(handles.method,'WLBP')
        Test_Image=imfilter(Test_Image,g);
    end
    if isequal(handles.method,'WLD')
        feature_histogram(i,:)=WLD_histogram(Test_Image,m,s);
    elseif isequal(handles.method,'WLDPWM')
        feature_histogram(i,:)=WLDPWM_histogram(Test_Image,m,s,handles.v,handles.database);
    elseif isequal(handles.method,'WLDsobel')
        feature_histogram(i,:)=WLDsobel_histogram(Test_Image,m,s); 
    elseif isequal(handles.method,'WLDRMD')
        feature_histogram(i,:)=WLDRMD_histogram(Test_Image,m,s); 
    elseif isequal(handles.method,'WLBP')
        feature_histogram(i,:)=WLBP_histogram(Test_Image,s,handles.k,handles.sigma,map); 
    else
        temp=WLDPNG_histogram(Test_Image,m,s,map,handles.quantization,handles.database); 
    end
    if isequal(handles.method,'WLDPNG')||isequal(handles.method,'fd_WLDPNG')
        feature_histogram(i,:)=temp;
    end
    if isequal(handles.method,'fd_WLDPNG_AR')
        AR=col/row;
        feature_histogram(i,:)=[temp,AR];
    end
    if isequal(handles.method,'fd_WLDPNG_NAR')
        NAR=2*atan(col/row)/pi;
        feature_histogram(i,:)=[temp,NAR];
    end        
    if isequal(train_or_test,'train')
        str=sprintf('训练样本处理中%.2f%%',i/len*100);
    else
        str=sprintf('测试样本处理中%.2f%%',i/len*100);
    end 
    waitbar(i/len,h,str);
end
close(h)
if isequal(train_or_test,'train')
    str=sprintf('训练样本处理完成！');
else
    str=sprintf('测试样本处理完成！');
end
set(handles.Wait_Bar,'String',str);
pause(0.01);
guidata(hObject, handles);


% --------------------------------------------------------------------
function WLDPWM_C_Callback(hObject, eventdata, handles)
% hObject    handle to WLDPWM_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt1 = {'请输入差分激励划分的频段数M(默认取6):'};
dlg_title = '参数设置';
num_lines= 1;
def1     = {'6'};
answer1  = inputdlg(prompt1,dlg_title,num_lines,def1);
if size(answer1,1)==0
    return;
end
if answer1{1}<0
   msgbox('频段数不能为负!','错误提示'); 
end
m=str2double(answer1{1});
prompt2 = {'请输入每个频段划分的格数S(默认取1):'};
def2     = {'1'};
answer2  = inputdlg(prompt2,dlg_title,num_lines,def2);
if size(answer2,1)==0
    return;
end
if answer2{1}<0
   msgbox('格数不能为负!','错误提示'); 
end
s=str2double(answer2{1});
prompt3 = {'请输入方差划分的格数V(默认取10):'};
def3     = {'10'};
answer3  = inputdlg(prompt3,dlg_title,num_lines,def3);
if size(answer3,1)==0
    return;
end
if answer3{1}<0
   msgbox('格数不能为负!','错误提示'); 
end
v=str2double(answer3{1});
handles.m=m;
handles.s=s;
handles.method='WLDPWM';
handles.sigma=0;
handles.k=0;
handles.v=v;
guidata(hObject, handles);
feature_extraction(hObject, eventdata, handles);

% --------------------------------------------------------------------
function WLDsobel_C_Callback(hObject, eventdata, handles)
% hObject    handle to WLDsobel_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt1 = {'请输入差分激励划分的频段数M(默认取6):'};
dlg_title = '参数设置';
num_lines= 1;
def1     = {'6'};
answer1  = inputdlg(prompt1,dlg_title,num_lines,def1);
if size(answer1,1)==0
    return;
end
if answer1{1}<0
   msgbox('频段数不能为负!','错误提示'); 
end
m=str2double(answer1{1});
prompt2 = {'请输入每个频段划分的格数S(默认取1):'};
def2     = {'1'};
answer2  = inputdlg(prompt2,dlg_title,num_lines,def2);
if size(answer2,1)==0
    return;
end
if answer2{1}<0
   msgbox('格数不能为负!','错误提示'); 
end
s=str2double(answer2{1});
prompt3 = {'请输入高斯滤波预处理的方差取值(默认取0.6):'};
def3     = {'0.6'};
answer3  = inputdlg(prompt3,dlg_title,num_lines,def3);
if size(answer3,1)==0
    return;
end
if answer3{1}<0
   msgbox('方差不能为负!','错误提示'); 
end
sigma=str2double(answer3{1});
handles.m=m;
handles.s=s;
handles.method='WLDsobel';
handles.sigma=sigma;
handles.k=0;
handles.v=0;
guidata(hObject, handles);
feature_extraction(hObject, eventdata, handles);

% --------------------------------------------------------------------
function WLDRMD_C_Callback(hObject, eventdata, handles)
% hObject    handle to WLDRMD_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt1 = {'请输入差分激励划分的频段数M(默认取6):'};
dlg_title = '参数设置';
num_lines= 1;
def1     = {'6'};
answer1  = inputdlg(prompt1,dlg_title,num_lines,def1);
if size(answer1,1)==0
    return;
end
if answer1{1}<0
   msgbox('频段数不能为负!','错误提示'); 
end
m=str2double(answer1{1});
prompt2 = {'请输入每个频段划分的格数S(默认取1):'};
def2     = {'1'};
answer2  = inputdlg(prompt2,dlg_title,num_lines,def2);
if size(answer2,1)==0
    return;
end
if answer2{1}<0
   msgbox('格数不能为负!','错误提示'); 
end
s=str2double(answer2{1});
handles.m=m;
handles.s=s;
handles.method='WLDRMD';
handles.sigma=0;
handles.k=0;
handles.v=0;
guidata(hObject, handles);
feature_extraction(hObject, eventdata, handles);



% --------------------------------------------------------------------
function WLBP_C_Callback(hObject, eventdata, handles)
% hObject    handle to WLBP_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt1 = {'请输入差分激励高频段划分的格数S(默认取2):'};
dlg_title = '参数设置';
num_lines= 1;
def1     = {'2'};
answer1  = inputdlg(prompt1,dlg_title,num_lines,def1);
if size(answer1,1)==0
    return;
end
if answer1{1}<0
   msgbox('格数不能为负!','错误提示'); 
end
s=str2double(answer1{1});
prompt2 = {'请输入高斯拉普拉斯算子的方差取值(默认取0.6):'};
def2     = {'0.6'};
answer2  = inputdlg(prompt2,dlg_title,num_lines,def2);
if size(answer2,1)==0
    return;
end
if answer2{1}<0
   msgbox('方差不能为负!','错误提示'); 
end
sigma=str2double(answer2{1});
prompt3 = {'请输入高低频段的临界值(默认取1/30*pi):'};
def3     = {'1/30*pi'};
answer3  = inputdlg(prompt3,dlg_title,num_lines,def3);
if size(answer3,1)==0
    return;
end
if answer3{1}<0
   msgbox('方差不能为负!','错误提示'); 
end
k=double(str2num(answer3{1}));
handles.m=0;
handles.s=s;
handles.method='WLBP';
handles.sigma=sigma;
handles.k=k;
handles.v=0;
guidata(hObject, handles);
feature_extraction(hObject, eventdata, handles);


% --------------------------------------------------------------------
function WLDPNG_C_Callback(hObject, eventdata, handles)
% hObject    handle to WLDPNG_C (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt1 = {'请输入差分激励划分的频段数M(默认取6):'};
dlg_title = '参数设置';
num_lines= 1;
def1     = {'6'};
answer1  = inputdlg(prompt1,dlg_title,num_lines,def1);
if size(answer1,1)==0
    return;
end
if answer1{1}<0
   msgbox('频段数不能为负!','错误提示'); 
end
m=str2double(answer1{1});
prompt2 = {'请输入每个频段划分的格数S(默认取1):'};
def2     = {'1'};
answer2  = inputdlg(prompt2,dlg_title,num_lines,def2);
if size(answer2,1)==0
    return;
end
if answer2{1}<0
   msgbox('格数不能为负!','错误提示'); 
end
s=str2double(answer2{1});
prompt3 = {'请输入高斯滤波预处理的方差取值(默认取0.6):'};
def3     = {'0.6'};
answer3  = inputdlg(prompt3,dlg_title,num_lines,def3);
if size(answer3,1)==0
    return;
end
if answer3{1}<0
   msgbox('方差不能为负!','错误提示'); 
end
sigma=str2double(answer3{1});
handles.m=m;
handles.s=s;
handles.method='WLDPNG';
handles.sigma=sigma;
handles.k=0;
handles.v=0;
handles.quantization=1;
guidata(hObject, handles);
feature_extraction(hObject, eventdata, handles);


% --------------------------------------------------------------------
function Brodatz32_Callback(hObject, eventdata, handles)
% hObject    handle to Brodatz32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Initialization(hObject, eventdata, handles);
[train_fname,pname]=uigetfile('.\Brodatz32\txt\*_train.txt','选择训练集');
if isequal(train_fname,0) | isequal(pname,0)
   msgbox('用户取消！');
   return;
else
   Initialization(hObject, eventdata, handles);
   Texture_classification_enable(hObject, eventdata, handles);
end
train_names=ReadTxt([pname,train_fname]);
i=findstr(train_fname,'_');
test_fname=sprintf('%s_test.txt',train_fname(1:(i-1)));
test_names=ReadTxt([pname,test_fname]);
pathname='.\Brodatz32\';
handles.train_names=train_names;
handles.test_names=test_names;
handles.Image_path=pathname;
handles.class_Num=32;
handles.every_train_number=32;
handles.every_test_number=32;
handles.database='Brodatz32';
handles.sub=0;
pause(0.01);
guidata(hObject, handles);


% --------------------------------------------------------------------
function KTH_TIPS2_a_Callback(hObject, eventdata, handles)
% hObject    handle to KTH_TIPS2_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Initialization(hObject, eventdata, handles);
[train_fname,pname]=uigetfile('.\KTH-TIPS2-a\txt\*_train.txt','选择训练集');
if isequal(train_fname,0) | isequal(pname,0)
   msgbox('用户取消！');
   return;
else
   Initialization(hObject, eventdata, handles)
   Texture_classification_enable(hObject, eventdata, handles);
end
train_names=ReadTxt([pname,train_fname]);
i=findstr(train_fname,'_');
test_fname=sprintf('%s_test.txt',train_fname(1:(i-1)));
test_names=ReadTxt([pname,test_fname]);
pathname='.\KTH-TIPS2-a\';
handles.train_names=train_names;
handles.test_names=test_names;
handles.Image_path=pathname;
handles.every_train_number=0;
handles.sub=1;
handles.database='KTH-TIPS2-a';
pause(0.01);
guidata(hObject, handles);


function Texture_classification_enable(hObject, eventdata, handles)
 set(handles.WLD_C, 'Enable', 'on');
 set(handles.WLBP_C, 'Enable', 'on');
 set(handles.WLDPNG_C, 'Enable', 'on');
 set(handles.WLDPWM_C, 'Enable', 'on');
 set(handles.WLDsobel_C, 'Enable', 'on');
 set(handles.WLDRMD_C, 'Enable', 'on');
 guidata(hObject, handles);



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_30_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function load_data_Callback(hObject, eventdata, handles)
% hObject    handle to load_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.mat','数据文件(*.mat)'},'加载数据');
if isequal(filename,0) | isequal(pathname,0)
   msgbox('用户取消！');
   return;
else
    set(handles.Wait_Bar,'Visible','on');
    set(handles.uipanel1,'Title','');
    set(handles.uipanel1,'Visible','on');
    set(handles.Wait_Bar,'HorizontalAlignment','center');
    set(handles.Wait_Bar,'String','数据载入中，请稍后...');
    load([pathname,filename]);
    handles.train_histogram=train_histogram;
    handles.Image_path=Image_path;
    handles.every_train_number=every_train_number;
    handles.every_test_number=every_test_number;
    handles.sub=sub;
    handles.database=databs;
    handles.method=method;
    handles.class_Num=class_Num;
    handles.m=m;
    handles.s=s;
    handles.sigma=sig;
    handles.quantization=quantization;
    set(handles.test_select, 'Enable', 'on');
    set(handles.test_image_select, 'Enable', 'on');
    set(handles.Wait_Bar,'String','载入完成！');
end
guidata(hObject, handles);



% --------------------------------------------------------------------
function test_select_Callback(hObject, eventdata, handles)
% hObject    handle to test_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[test_fname,pname]=uigetfile([handles.Image_path,'txt\*_test.txt'],'选择测试集');
if isequal(test_fname,0) | isequal(pname,0)
   msgbox('用户取消！');
   return;
end
test_names=ReadTxt([pname,test_fname]);
handles.test_names=test_names;
guidata(hObject, handles);
df_feature_extraction(hObject, eventdata, handles,'test');






% --------------------------------------------------------------------
function test_image_select_Callback(hObject, eventdata, handles)
% hObject    handle to test_image_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.tif;*.bmp;*.png;*.jpg;*.jpeg;*.gif;*.xv','图像文件(*.tif;*.bmp;*.png;*.jpg;*.jpeg;*.gif)'},'选择图像');
if isequal(filename,0) | isequal(pathname,0)
    msgbox('用户取消！');
    return;
else
    set(handles.uipanel1,'Visible','on');
    set(handles.Wait_Bar,'Visible','on');
    set(handles.uipanel1,'Title','');
    set(handles.Wait_Bar,'string','');
    set(handles.edit1,'Visible','on');
    set(handles.edit2,'Visible','on');
    load map.mat
end
image=imread([pathname,filename]);
axes(handles.axes1);
imshow(image);
set(handles.edit1,'string','测试图像');
[row,col,Cnums]=size(image);
if Cnums == 3
    %為彩色圖
    image=rgb2gray(image);
end
image=double(image);
if handles.sigma~=0
    g=fspecial('gaussian',[3,3],handles.sigma);
    image=imfilter(image,g);
end
temp=WLDPNG_histogram(image,handles.m,handles.s,map,handles.quantization,handles.database); 
if isequal(handles.method,'WLDPNG')||isequal(handles.method,'fd_WLDPNG')
    test_histogram=temp;
end
if isequal(handles.method,'fd_WLDPNG_AR')
    AR=col/row;
    test_histogram=[temp,AR];
end
if isequal(handles.method,'fd_WLDPNG_NAR')
    NAR=2*atan(col/row)/pi;
    test_histogram=[temp,NAR];
end
axes(handles.axes2);
bar(test_histogram);
set(handles.edit2,'string','特征直方图');
class_index = nearest_neighbor_classfication(handles.train_histogram,test_histogram,handles.every_train_number,handles.sub);
if isequal(handles.database,'TILDA')
   switch class_index
       case 1
           set(handles.Wait_Bar,'string','疵点类型：破洞');
       case 2
           set(handles.Wait_Bar,'string','疵点类型：油污');
       case 3
           set(handles.Wait_Bar,'string','疵点类型：纱疵');
       case 4
           set(handles.Wait_Bar,'string','疵点类型：飞来物');
       case 5
           set(handles.Wait_Bar,'string','疵点类型：竹节');
   end
elseif isequal(handles.database,'common_defect')
    switch class_index
       case 1
           set(handles.Wait_Bar,'string','疵点类型：断经');
       case 2
           set(handles.Wait_Bar,'string','疵点类型：结头');
       case 3
           set(handles.Wait_Bar,'string','疵点类型：破洞');
       case 4
           set(handles.Wait_Bar,'string','疵点类型：松经');
       case 5
           set(handles.Wait_Bar,'string','疵点类型：跳花');
       case 6
           set(handles.Wait_Bar,'string','疵点类型：跳纱');
       case 7
           set(handles.Wait_Bar,'string','疵点类型：脱纬');
       case 8
           set(handles.Wait_Bar,'string','疵点类型：纬缩');
       case 9
           set(handles.Wait_Bar,'string','疵点类型：稀弄');
       case 10
           set(handles.Wait_Bar,'string','疵点类型：稀纬');
       case 11
           set(handles.Wait_Bar,'string','疵点类型：油污');
   end
end
guidata(hObject, handles);




% --------------------------------------------------------------------
function trainset_select_Callback(hObject, eventdata, handles)
% hObject    handle to trainset_select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function fd_WLDPNG_Callback(hObject, eventdata, handles)
% hObject    handle to fd_WLDPNG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt4 = {'请选择差分激励的量化方式:'};
if isequal(handles.database,'TILDA')
    liststring={'理论区间均匀量','最值均匀量化','不均匀量化'};
elseif isequal(handles.database,'common_defect')
    liststring={'理论区间均匀量','最值均匀量化'};
end
[select,value]=listdlg('PromptString',prompt4,'SelectionMode','single','ListString',liststring);
if value==0
    return;
else
    quantization=select;
end 
dlg_title = '参数设置';
num_lines= 1;
if quantization~=3
    prompt1 = {'请输入差分激励划分的频段数M(默认取6):'};
    def1     = {'6'};
    answer1  = inputdlg(prompt1,dlg_title,num_lines,def1);
    if size(answer1,1)==0
        return;
    end
    if answer1{1}<0
       msgbox('频段数不能为负!','错误提示'); 
    end
    m=str2double(answer1{1});
else
    m=6;
end
prompt2 = {'请输入每个频段划分的格数S(默认取1):'};
def2     = {'1'};
answer2  = inputdlg(prompt2,dlg_title,num_lines,def2);
if size(answer2,1)==0
    return;
end
if answer2{1}<0
   msgbox('格数不能为负!','错误提示'); 
end
s=str2double(answer2{1});
prompt3 = {'请输入高斯滤波预处理的方差取值(默认取0):'};
def3     = {'0'};
answer3  = inputdlg(prompt3,dlg_title,num_lines,def3);
if size(answer3,1)==0
    return;
end
if answer3{1}<0
   msgbox('方差不能为负!','错误提示'); 
end
sigma=str2double(answer3{1}); 
handles.m=m;
handles.s=s;
handles.method='fd_WLDPNG';
handles.sigma=sigma;
handles.quantization=quantization;
handles.k=0;
handles.v=0;
guidata(hObject, handles);
df_feature_extraction(hObject, eventdata, handles,'train');


% --------------------------------------------------------------------
function df_WLDPNG_AR_Callback(hObject, eventdata, handles)
% hObject    handle to df_WLDPNG_AR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt4 = {'请选择差分激励的量化方式:'};
if isequal(handles.database,'TILDA')
    liststring={'理论区间均匀量','最值均匀量化','不均匀量化'};
elseif isequal(handles.database,'common_defect')
    liststring={'理论区间均匀量','最值均匀量化'};
end
[select,value]=listdlg('PromptString',prompt4,'SelectionMode','single','ListString',liststring);
if value==0
    return;
else
    quantization=select;
end 
dlg_title = '参数设置';
num_lines= 1;
if quantization~=3
    prompt1 = {'请输入差分激励划分的频段数M(默认取6):'};
    def1     = {'6'};
    answer1  = inputdlg(prompt1,dlg_title,num_lines,def1);
    if size(answer1,1)==0
        return;
    end
    if answer1{1}<0
       msgbox('频段数不能为负!','错误提示'); 
    end
    m=str2double(answer1{1});
else
    m=6;
end
prompt2 = {'请输入每个频段划分的格数S(默认取1):'};
def2     = {'1'};
answer2  = inputdlg(prompt2,dlg_title,num_lines,def2);
if size(answer2,1)==0
    return;
end
if answer2{1}<0
   msgbox('格数不能为负!','错误提示'); 
end
s=str2double(answer2{1});
prompt3 = {'请输入高斯滤波预处理的方差取值(默认取0):'};
def3     = {'0'};
answer3  = inputdlg(prompt3,dlg_title,num_lines,def3);
if size(answer3,1)==0
    return;
end
if answer3{1}<0
   msgbox('方差不能为负!','错误提示'); 
end
sigma=str2double(answer3{1});
handles.m=m;
handles.s=s;
handles.method='fd_WLDPNG_AR';
handles.sigma=sigma;
handles.quantization=quantization;
handles.k=0;
handles.v=0;
guidata(hObject, handles);
df_feature_extraction(hObject, eventdata, handles,'train');


% --------------------------------------------------------------------
function df_WLDPNG_NAR_Callback(hObject, eventdata, handles)
% hObject    handle to df_WLDPNG_NAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt4 = {'请选择差分激励的量化方式:'};
if isequal(handles.database,'TILDA')
    liststring={'理论区间均匀量','最值均匀量化','不均匀量化'};
elseif isequal(handles.database,'common_defect')
    liststring={'理论区间均匀量','最值均匀量化'};
end
[select,value]=listdlg('PromptString',prompt4,'SelectionMode','single','ListString',liststring);
if value==0
    return;
else
    quantization=select;
end 
dlg_title = '参数设置';
num_lines= 1;
if quantization~=3
    prompt1 = {'请输入差分激励划分的频段数M(默认取6):'};
    def1     = {'6'};
    answer1  = inputdlg(prompt1,dlg_title,num_lines,def1);
    if size(answer1,1)==0
        return;
    end
    if answer1{1}<0
       msgbox('频段数不能为负!','错误提示'); 
    end
    m=str2double(answer1{1});
else
    m=6;
end
prompt2 = {'请输入每个频段划分的格数S(默认取1):'};
def2     = {'1'};
answer2  = inputdlg(prompt2,dlg_title,num_lines,def2);
if size(answer2,1)==0
    return;
end
if answer2{1}<0
   msgbox('格数不能为负!','错误提示'); 
end
s=str2double(answer2{1});
prompt3 = {'请输入高斯滤波预处理的方差取值(默认取0):'};
def3     = {'0'};
answer3  = inputdlg(prompt3,dlg_title,num_lines,def3);
if size(answer3,1)==0
    return;
end
if answer3{1}<0
   msgbox('方差不能为负!','错误提示'); 
end
sigma=str2double(answer3{1});
handles.m=m;
handles.s=s;
handles.method='fd_WLDPNG_NAR';
handles.sigma=sigma;
handles.quantization=quantization;
handles.k=0;
handles.v=0;
guidata(hObject, handles);
df_feature_extraction(hObject, eventdata, handles,'train');



function df_feature_extraction(hObject, eventdata, handles,trainortest)
set(handles.uipanel1,'Visible','on');
set(handles.Wait_Bar,'Visible','on');
set(handles.uipanel1,'Title','');
if isequal(trainortest,'train')
    set(handles.Wait_Bar,'string','训练样本学习中，请等待...');
elseif isequal(trainortest,'test')
    set(handles.Wait_Bar,'string','测试样本处理中，请等待...');
end
set(handles.edit1,'Visible','on');
set(handles.edit2,'Visible','on');
set(handles.edit2,'string','图像示例2');
set(handles.edit1,'string','图像示例1');
if isequal(trainortest,'train')
    train_histogram=ExtractImageFeature(hObject, eventdata, handles,trainortest);
    handles.train_histogram=train_histogram;
    set(handles.uipanel1,'Title','');
    set(handles.Wait_Bar,'string','样本训练完成!');
    set(handles.save_data, 'Enable', 'on');
    set(handles.test_select, 'Enable', 'on');
    set(handles.test_image_select, 'Enable', 'on');
elseif isequal(trainortest,'test')
    test_histogram=ExtractImageFeature(hObject, eventdata, handles,trainortest);
    set(handles.uipanel1,'Title','');
    set(handles.Wait_Bar,'string','测试样本处理完成!');
    set(handles.uipanel1,'Title','');
    set(handles.Wait_Bar,'string','图像分类中，请等待...');
    pause(1);
    class_index = nearest_neighbor_classfication(handles.train_histogram,test_histogram,handles.every_train_number,handles.sub);
    accuracy=calculate(hObject, eventdata, handles,class_index);
    set(handles.Wait_Bar,'string','分类完成!');
    if isequal(handles.database,'TILDA')
        str=sprintf('TILDA上的分类准确率为:%.2f%%',accuracy*100);
    elseif isequal(handles.database,'common_defect')
        str=sprintf('常见疵点的分类准确率为:%.2f%%',accuracy*100);
    end
    msgbox(str);
end
guidata(hObject, handles);


% --------------------------------------------------------------------
function save_data_Callback(hObject, eventdata, handles)
% hObject    handle to save_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
train_histogram=handles.train_histogram;
Image_path=handles.Image_path;
every_train_number=handles.every_train_number;
every_test_number=handles.every_test_number;
sub=handles.sub;
databs=handles.database;
method=handles.method;
class_Num=handles.class_Num;
m=handles.m;
s=handles.s;
sig=handles.sigma;
quantization=handles.quantization;
[filename, pathname] = uiputfile({'*.mat'}, '保存训练数据');
    if isequal(filename,0) | isequal(pathname,0)
       msgbox('取消保存');
       return;
    end
save([pathname filename],'train_histogram','Image_path','every_train_number','every_test_number','sub','databs','method','class_Num','m','s','sig','quantization');
set(handles.Wait_Bar,'String','保存完成！');
guidata(hObject, handles);


% --------------------------------------------------------------------
function TILDA_Callback(hObject, eventdata, handles)
% hObject    handle to TILDA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Initialization(hObject, eventdata, handles);
[train_fname,pname]=uigetfile('.\TILDA\txt\*_train.txt','选择训练集');
if isequal(train_fname,0) | isequal(pname,0)
   msgbox('用户取消！');
   return;
else
   Initialization(hObject, eventdata, handles);
   fd_classification_enable(hObject, eventdata, handles);
end
train_names=ReadTxt([pname,train_fname]);
i=findstr(train_fname,'_');
test_fname=sprintf('%s_test.txt',train_fname(1:(i-1)));
test_names=ReadTxt([pname,test_fname]);
pathname='.\TILDA\';
handles.train_names=train_names;
handles.test_names=test_names;
handles.Image_path=pathname;
handles.class_Num=5;
handles.every_train_number=25;
handles.every_test_number=25;
handles.database='TILDA';
handles.sub=2;
pause(0.01);
guidata(hObject, handles);


% --------------------------------------------------------------------
function common_defect_Callback(hObject, eventdata, handles)
% hObject    handle to common_defect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Initialization(hObject, eventdata, handles);
[train_fname,pname]=uigetfile('.\common_defect\txt\*_train.txt','选择训练集');
if isequal(train_fname,0) | isequal(pname,0)
   msgbox('用户取消！');
   return;
else
   Initialization(hObject, eventdata, handles);
   fd_classification_enable(hObject, eventdata, handles);
end
train_names=ReadTxt([pname,train_fname]);
i=findstr(train_fname,'_');
test_fname=sprintf('%s_test.txt',train_fname(1:(i-1)));
test_names=ReadTxt([pname,test_fname]);
pathname='.\common_defect\';
handles.train_names=train_names;
handles.test_names=test_names;
handles.Image_path=pathname;
handles.class_Num=11;
handles.every_train_number=10;
handles.every_test_number=10;
handles.database='common_defect';
handles.sub=3;
pause(0.01);
guidata(hObject, handles);



function fd_classification_enable(hObject, eventdata, handles)
 set(handles.fd_WLDPNG, 'Enable', 'on');
 set(handles.df_WLDPNG_AR, 'Enable', 'on');
 set(handles.df_WLDPNG_NAR, 'Enable', 'on');
 guidata(hObject, handles);
