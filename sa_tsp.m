function varargout = sa_tsp(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sa_tsp_OpeningFcn, ...
                   'gui_OutputFcn',  @sa_tsp_OutputFcn, ...
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
function sa_tsp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sa_tsp (see VARARGIN)


handles.output = hObject;


guidata(hObject, handles);



function varargout = sa_tsp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function initial_temperature_Callback(hObject, eventdata, handles)
% hObject    handle to initial_temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initial_temperature as text
%        str2double(get(hObject,'String')) returns contents of initial_temperature as a double
s = str2double(get(hObject,'String'));
if isnan(s)
    set(hObject,'String','1000')
end
if s < 0 | s > 10000
    set(hObject,'String','1000')
end


function initial_temperature_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initial_temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function maximum_iterations_Callback(hObject, eventdata, handles)
% hObject    handle to maximum_iterations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maximum_iterations as text
%        str2double(get(hObject,'String')) returns contents of maximum_iterations as a double
s = str2double(get(hObject,'String'));
if isnan(s)
    set(hObject,'String','10000')
end
if s < 1000 | s > 1000000
    set(hObject,'String','10000')
end


function maximum_iterations_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maximum_iterations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cooling_rate_Callback(hObject, eventdata, handles)
% hObject    handle to cooling_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
s = sprintf('Cooling Rate : %0.3f',get(hObject,'Value'));
set(handles.cooling_rate_display, 'String', s);

function cooling_rate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cooling_rate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function cities_to_swap_Callback(hObject, eventdata, handles)
% hObject    handle to cities_to_swap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
s = sprintf('Cities to swap : %d',get(hObject,'Value'));
set(handles.cities_to_swap_display,'String',s)


function cities_to_swap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cities_to_swap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end





function cooling_rate_display_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cooling_rate_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called





function cities_to_swap_display_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cities_to_swap_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = get(handles.select_data_set, 'Value');
switch selection
    case 2
        ulysses16;
    case 3
        ulysses22;
    case 4
        berlin52;
end
if selection ~= 1
    set(handles.initial_temperature, 'Enable', 'Off')
    set(handles.final_temperature, 'Enable', 'Off')
    set(handles.cooling_rate, 'Enable', 'Off')
    set(handles.maximum_iterations, 'Enable', 'Off')
    set(handles.cities_to_swap, 'Enable', 'Off')
    set(handles.start_button, 'Enable', 'Off')
    set(handles.select_data_set, 'Enable', 'Off')
    cities = load ('cities.mat');
    cities = cities.cities;
    simulatedannealing(cities,...
        str2double(get(handles.initial_temperature,'String')),...
        str2double(get(handles.final_temperature,'String')),...
        get(handles.cooling_rate,'Value'),...
        str2double(get(handles.maximum_iterations,'String')),...
        get(handles.cities_to_swap,'Value'));
    set(handles.initial_temperature, 'Enable', 'On')
    set(handles.final_temperature, 'Enable', 'On')
    set(handles.cooling_rate, 'Enable', 'On')
    set(handles.maximum_iterations, 'Enable', 'On')
    set(handles.cities_to_swap, 'Enable', 'On')
    set(handles.start_button, 'Enable', 'On')
    set(handles.select_data_set, 'Enable', 'On')
end

function select_data_set_Callback(hObject, eventdata, handles)
% hObject    handle to select_data_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns select_data_set contents as cell array
%        contents{get(hObject,'Value')} returns selected item from select_data_set


function select_data_set_CreateFcn(hObject, eventdata, handles)
% hObject    handle to select_data_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function final_temperature_Callback(hObject, eventdata, handles)
% hObject    handle to final_temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of final_temperature as text
%        str2double(get(hObject,'String')) returns contents of final_temperature as a double
s = str2double(get(hObject,'String'));
if isnan(s)
    set(hObject,'String','1000')
end
if s < 0 | s > 10000
    set(hObject,'String','1000')
end

function final_temperature_CreateFcn(hObject, eventdata, handles)
% hObject    handle to final_temperature (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function cooling_rate_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to cooling_rate (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


