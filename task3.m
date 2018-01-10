function varargout = task3(varargin)
% TASK3 MATLAB code for task3.fig
%      TASK3, by itself, creates a new TASK3 or raises the existing
%      singleton*.
%
%      H = TASK3 returns the handle to a new TASK3 or the handle to
%      the existing singleton*.
%
%      TASK3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK3.M with the given input arguments.
%
%      TASK3('Property','Value',...) creates a new TASK3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before task3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to task3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help task3

% Last Modified by GUIDE v2.5 02-May-2017 23:05:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;

gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @task3_OpeningFcn, ...
                   'gui_OutputFcn',  @task3_OutputFcn, ...
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


% --- Executes just before task3 is made visible.
function task3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to task3 (see VARARGIN)

% Choose default command line output for task3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes task3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = task3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function sizeEdit_Callback(hObject, eventdata, handles)
% hObject    handle to sizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sizeEdit as text
%        str2double(get(hObject,'String')) returns contents of sizeEdit as a double


% --- Executes during object creation, after setting all properties.
function sizeEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sizeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in phantom1.
function phantom1_Callback(hObject, eventdata, handles)
% hObject    handle to phantom1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns phantom1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from phantom1

% --- Executes during object creation, after setting all properties.
function phantom1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phantom1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start1.
function start1_Callback(hObject, eventdata, handles)
% hObject    handle to start1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic
Size = str2double(get(handles.sizeEdit,'String'));
strp = get(handles.popupmenu7, 'String');
valp = get(handles.popupmenu7,'Value');
switch strp{valp};%%Preparation
    case '--'
        prep=0;
    case 'T1prep'
        prep=1;
    case 'T2prep'
        prep=2;
    case 'Tagging'
        prep=3;
end
strw = get(handles.popupmenu5, 'String');
valw = get(handles.popupmenu5,'Value');
str = get(handles.popupmenu3, 'String');
val = get(handles.popupmenu3,'Value');
switch strw{valw};%%WEIGHT
    case 'T1'
        switch str{val};%SEQUENCE
            case 'GE' 
                sequence = xml2struct('GE.xml');
                axes(handles.seqimage1)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on 
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-3) - heaviside(x-5)-4;
                 plot(x,z,'Color','b')%Gpe
                 z= heaviside(x-5) - heaviside(x-7)-6;
                 plot(x,z,'Color','k')%Gfe
                 e=(15*sinc(x-2)).*(heaviside(x-6) - heaviside(x-7))-8;
                 plot(x,e,'Color','r') %Ro
                 hold off
            case 'FSE' 
                sequence = xml2struct('FSE.xml');
                axes(handles.seqimage1)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on 
                 y=(15*sinc(x-1)).*(heaviside(x-3) - heaviside(x-4));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-3) - heaviside(x-4)-2;
                 plot(x,z,'Color','g')%Gss
                 y=(40*sinc(x-1)).*(heaviside(x-7) - heaviside(x-8));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-7) - heaviside(x-8)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-2)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-6)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-3) - heaviside(x-4)-4;
                 plot(x,z,'Color','b')%Gpe
                 z= heaviside(x-7) - heaviside(x-8)+4;
                 plot(x,-z,'Color','b')%Gpe
                 e=(-15*sinc(x-2)).*(heaviside(x-5) - heaviside(x-6))-8;
                 plot(x,e,'Color','r')%Ro
                 hold off
            case 'SE' 
                sequence = xml2struct('SE.xml');
                axes(handles.seqimage1)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on 
                 y=(15*sinc(x-1)).*(heaviside(x-3) - heaviside(x-4));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-3) - heaviside(x-4)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-2)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-7)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-3) - heaviside(x-5)-4;
                 plot(x,z,'Color','b')%Gpe
                 e=(15*sinc(x-2)).*(heaviside(x-6) - heaviside(x-7))-8;
                 plot(x,e,'Color','r')%Ro 
                 hold off
            case 'SSFP' 
                sequence = xml2struct('SSFP.xml');
                axes(handles.seqimage1)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on
                 y=(20*sinc(x-1)).*(heaviside(x-7) - heaviside(x-8));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-7) - heaviside(x-8)+2;
                 plot(x,-z,'Color','g')%Gss
                 z= heaviside(x-2) - heaviside(x-3)-4;
                 plot(x,z,'Color','b')%Gpe
                 z= heaviside(x-6) - heaviside(x-7)+4;
                 plot(x,-z,'Color','b')%Gpe
                 z= heaviside(x-3) - heaviside(x-4)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-6)+6;
                 plot(x,-z,'Color','k')%Gfe
                 e=(5*sinc(x-2)).*(heaviside(x-3) - heaviside(x-4))+8;
                 plot(x,-e,'Color','r') %Ro
                 hold off
        end
        [img]=main(1,Size,sequence,prep);
        axes(handles.image1)
        img = flip(img,2);
        img = flip(img,1);
        imshow(img,[]);
    case 'T2'
        switch str{val};
            case 'GE' 
                sequence = xml2struct('GE.xml');
                axes(handles.seqimage1)
                 x=0:0.1:10;
                  y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                  plot(x,y,'Color','r')
                 hold on 
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')
                 z= heaviside(x-3) - heaviside(x-5)-4;
                  plot(x,z,'Color','b')
                 z= heaviside(x-5) - heaviside(x-7)-6;
                 plot(x,z,'Color','k')
                 e=(15*sinc(x-2)).*(heaviside(x-6) - heaviside(x-7))-8;
                 plot(x,e,'Color','r') 
                 hold off
            case 'FSE' 
                sequence = xml2struct('FSE.xml');
                axes(handles.seqimage1)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on 
                 y=(15*sinc(x-1)).*(heaviside(x-3) - heaviside(x-4));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-3) - heaviside(x-4)-2;
                 plot(x,z,'Color','g')%Gss
                 y=(40*sinc(x-1)).*(heaviside(x-7) - heaviside(x-8));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-7) - heaviside(x-8)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-2)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-6)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-3) - heaviside(x-4)-4;
                 plot(x,z,'Color','b')%Gpe
                 z= heaviside(x-7) - heaviside(x-8)+4;
                 plot(x,-z,'Color','b')%Gpe
                 e=(-15*sinc(x-2)).*(heaviside(x-5) - heaviside(x-6))-8;
                 plot(x,e,'Color','r')%Ro 
                hold off
            case 'SE' 
                sequence = xml2struct('SE.xml');
                axes(handles.seqimage1)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on 
                 y=(15*sinc(x-1)).*(heaviside(x-3) - heaviside(x-4));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-3) - heaviside(x-4)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-2)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-7)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-3) - heaviside(x-5)-4;
                 plot(x,z,'Color','b')%Gpe
                 e=(15*sinc(x-2)).*(heaviside(x-6) - heaviside(x-7))-8;
                 plot(x,e,'Color','r')%Ro 
                 hold off
            case 'SSFP' 
                sequence = xml2struct('SSFP.xml');
                axes(handles.seqimage1)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on
                 y=(20*sinc(x-1)).*(heaviside(x-7) - heaviside(x-8));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-7) - heaviside(x-8)+2;
                 plot(x,-z,'Color','g')%Gss
                 z= heaviside(x-2) - heaviside(x-3)-4;
                 plot(x,z,'Color','b')%Gpe
                 z= heaviside(x-6) - heaviside(x-7)+4;
                 plot(x,-z,'Color','b')%Gpe
                 z= heaviside(x-3) - heaviside(x-4)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-6)+6;
                 plot(x,-z,'Color','k')%Gfe
                 e=(5*sinc(x-2)).*(heaviside(x-3) - heaviside(x-4))+8;
                 plot(x,-e,'Color','r') %Ro
                 hold off
        end
        [img]=main(2,Size,sequence,prep);
        axes(handles.image1)
        img = flip(img,2);
        img = flip(img,1);
        imshow(img,[]);
end
toc
% --- Executes on button press in browse1.
function browse1_Callback(hObject, eventdata, handles)
% hObject    handle to browse1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in browse2.
function browse2_Callback(hObject, eventdata, handles)
% hObject    handle to browse2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in start2.
function start2_Callback(hObject, eventdata, handles)
% hObject    handle to start2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tic
Size = str2double(get(handles.sizeEdit,'String'));
strp = get(handles.popupmenu8, 'String');
valp = get(handles.popupmenu8,'Value');
switch strp{valp};%%Preparation
    case '--'
        prep=0;
    case 'T1prep'
        prep=1;
    case 'T2prep'
        prep=2;
    case 'Tagging'
        prep=3;
end
strw = get(handles.popupmenu6, 'String');
valw = get(handles.popupmenu6,'Value');
str = get(handles.popupmenu4, 'String');
val = get(handles.popupmenu4,'Value');
switch strw{valw};%%WEIGHT
    case 'T1'
        switch str{val};%SEQUENCE
            case 'GE' 
                sequence = xml2struct('GE.xml');
                axes(handles.seqimage2)
                 x=0:0.1:10;
                  y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                  plot(x,y,'Color','r')
                 hold on 
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')
                 z= heaviside(x-3) - heaviside(x-5)-4;
                 plot(x,z,'Color','b')
                 z= heaviside(x-5) - heaviside(x-7)-6;
                 plot(x,z,'Color','k')
                 e=(15*sinc(x-2)).*(heaviside(x-6) - heaviside(x-7))-8;
                 plot(x,e,'Color','r') 
                 hold off
            case 'FSE' 
                sequence = xml2struct('FSE.xml');
                axes(handles.seqimage2)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on 
                 y=(15*sinc(x-1)).*(heaviside(x-3) - heaviside(x-4));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-3) - heaviside(x-4)-2;
                 plot(x,z,'Color','g')%Gss
                 y=(40*sinc(x-1)).*(heaviside(x-7) - heaviside(x-8));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-7) - heaviside(x-8)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-2)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-6)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-3) - heaviside(x-4)-4;
                 plot(x,z,'Color','b')%Gpe
                 z= heaviside(x-7) - heaviside(x-8)+4;
                 plot(x,-z,'Color','b')%Gpe
                 e=(-15*sinc(x-2)).*(heaviside(x-5) - heaviside(x-6))-8;
                 plot(x,e,'Color','r')%Ro
                 hold off
            case 'SE' 
                sequence = xml2struct('SE.xml');
                axes(handles.seqimage2)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on 
                 y=(15*sinc(x-1)).*(heaviside(x-3) - heaviside(x-4));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-3) - heaviside(x-4)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-2)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-7)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-3) - heaviside(x-5)-4;
                 plot(x,z,'Color','b')%Gpe
                 e=(15*sinc(x-2)).*(heaviside(x-6) - heaviside(x-7))-8;
                 plot(x,e,'Color','r')%Ro  
                 hold off
            case 'SSFP' 
                sequence = xml2struct('SSFP.xml');
                axes(handles.seqimage2)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on
                 y=(20*sinc(x-1)).*(heaviside(x-7) - heaviside(x-8));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-7) - heaviside(x-8)+2;
                 plot(x,-z,'Color','g')%Gss
                 z= heaviside(x-2) - heaviside(x-3)-4;
                 plot(x,z,'Color','b')%Gpe
                 z= heaviside(x-6) - heaviside(x-7)+4;
                 plot(x,-z,'Color','b')%Gpe
                 z= heaviside(x-3) - heaviside(x-4)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-6)+6;
                 plot(x,-z,'Color','k')%Gfe
                 e=(5*sinc(x-2)).*(heaviside(x-3) - heaviside(x-4))+8;
                 plot(x,-e,'Color','r') %Ro
                 hold off
        end 
        [img]=main(1,Size,sequence,prep);
        axes(handles.image2)
        img = flip(img,2);
        img = flip(img,1);
        imshow(img,[]);
    case 'T2'
        switch str{val};
            case 'GE' 
                sequence = xml2struct('GE.xml');
                axes(handles.seqimage2)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')
                 hold on 
                  z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                  plot(x,z,'Color','g')
                  z= heaviside(x-3) - heaviside(x-5)-4;
                  plot(x,z,'Color','b')
                  z= heaviside(x-5) - heaviside(x-7)-6;
                  plot(x,z,'Color','k')
                  e=(15*sinc(x-2)).*(heaviside(x-6) - heaviside(x-7))-8;
                  plot(x,e,'Color','r') 
                  hold off
            case 'FSE' 
                sequence = xml2struct('FSE.xml');
                axes(handles.seqimage2)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on 
                 y=(15*sinc(x-1)).*(heaviside(x-3) - heaviside(x-4));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-3) - heaviside(x-4)-2;
                 plot(x,z,'Color','g')%Gss
                 y=(40*sinc(x-1)).*(heaviside(x-7) - heaviside(x-8));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-7) - heaviside(x-8)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-2)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-6)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-3) - heaviside(x-4)-4;
                 plot(x,z,'Color','b')%Gpe
                 z= heaviside(x-7) - heaviside(x-8)+4;
                 plot(x,-z,'Color','b')%Gpe
                 e=(-15*sinc(x-2)).*(heaviside(x-5) - heaviside(x-6))-8;
                 plot(x,e,'Color','r')%Ro 
                 hold off
            case 'SE' 
                sequence = xml2struct('SE.xml');
                axes(handles.seqimage2)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on 
                 y=(15*sinc(x-1)).*(heaviside(x-3) - heaviside(x-4));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-3) - heaviside(x-4)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-0.5) - heaviside(x-2)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-7)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-3) - heaviside(x-5)-4;
                 plot(x,z,'Color','b')%Gpe
                 e=(15*sinc(x-2)).*(heaviside(x-6) - heaviside(x-7))-8;
                 plot(x,e,'Color','r')%Ro
                 hold off
            case 'SSFP' 
                sequence = xml2struct('SSFP.xml');
                axes(handles.seqimage2)
                 x=0:0.1:10;
                 y=sinc(x-1).*(heaviside(x-0.5) - heaviside(x-1.5));
                 plot(x,y,'Color','r')%RF
                 hold on
                 y=(20*sinc(x-1)).*(heaviside(x-7) - heaviside(x-8));
                 plot(x,y,'Color','r')%RF
                 z= heaviside(x-0.5) - heaviside(x-1.5)-2;
                 plot(x,z,'Color','g')%Gss
                 z= heaviside(x-7) - heaviside(x-8)+2;
                 plot(x,-z,'Color','g')%Gss
                 z= heaviside(x-2) - heaviside(x-3)-4;
                 plot(x,z,'Color','b')%Gpe
                 z= heaviside(x-6) - heaviside(x-7)+4;
                 plot(x,-z,'Color','b')%Gpe
                 z= heaviside(x-3) - heaviside(x-4)-6;
                 plot(x,z,'Color','k')%Gfe
                 z= heaviside(x-5) - heaviside(x-6)+6;
                 plot(x,-z,'Color','k')%Gfe
                 e=(5*sinc(x-2)).*(heaviside(x-3) - heaviside(x-4))+8;
                 plot(x,-e,'Color','r') %Ro
                 hold off
        end
        [img]=main(2,Size,sequence,prep);
        axes(handles.image2)
        img = flip(img,2);
        img = flip(img,1);
        imshow(img,[]);
end
toc
% --- Executes on selection change in phantom2.
function phantom2_Callback(hObject, eventdata, handles)
% hObject    handle to phantom2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns phantom2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from phantom2


% --- Executes during object creation, after setting all properties.
function phantom2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phantom2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
% str = get(hObject, 'String');
% val = get(hObject,'Value');
% % Set current data to the selected data set.
% switch str{val};
% case 'GE' % User selects peaks.
% sequence = xml2struct('GE.xml');
% case 'FSE' % User selects membrane.
% sequence = xml2struct('GE.xml');
% end

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
