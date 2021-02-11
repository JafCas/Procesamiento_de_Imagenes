function varargout = Proyecto_2(varargin)
clc;
% PROYECTO_2 MATLAB code for Proyecto_2.fig
%      PROYECTO_2, by itself, creates a new PROYECTO_2 or raises the existing
%      singleton*.
%
%      H = PROYECTO_2 returns the handle to a new PROYECTO_2 or the handle to
%      the existing singleton*.
%
%      PROYECTO_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROYECTO_2.M with the given input arguments.
%
%      PROYECTO_2('Property','Value',...) creates a new PROYECTO_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proyecto_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proyecto_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proyecto_2

% Last Modified by GUIDE v2.5 15-Jan-2021 00:53:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proyecto_2_OpeningFcn, ...
                   'gui_OutputFcn',  @Proyecto_2_OutputFcn, ...
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

% --- Executes just before Proyecto_2 is made visible.
function Proyecto_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Proyecto_2 (see VARARGIN)

% Choose default command line output for Proyecto_2
a=1;
axes(handles.axes1);
imshow(a);
c=1;
axes(handles.axes6);
imshow(c);
b=1;
axes(handles.axes2);
imshow(b);
d=1;
axes(handles.axes4);
imshow(d);
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Proyecto_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proyecto_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Abrir.
function Abrir_Callback(hObject, eventdata, handles)
% hObject    handle to Abrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname]=uigetfile('Imagenes/*.jpg;*.png;*.gif;*.bmp');
if isequal(filename,0) || isequal(pathname,0)
    disp('User pressed cancel')
else
    filename=strcat(pathname,filename);
    a=imread(filename);
    cle=imread(filename);
    axes(handles.axes1);
    imshow(a);
    handles.a = a;
    handles.cle=cle;
    guidata(hObject, handles);
end


% --- Executes when selected object is changed in BGTransform.
function BGTransform_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in BGTransform 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=get(hObject,'String');
J='1';
handles.J = J;
switch I
    case 'Negativo'
        J='1';
    case 'Binario'
        J='2';
    case 'Exponencial'
        J='3';
end
handles.J = J;
guidata(hObject, handles);


% --- Executes on button press in BtnTransform.
function BtnTransform_Callback(hObject, eventdata, handles)
% hObject    handle to BtnTransform (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
J=handles.J;
if J=='1'
    b=handles.a;
    b=255-b;
    axes(handles.axes2);
    imshow(b);
    a=255-a;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
elseif J=='2'
    a=handles.a;
    b= imbinarize(rgb2gray(a));
    axes(handles.axes2);
    imshow(b);
    a=b;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
elseif J=='3'
    a=handles.a;
    b=double(a).^100;
    axes(handles.axes2);
    imshow(b);
    a=b;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
end


% --- Executes on button press in BtnEcualizar.
function BtnEcualizar_Callback(hObject, eventdata, handles)
% hObject    handle to BtnEcualizar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
b=histeq(a);
axes(handles.axes2);
imshow(b);
h=imhist(a);
axes(handles.axes6); stem(h,'|');
h2=imhist(b);
axes(handles.axes4); stem(h2,'|');
a=histeq(a);
handles.a = a;
handles.b = b;
guidata(hObject, handles);


% --- Executes on selection change in ListRuido.
function ListRuido_Callback(hObject, eventdata, handles)
% hObject    handle to ListRuido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns ListRuido contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ListRuido
I=cellstr(get(hObject,'String'));
popChoice = I{get(hObject,'Value')};
if (strcmp(popChoice,'Sal y Pimienta'))
    H = 1;
elseif (strcmp(popChoice,'Gaussiano'))
    H = 2;
end
handles.H = H;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function ListRuido_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ListRuido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function EditInt_Callback(hObject, eventdata, handles)
% hObject    handle to EditInt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditInt as text
%        str2double(get(hObject,'String')) returns contents of EditInt as a double


% --- Executes during object creation, after setting all properties.
function EditInt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditInt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtnFiltro.
function BtnFiltro_Callback(hObject, eventdata, handles)
% hObject    handle to BtnFiltro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N=handles.N;
a=handles.a;
switch N
    case '1'
        filtro=fspecial('average');
        b=imfilter(a,filtro);
        axes(handles.axes6);
        imshow(b);
        a=imfilter(a,filtro);
        handles.a = a;
        handles.b = b;
        guidata(hObject, handles);
    case '2'
        filtro=fspecial('disk');
        b=imfilter(a,filtro);
        axes(handles.axes6);
        imshow(b);
        a=imfilter(a,filtro);
        handles.a = a;
        handles.b = b;
        guidata(hObject, handles);
    case '3'
        b=medfilt3(a);
        axes(handles.axes6);
        imshow(b);
        a=medfilt3(a);
        handles.a = a;
        handles.b = b;
        guidata(hObject, handles);
end

% --- Executes when selected object is changed in BtnGFE.
function BtnGFE_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in BtnGFE 
% eventdata  reserved - to be defined in a future version of MATLAB
I=get(hObject,'String');
switch I
    case 'Promedio'
        N='1';
    case 'Disco'
        N='2';
    case 'Mediana'
        N='3';
end
%ni=get(handles.EditInt,'String');
%handles.ni = ni;
handles.N = N;
guidata(hObject, handles);


% --- Executes on button press in BtnRuido.
function BtnRuido_Callback(hObject, eventdata, handles)
% hObject    handle to BtnRuido (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ni=handles.ni;
H=handles.H;
a=handles.a;
ni=get(handles.EditInt,'string');
ni=str2num(ni);

switch H
    case 1
        b=imnoise(a,'salt & pepper', ni);
        axes(handles.axes2);
        imshow(b);
        a=imnoise(a,'salt & pepper', ni);
        handles.a = a;
        handles.b = b;
        guidata(hObject, handles);
    case 2
        b=imnoise(a,'gaussian', 0.03);
        axes(handles.axes2);
        imshow(b);
        a=imnoise(a,'gaussian', 0.03);
        handles.a = a;
        handles.b = b;
        guidata(hObject, handles);
end


% --- Executes on key press with focus on ListRuido and none of its controls.
function ListRuido_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ListRuido (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in BtnAperturar.
function BtnAperturar_Callback(hObject, eventdata, handles)
% hObject    handle to BtnAperturar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%H=handles.H;
a=handles.a;
%b=handles.b;
SE=strel('square',5);
SE.Neighborhood;
b=imopen(a,SE);
axes(handles.axes2);
imshow(b);
a=imopen(a,SE);
handles.a = a;
guidata(hObject, handles);


% --- Executes on button press in BtnCerradurar.
function BtnCerradurar_Callback(hObject, eventdata, handles)
% hObject    handle to BtnCerradurar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
SE=strel('square',3);
SE.Neighborhood;
b=imclose(a,SE);
axes(handles.axes2);
imshow(b);
a=imclose(a,SE);
handles.a = a;
guidata(hObject, handles);


% --- Executes on button press in BtnBordes.
function BtnBordes_Callback(hObject, eventdata, handles)
% hObject    handle to BtnBordes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
SE=strel('square',3);
SE.Neighborhood
b=imerode(a,SE);
axes(handles.axes2);
imshow(b);
c=imcomplement(b);
axes(handles.axes6);
imshow(c);
d=b&c;
axes(handles.axes4);
imshow(d);
handles.a = a;
guidata(hObject, handles);

% --- Executes on button press in BtnErosion.
function BtnErosion_Callback(hObject, eventdata, handles)
% hObject    handle to BtnErosion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
SE=strel('square',3);
SE.Neighborhood
b=imerode(a,SE);
axes(handles.axes2);
imshow(b);
a=imerode(a,SE);
handles.a = a;
guidata(hObject, handles);


% --- Executes on button press in BtnDil.
function BtnDil_Callback(hObject, eventdata, handles)
% hObject    handle to BtnDil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
SE=strel('square',3);
SE.Neighborhood
b=imdilate(a,SE);
axes(handles.axes2);
imshow(b);
a=imdilate(a,SE);
handles.a = a;
guidata(hObject, handles);

% --- Executes on button press in BtnClean.
function BtnClean_Callback(hObject, eventdata, handles)
% hObject    handle to BtnClean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cle=handles.cle;
a=cle;
c=1;
axes(handles.axes6);
imshow(c);
b=1;
axes(handles.axes2);
imshow(b);
d=1;
axes(handles.axes4);
imshow(d);
handles.a = a;
guidata(hObject, handles);
