function varargout = Practica_Final(varargin)
clc;
% PRACTICA_FINAL MATLAB code for Practica_Final.fig
%      PRACTICA_FINAL, by itself, creates a new PRACTICA_FINAL or raises the existing
%      singleton*.
%
%      H = PRACTICA_FINAL returns the handle to a new PRACTICA_FINAL or the handle to
%      the existing singleton*.
%
%      PRACTICA_FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACTICA_FINAL.M with the given input arguments.
%
%      PRACTICA_FINAL('Property','Value',...) creates a new PRACTICA_FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Practica_Final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Practica_Final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Practica_Final

% Last Modified by GUIDE v2.5 18-Nov-2020 22:12:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Practica_Final_OpeningFcn, ...
                   'gui_OutputFcn',  @Practica_Final_OutputFcn, ...
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

% --- Executes just before Practica_Final is made visible.
function Practica_Final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Practica_Final (see VARARGIN)

% Choose default command line output for Practica_Final
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Practica_Final wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Practica_Final_OutputFcn(hObject, eventdata, handles) 
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
[filename, pathname]=uigetfile('*.jpg;*.png;*.gif;*.bmp');
if isequal(filename,0) || isequal(pathname,0)
    disp('User pressed cancel')
else
    filename=strcat(pathname,filename);
    a=imread(filename);
    i=imhist(a);
    [M,N,P]=size(a);
    axes(handles.axes1);
    imshow(a);
    axes(handles.axes2);
    plot(i);
    handles.a = a;
    guidata(hObject, handles);
    set(handles.M1, 'String', N);
    set(handles.N1, 'String', M);
    set(handles.P1, 'String', P);
end

% --- Executes on button press in AmpS.
function AmpS_Callback(hObject, eventdata, handles)
% hObject    handle to AmpS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
b=imresize(a,2.0);
[M,N,P]=size(b);
axes(handles.axes2);
imshow(b);
set(handles.M2, 'String', N);
set(handles.N2, 'String', M);
set(handles.P2, 'String', P);
a=imresize(a,2.0);
handles.a = a;
handles.b = b;
guidata(hObject, handles);

% --- Executes on button press in RedS.
function RedS_Callback(hObject, eventdata, handles)
% hObject    handle to RedS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
b=imresize(a,0.5);
[M,N,P]=size(b);
axes(handles.axes2);
imshow(b);
set(handles.M2, 'String', N);
set(handles.N2, 'String', M);
set(handles.P2, 'String', P);
a=b;
handles.a = a;
handles.b = b;
guidata(hObject, handles);

% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=get(hObject,'String');
switch I
    case 'Nearest'
        L='1';
    case 'Bilinear'
        L='2';
    case 'Bicubic'
        L='3';
end
handles.L = L;
guidata(hObject, handles);

% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes when selected object is changed in uibuttongroup3.
function uibuttongroup3_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup3 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=get(hObject,'String');
switch I
    case 'Negativo'
        J='1';
    case 'Umbrales'
        J='2';
    case 'Binario'
        J='3';
    case 'B&N'
        J='4';
end
handles.J = J;
guidata(hObject, handles);

% --- Executes when selected object is changed in uibuttongroup5.
function uibuttongroup5_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup5 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=get(hObject,'String');
switch I
    case 'N_4P'
        N='1';
    case 'N_DP'
        N='2';
    case 'N_8P'
        N='3';
end
handles.N = N;
guidata(hObject, handles);

% --- Executes when selected object is changed in uibuttongroup6.
function uibuttongroup6_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup6 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=get(hObject,'String');
switch I
    case 'Euclidiana'
        DT='1';
    case 'City-Block'
        DT='2';
    case 'Chessboard'
        DT='3';
end
handles.DT = DT;
guidata(hObject, handles);

% --- Executes on button press in AmpI.
function AmpI_Callback(hObject, eventdata, handles)
% hObject    handle to AmpI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
L=handles.L;
if L=='1'
    b=imresize(a, 2.0, 'nearest');
    [M,N,P]=size(b);
    axes(handles.axes2);
    imshow(b);
    set(handles.M2, 'String', N);
    set(handles.N2, 'String', M);
    set(handles.P2, 'String', P);
    a=b;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
elseif L=='2'
    b=imresize(a, 2.0, 'bilinear');
    [M,N,P]=size(b);
    axes(handles.axes2);
    imshow(b);
    set(handles.M2, 'String', N);
    set(handles.N2, 'String', M);
    set(handles.P2, 'String', P);
    a=b;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
elseif L=='3'
    b=imresize(a, 2.0, 'bicubic');
    [M,N,P]=size(b);
    axes(handles.axes2);
    imshow(b);
    set(handles.M2, 'String', N);
    set(handles.N2, 'String', M);
    set(handles.P2, 'String', P);
    a=b;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
end

% --- Executes on button press in RedI.
function RedI_Callback(hObject, eventdata, handles)
% hObject    handle to RedI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
L=handles.L;
if L=='1'
    b=imresize(a, 0.1, 'nearest');
    [M,N,P]=size(b);
    axes(handles.axes2);
    imshow(b);
    set(handles.M2, 'String', N);
    set(handles.N2, 'String', M);
    set(handles.P2, 'String', P);
    a=b;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
elseif L=='2'
    b=imresize(a, 0.1, 'bilinear');
    [M,N,P]=size(b);
    axes(handles.axes2);
    imshow(b);
    set(handles.M2, 'String', N);
    set(handles.N2, 'String', M);
    set(handles.P2, 'String', P);
    a=b;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
elseif L=='3'
    b=imresize(a, 0.1, 'bicubic');
    [M,N,P]=size(b);
    axes(handles.axes2);
    imshow(b);
    set(handles.M2, 'String', N);
    set(handles.N2, 'String', M);
    set(handles.P2, 'String', P);
    a=b;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
end


% --- Executes on button press in Invert.
function Invert_Callback(hObject, eventdata, handles)
% hObject    handle to Invert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
b=imrotate(a,180);
[M,N,P]=size(b);
axes(handles.axes2);
imshow(b);
set(handles.M2, 'String', N);
set(handles.N2, 'String', M);
set(handles.P2, 'String', P);
a=imrotate(a,180);
handles.a = a;
handles.b = b;
guidata(hObject, handles);

% --- Executes on button press in Reflect.
function Reflect_Callback(hObject, eventdata, handles)
% hObject    handle to Reflect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
b=fliplr(a);
[M,N,P]=size(b);
axes(handles.axes2);
imshow(b);
set(handles.M2, 'String', N);
set(handles.N2, 'String', M);
set(handles.P2, 'String', P);
a=fliplr(a);
handles.a=a;
handles.b = b;
guidata(hObject, handles);

% --- Executes on button press in Rotate.
function Rotate_Callback(hObject, eventdata, handles)
% hObject    handle to Rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
b=imrotate(a,90);
[M,N,P]=size(b);
axes(handles.axes2);
imshow(b);
set(handles.M2, 'String', N);
set(handles.N2, 'String', M);
set(handles.P2, 'String', P);
a=imrotate(a,90);
handles.a = a;
handles.b = b;
guidata(hObject, handles);


% --- Executes on selection change in FormL.
function FormL_Callback(hObject, eventdata, handles)
% hObject    handle to FormL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=cellstr(get(hObject,'String'));
popChoice = I{get(hObject,'Value')};
if (strcmp(popChoice,'BMP'))
    F = 1;
elseif (strcmp(popChoice,'GIF'))
    F = 2;
elseif (strcmp(popChoice,'JPG'))
    F = 3;
elseif (strcmp(popChoice,'PNG'))
    F = 4;
elseif (strcmp(popChoice,'TIFF'))
    F = 5;
end
handles.F = F;
guidata(hObject, handles);


% --- Executes on button press in Format.
function Format_Callback(hObject, eventdata, handles)
% hObject    handle to Format (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%n=handles.N;
b=handles.a;
f=handles.F;
if f==1
    imwrite(b,'Formato.bmp');
elseif f==2
    imwrite(b,'Formato.gif');
elseif f==3
    imwrite(b,'Formato.jpg');
elseif f==4
    imwrite(b,'Formato.png');
elseif f==5
    imwrite(b,'Formato.tiff');
end
warndlg('El formato de la imagen fue cambiado exitosamente','Formato cambiado');

function FormL_CreateFcn(hObject, eventdata, handles)

% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b=handles.b;
imwrite(b,'nuevo.jpg');
warndlg('La imagen procesada ha sido guardada exitosamente','Guardado exitoso');


% --- Executes on button press in Color.
function Color_Callback(hObject, eventdata, handles)
% hObject    handle to Color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
J=handles.J;
if J=='1'
    b=handles.a;
    b=255-b;
    [M,N,P]=size(b);
    axes(handles.axes2);
    imshow(b);
    set(handles.M2, 'String', N);
    set(handles.N2, 'String', M);
    set(handles.P2, 'String', P);
    a=255-a;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
elseif J=='2'
    a=handles.a;
    b = imadjust(a);
    [M,N,P]=size(b);
    axes(handles.axes2);
    imshow(b);
    set(handles.M2, 'String', N);
    set(handles.N2, 'String', M);
    set(handles.P2, 'String', P);
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
elseif J=='3'
    a=handles.a;
    b= im2bw(a, 0.46);
    [M,N,P]=size(b);
    axes(handles.axes2);
    set(handles.M2, 'String', N);
    set(handles.N2, 'String', M);
    set(handles.P2, 'String', P);
    imshow(b);
    a=b;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
elseif J=='4'
    a=handles.a;
    b=rgb2gray(a);
    axes(handles.axes2);
    [M,N,P]=size(b);
    set(handles.M2, 'String', N);
    set(handles.N2, 'String', M);
    set(handles.P2, 'String', P);
    imshow(b);
    a=b;
    handles.a = a;
    handles.b = b;
    guidata(hObject, handles);
end


% --- Executes on button press in Crop.
function Crop_Callback(hObject, eventdata, handles)
% hObject    handle to Crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
b= imcrop(a);
[M,N]=size(b);
axes(handles.axes2);
set(handles.M2, 'String', N);
set(handles.N2, 'String', M);
imshow(b);
a=b;
handles.a = a;
handles.b = b;
guidata(hObject, handles);


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%disp('axes1_ButtonDownFcn');

% --- Executes on button press in N4.
function N4_Callback(hObject, eventdata, handles)
% hObject    handle to N4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ND.
function ND_Callback(hObject, eventdata, handles)
% hObject    handle to ND (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in N8.
function N8_Callback(hObject, eventdata, handles)
% hObject    handle to N8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in Horizontal.
function Horizontal_Callback(hObject, eventdata, handles)
% hObject    handle to Horizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=cellstr(get(hObject,'String'));
popChoice = I{get(hObject,'Value')};
if (strcmp(popChoice,'Horizontal'))
    H = 1;
elseif (strcmp(popChoice,'Izquierda'))
    H = 2;
elseif (strcmp(popChoice,'Derecha'))
    H = 3;
end
handles.H = H;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Horizontal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Horizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Vertical.
function Vertical_Callback(hObject, eventdata, handles)
% hObject    handle to Vertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Vertical contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Vertical
I=cellstr(get(hObject,'String'));
popChoice = I{get(hObject,'Value')};
if (strcmp(popChoice,'Vertical'))
    V = 1;
elseif (strcmp(popChoice,'Arriba'))
    V = 2;
elseif (strcmp(popChoice,'Abajo'))
    V = 3;
end
handles.V = V;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function Vertical_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Pixel.
function Pixel_Callback(hObject, eventdata, handles)
% hObject    handle to Pixel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
H=handles.H;
V=handles.V;
N=handles.N;
switch N
    case '1'
        if H==3 && V==1
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X+1;
            Y1=Y;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==2 && V==1
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X-1;
            Y1=Y;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==1 && V==2
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X;
            Y1=Y-1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==1 && V==3
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X;
            Y1=Y+1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        else
            warndlg('Fuera de los parámetros del tipo de vecindad','Error');
        end
    case '2'
        if H==2 && V==2
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X-1;
            Y1=Y-1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==2 && V==3
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X-1;
            Y1=Y+1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==3 && V==2
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X+1;
            Y1=Y-1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==3 && V==3
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X+1;
            Y1=Y+1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        else
            warndlg('Fuera de los parámetros del tipo de vecindad','Error');
        end
    case '3'
        if H==2 && V==2
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X-1;
            Y1=Y-1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==2 && V==3
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X-1;
            Y1=Y+1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==3 && V==2
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X+1;
            Y1=Y-1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==3 && V==3
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X+1;
            Y1=Y+1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==3 && V==1
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X+1;
            Y1=Y;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==2 && V==1
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X-1;
            Y1=Y;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==1 && V==2
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X;
            Y1=Y-1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        elseif H==1 && V==3
            [X,Y,P]=impixel(a);
            set(handles.TX, 'String', X);
            set(handles.TY, 'String', Y);
            set(handles.TP, 'String', P);
            X1=X;
            Y1=Y+1;
            P1=impixel(a,X1,Y1);
            set(handles.TX1, 'String', X1);
            set(handles.TY1, 'String', Y1);
            set(handles.TP1, 'String', P1);
        else
            warndlg('Fuera de los parámetros del tipo de vecindad','Error');
        end
    otherwise
        warndlg('Fuera de los parámetros del tipo de vecindad','Error');
end
%handles.a = a;

% --- Executes on button press in DA.
function DA_Callback(hObject, eventdata, handles)
% hObject    handle to DA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
[X,Y,P]=impixel(a);
handles.X = X;
handles.Y = Y;
handles.P = P;
guidata(hObject, handles);
set(handles.TPAX, 'String', X);
set(handles.TPAY, 'String', Y);
set(handles.TPAP, 'String', P);

% --- Executes on button press in DB.
function DB_Callback(hObject, eventdata, handles)
% hObject    handle to DB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
[X1,Y1,P1]=impixel(a);
handles.X1 = X1;
handles.Y1 = Y1;
handles.P1 = P1;
guidata(hObject, handles);
set(handles.TPBX, 'String', X1);
set(handles.TPBY, 'String', Y1);
set(handles.TPBP, 'String', P1);

% --- Executes on button press in Distancia.
function Distancia_Callback(hObject, eventdata, handles)
% hObject    handle to Distancia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
X=handles.X;
X1=handles.X1;
Y=handles.Y;
Y1=handles.Y1;
DT=handles.DT;
switch DT
    case '1'
        Dist=sqrt(((X-X1)^2)+((Y-Y1)^2));
        set(handles.TDist, 'String', Dist);
    case '2'
        Dist=abs(X-X1)+abs(Y-Y1);
        set(handles.TDist, 'String', Dist);
    case '3'
        Dist=max(abs(X-X1),abs(Y-Y1));
        set(handles.TDist, 'String', Dist);
end

% --- Executes on button press in Trayectoria.
function Trayectoria_Callback(hObject, eventdata, handles)
% hObject    handle to Trayectoria (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
X=handles.X;
X1=handles.X1;
Y=handles.Y;
Y1=handles.Y1;
P=handles.P;
P1=handles.P1;
PX=[X X1];
PY=[Y Y1];
plot(PX,PY);
xlabel('x');
ylabel('y');
PD=abs(P-P1);
if PD<=50
    set(handles.TDeter, 'String', 'Región');
else
    set(handles.TDeter, 'String', 'Contorno');
end
