function varargout = Transformada(varargin)
clc;
% TRANSFORMADA MATLAB code for Transformada.fig
%      TRANSFORMADA, by itself, creates a new TRANSFORMADA or raises the existing
%      singleton*.
%
%      H = TRANSFORMADA returns the handle to a new TRANSFORMADA or the handle to
%      the existing singleton*.
%
%      TRANSFORMADA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSFORMADA.M with the given input arguments.
%
%      TRANSFORMADA('Property','Value',...) creates a new TRANSFORMADA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Transformada_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Transformada_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Transformada

% Last Modified by GUIDE v2.5 26-Jan-2021 14:58:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Transformada_OpeningFcn, ...
                   'gui_OutputFcn',  @Transformada_OutputFcn, ...
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


% --- Executes just before Transformada is made visible.
function Transformada_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Transformada (see VARARGIN)
a=1;
axes(handles.axes1);
imshow(a);

b=1;
axes(handles.axes2);
imshow(b);

c=1;
axes(handles.axes3);
imshow(c);

d=1;
axes(handles.axes4);
imshow(d);


c=1;
axes(handles.axes5);
imshow(c);

d=1;
axes(handles.axes6);
imshow(d);
% Choose default command line output for Transformada
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Transformada wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Transformada_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in BtnAbrir.
function BtnAbrir_Callback(hObject, eventdata, handles)
% hObject    handle to BtnAbrir (see GCBO)
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


% --- Executes on button press in BtnFiltro.
function BtnFiltro_Callback(hObject, eventdata, handles)
% hObject    handle to BtnFiltro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
H=handles.H;
ni=get(handles.EditInt,'string');
ni=str2num(ni);
f=a;
h1=imhist(f);
axes(handles.axes5);
stem(h1,'|'); xlim([-50 300]);

PQ = paddedsize(size(f)); 

[U, V] = dftuv(PQ(1), PQ(2)); 
D = hypot(U, V);
DO = ni*PQ(1);
F = fft2(f, PQ(1), PQ(2));
F2=fftshift(F);
S=abs(F2);
S2=log(1+S);
axes(handles.axes4);
imshow(S2, []);
switch H
    case 1
        H=single(D<=DO);
    case 2
        %Filtro Pasa Bajas Gaussiano
        H = exp( - (D.^2)/(2*(DO^2))); 
end

G = H.*F;
g = real(ifft2(G)); 
g = g(1:size(f, 1), 1:size(f, 2)); 
axes(handles.axes2);
imshow(g);

h2=imhist(g);
axes(handles.axes6);
stem(h2,'|'); xlim([-50 300]);

%g2=fftshift(G);

axes(handles.axes3);
imshow(fftshift(H), []);



% --- Executes on button press in BtnFiltro2.
function BtnFiltro2_Callback(hObject, eventdata, handles)
% hObject    handle to BtnFiltro2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=handles.a;
H=handles.H;
ni=get(handles.EditInt,'string');
ni=str2num(ni);
f=a;
h1=imhist(f);
axes(handles.axes5);
stem(h1,'|'); xlim([-50 300]);

PQ = paddedsize(size(f)); 

[U, V] = dftuv(PQ(1), PQ(2)); 
D = hypot(U, V);
DO = ni*PQ(1);
F = fft2(f, PQ(1), PQ(2));
F2=fftshift(F);
S=abs(F2);
S2=log(1+S);
axes(handles.axes4);
imshow(S2, []);
switch H
    case 1
        H=single(D>DO);
    case 2
        %Filtro Pasa Altas Gaussiano
        H = 1-(exp( - (D.^2)/(2*(DO^2))));
end


G = H.*F;
g = real(ifft2(G)); 
g = g(1:size(f, 1), 1:size(f, 2)); 
axes(handles.axes2);
imshow(g);

h2=imhist(g);
axes(handles.axes6);
stem(h2,'|'); xlim([-50 300]);

%g2=fftshift(G);
axes(handles.axes3);
imshow(fftshift(H), []);



% --- Executes on button press in BtnClean.
function BtnClean_Callback(hObject, eventdata, handles)
% hObject    handle to BtnClean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cle=handles.cle;
a=cle;
c=1;
axes(handles.axes3);
imshow(c);
b=1;
axes(handles.axes2);
imshow(b);
d=1;
axes(handles.axes4);
imshow(d);
handles.a = a;
guidata(hObject, handles);
axes(handles.axes5);
imshow(b);
d=1;
axes(handles.axes6);
imshow(d);
handles.a = a;
guidata(hObject, handles);


% --- Executes on selection change in MenuElegir.
function MenuElegir_Callback(hObject, eventdata, handles)
% hObject    handle to MenuElegir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns MenuElegir contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MenuElegir
I=cellstr(get(hObject,'String'));
popChoice = I{get(hObject,'Value')};
if (strcmp(popChoice,'Ideal'))
    H = 1;
elseif (strcmp(popChoice,'Gaussiano'))
    H = 2;
end
handles.H = H;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function MenuElegir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MenuElegir (see GCBO)
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
