classdef RootFinder_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        RootFinderUIFigure           matlab.ui.Figure
        FileMenu                     matlab.ui.container.Menu
        ReadMenu                     matlab.ui.container.Menu
        TabGroup                     matlab.ui.container.TabGroup
        SolverTab                    matlab.ui.container.Tab
        InputsPanel                  matlab.ui.container.Panel
        SolveButton                  matlab.ui.control.Button
        FunctionFxEditFieldLabel     matlab.ui.control.Label
        FunctionFxEditField          matlab.ui.control.EditField
        MethodDropDownLabel          matlab.ui.control.Label
        MethodDropDown               matlab.ui.control.DropDown
        MaxIterationsEditFieldLabel  matlab.ui.control.Label
        MaxIterationsEditField       matlab.ui.control.NumericEditField
        PercisionLabel               matlab.ui.control.Label
        PercisionEditField           matlab.ui.control.NumericEditField
        GxInput_Label                matlab.ui.control.Label
        GxInput                      matlab.ui.control.EditField
        XlLabel                      matlab.ui.control.Label
        XiInput                      matlab.ui.control.NumericEditField
        XlInput                      matlab.ui.control.NumericEditField
        Xi1Input                     matlab.ui.control.NumericEditField
        XuEditField_2Label           matlab.ui.control.Label
        XuInput                      matlab.ui.control.NumericEditField
        XiInput_Label                matlab.ui.control.Label
        Xi1Input_Label               matlab.ui.control.Label
        OutputsPanel                 matlab.ui.container.Panel
        UITable                      matlab.ui.control.Table
        AllIterationsLabel           matlab.ui.control.Label
        IterationsEditFieldLabel     matlab.ui.control.Label
        IterationsEditField          matlab.ui.control.NumericEditField
        RootEditFieldLabel           matlab.ui.control.Label
        RootEditField                matlab.ui.control.NumericEditField
        PercisionEditField_2Label    matlab.ui.control.Label
        PercisionEditField_2         matlab.ui.control.NumericEditField
        ExcutionTimeEditFieldLabel   matlab.ui.control.Label
        ExcutionTimeEditField        matlab.ui.control.NumericEditField
        SimulationTab                matlab.ui.container.Tab
        InputsPanel_2                matlab.ui.container.Panel
        StartButton                  matlab.ui.control.Button
        FunctionFxEditField_2Label   matlab.ui.control.Label
        FunctionFxEditField_2        matlab.ui.control.EditField
        PercisionLabel_2             matlab.ui.control.Label
        PercisionEditField_3         matlab.ui.control.NumericEditField
        XlLabel_2                    matlab.ui.control.Label
        XlInput_2                    matlab.ui.control.NumericEditField
        XuEditField_2Label_2         matlab.ui.control.Label
        XuInput_2                    matlab.ui.control.NumericEditField
        BackButton                   matlab.ui.control.Button
        NextButton                   matlab.ui.control.Button
        MethodEditFieldLabel         matlab.ui.control.Label
        MethodEditField              matlab.ui.control.EditField
        OutputsPanel_2               matlab.ui.container.Panel
        PlottingLabel                matlab.ui.control.Label
        IterationsEditField_2Label   matlab.ui.control.Label
        IterationsEditField_2        matlab.ui.control.NumericEditField
        RootEditField_2Label         matlab.ui.control.Label
        RootEditField_2              matlab.ui.control.NumericEditField
        PercisionEditField_4Label    matlab.ui.control.Label
        PercisionEditField_4         matlab.ui.control.NumericEditField
        UIAxes                       matlab.ui.control.UIAxes
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Value changed function: MethodDropDown
        function MethodDropDownValueChanged(app, event)
            value = app.MethodDropDown.Value;
            switch value
                case 'Bisection'
                    app.XlLabel.Enable = 'on';
                    app.XlInput.Enable = 'on';
                    app.XuEditField_2Label.Enable = 'on';
                    app.XuInput.Enable = 'on';
                    app.Xi1Input_Label.Enable = 'off';
                    app.Xi1Input.Enable = 'off';
                    app.XiInput_Label.Enable = 'off';
                    app.XiInput.Enable = 'off';
                    app.GxInput_Label.Enable = 'off';
                    app.GxInput.Enable = 'off';
                    app.UITable.ColumnName = {'xl', 'f(xl)', 'xu', 'f(xu)', 'xr', 'f(xr)', 'ÿa'};
                    app.UITable.ColumnFormat = {'bank', 'bank', 'bank', 'bank', 'bank', 'bank', 'bank'};
                    app.UITable.Data = {};
                case 'False Position'
                    app.XlLabel.Enable = 'on';
                    app.XlInput.Enable = 'on';
                    app.XuEditField_2Label.Enable = 'on';
                    app.XuInput.Enable = 'on';
                    app.Xi1Input_Label.Enable = 'off';
                    app.Xi1Input.Enable = 'off';
                    app.XiInput_Label.Enable = 'off';
                    app.XiInput.Enable = 'off';
                    app.GxInput_Label.Enable = 'off';
                    app.GxInput.Enable = 'off';
                    app.UITable.ColumnName = {'xl', 'f(xl)', 'xu', 'f(xu)', 'xr', 'f(xr)', 'ÿa'};
                    app.UITable.ColumnFormat = {'bank', 'bank', 'bank', 'bank', 'bank', 'bank', 'bank'};
                    app.UITable.Data = {};
                case 'Fixed Point'
                    app.XlLabel.Enable = 'off';
                    app.XlInput.Enable = 'off';
                    app.XuEditField_2Label.Enable = 'off';
                    app.XuInput.Enable = 'off';
                    app.Xi1Input_Label.Enable = 'off';
                    app.Xi1Input.Enable = 'off';
                    app.XiInput_Label.Enable = 'on';
                    app.XiInput.Enable = 'on';
                    app.GxInput_Label.Enable = 'on';
                    app.GxInput.Enable = 'on';
                    app.UITable.ColumnName = {'xi', 'xr', 'ÿa'};
                    app.UITable.ColumnFormat = {'long', 'long', 'long'};
                    app.UITable.Data = {};
                case 'Newton Raphson'
                    app.XlLabel.Enable = 'off';
                    app.XlInput.Enable = 'off';
                    app.XuEditField_2Label.Enable = 'off';
                    app.XuInput.Enable = 'off';
                    app.Xi1Input_Label.Enable = 'off';
                    app.Xi1Input.Enable = 'off';
                    app.XiInput_Label.Enable = 'off';
                    app.XiInput.Enable = 'on';
                    app.GxInput_Label.Enable = 'on';
                    app.GxInput.Enable = 'off';
                    app.UITable.ColumnName = {'xi', 'f(xi)', 'f''(xi)', 'xr', 'ÿa'};
                    app.UITable.ColumnFormat = {'bank', 'bank', 'bank', 'bank', 'bank'};
                    app.UITable.Data = {};
                case 'Secant'
                    app.XlLabel.Enable = 'off';
                    app.XlInput.Enable = 'off';
                    app.XuEditField_2Label.Enable = 'off';
                    app.XuInput.Enable = 'off';
                    app.Xi1Input_Label.Enable = 'on';
                    app.Xi1Input.Enable = 'on';
                    app.XiInput_Label.Enable = 'on';
                    app.XiInput.Enable = 'on';
                    app.GxInput_Label.Enable = 'off';
                    app.GxInput.Enable = 'off';
                    app.UITable.ColumnName = {'xi-1', 'f(xi-1)', 'xi', 'f(xi)', 'xr', 'ÿa'};
                    app.UITable.ColumnFormat = {'bank', 'bank', 'bank', 'bank', 'bank', 'bank'};
                    app.UITable.Data = {};
            end
        end

        % Button pushed function: SolveButton
        function SolveButtonPushed(app, event)
            % Check if f(x) is empty or is in incorrect format
            try
                func = app.FunctionFxEditField.Value;
                if (isempty(func))
                    errordlg('Please enter f(x)');
                    return;
                end
                f = str2func(['@(x) ' func]);
            catch ex
                errordlg(ex.message);
                return;
            end
            value = app.MethodDropDown.Value;
            switch value
                case 'Bisection'
                    try
                    [iterations, root, data, timeElapsed] = bisection(f, app.XlInput.Value, app.XuInput.Value, app.PercisionEditField.Value, app.MaxIterationsEditField.Value);
                    catch
                        return;
                    end 
                case 'False Position'
                    try
                    [iterations,root, data, timeElapsed] = falsePosition(f, app.XlInput.Value, app.XuInput.Value, app.PercisionEditField.Value, app.MaxIterationsEditField.Value);
                    catch
                        return;
                    end
                case 'Fixed Point'
                    try
                        func = app.GxInput.Value;
                        if (isempty(func))
                            errordlg('Please enter g(x)');
                            return;
                        end
                        g = str2func(['@(x) ' func]);
                    catch ex
                        errordlg(ex.message);
                        return;
                    end  
                    [iterations,root, data, timeElapsed] = fixedPoint(f, g, app.XiInput.Value, app.PercisionEditField.Value, app.MaxIterationsEditField.Value);
                case 'Newton Raphson'
                    [iterations,root, data, timeElapsed] = newtonRaphson(f, app.XiInput.Value, app.PercisionEditField.Value, app.MaxIterationsEditField.Value);
                case 'Secant'    
                    [iterations,root, data, timeElapsed] = secant(f, app.Xi1Input.Value, app.XiInput.Value, app.PercisionEditField.Value, app.MaxIterationsEditField.Value);
            end
            app.UITable.Data = data;
            app.IterationsEditField.Value = iterations;
            app.RootEditField.Value = root;
            app.PercisionEditField_2.Value = data(end);
            app.ExcutionTimeEditField.Value = timeElapsed;
        end

        % Menu selected function: ReadMenu
        function ReadMenuSelected(app, event)
            [error, method, f, g, x, epsilon, maxNumberOfIterations] = readfile();
            try
                if (error == 0)
                    app.MethodDropDown.Value = method;
                    app.FunctionFxEditField.Value = f;
                    app.GxInput.Value = g;
                    xInput = str2num(x);
                    switch method
                        case 'Bisection'
                            app.XlInput.Value = xInput(1);
                            app.XuInput.Value = xInput(2);
                        case 'False Position'
                            app.XlInput.Value = xInput(1);
                            app.XuInput.Value = xInput(2);
                        case 'Fixed Point'
                            app.XiInput.Value = xInput(1);
                        case 'Newton Raphson'
                            app.XiInput.Value = xInput(1);
                        case 'Secant'
                            app.Xi1Input.Value = xInput(1);
                            app.XiInput.Value = xInput(2);
                    end
                    app.MaxIterationsEditField.Value = str2double(maxNumberOfIterations);
                    app.PercisionEditField.Value = str2double(epsilon);
                else
                    errordlg(error);
                end
            catch ex
                errordlg(ex.message);
            end
        end

        % Button pushed function: StartButton
        function StartButtonPushed(app, event)
            try
                func = app.FunctionFxEditField_2.Value;
                if (isempty(func))
                    errordlg('Please enter f(x)');
                    return;
                end
                f = str2func(['@(x) ' func]);
            catch ex
                errordlg(ex.message);
                return;
            end
            
            global start;
            global i;
            global done;
            global data;
            start = true;
            [data, i, done, error] = trap_bisection_start(f, app.XlInput_2.Value, app.XuInput_2.Value);      
            
            if (error == false)
                app.BackButton.Enable = 'on';
                app.NextButton.Enable = 'on';
            else 
                return;
            end
            
            if (done == 1)
                app.BackButton.Enable = 'off';
                app.NextButton.Enable = 'off';
            end
            
            lower = data(i,1);
            upper = data(i,3);
            root = data(i,5);
            fplot(app.UIAxes,f, [lower upper]);
            hold(app.UIAxes, 'on');
            plot(app.UIAxes, root, f(root), '*');
            hold(app.UIAxes, 'off');            
            app.IterationsEditField_2.Value = i;
            app.RootEditField_2.Value = root;
            app.PercisionEditField_4.Value = data(i, 7);
                  
        end

        % Button pushed function: NextButton
        function NextButtonPushed(app, event)
            try
                func = app.FunctionFxEditField_2.Value;
                if (isempty(func))
                    errordlg('Please enter f(x)');
                    return;
                end
                f = str2func(['@(x) ' func]);
            catch ex
                errordlg(ex.message);
                return;
            end
            
            global data;
            global i;
            global done;
            [data, i , done] = trap_bisection_step(f, data, i, app.PercisionEditField_3.Value);
            
            if (done == 1)
                app.NextButton.Enable = 'off';                
            end
            
            lower = data(i,1);
            upper = data(i,3);
            root = data(i,5);
            fplot(app.UIAxes,f, [lower upper]);
            hold(app.UIAxes, 'on');
            plot(app.UIAxes, root, f(root), '*');
            hold(app.UIAxes, 'off');
            
            app.IterationsEditField_2.Value = i;
            app.RootEditField_2.Value = root;
            app.PercisionEditField_4.Value = data(i, 7);
        end

        % Button pushed function: BackButton
        function BackButtonPushed(app, event)
            try
                func = app.FunctionFxEditField_2.Value;
                if (isempty(func))
                    errordlg('Please enter f(x)');
                    return;
                end
                f = str2func(['@(x) ' func]);
            catch ex
                errordlg(ex.message);
                return;
            end
            
            global data;
            global i;
            global done;
            
            if (i == 1)
                return;
            end
            
            i = i - 1;

            done = 0;           
            app.NextButton.Enable = 'on';  
            lower = data(i,1);
            upper = data(i,3);
            root = data(i,5);
            fplot(app.UIAxes,f, [lower upper]);
            hold(app.UIAxes, 'on');
            plot(app.UIAxes, root, f(root), '*');
            hold(app.UIAxes, 'off');
            
            app.IterationsEditField_2.Value = i;
            app.RootEditField_2.Value = root;
            app.PercisionEditField_4.Value = data(i, 7);
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create RootFinderUIFigure and hide until all components are created
            app.RootFinderUIFigure = uifigure('Visible', 'off');
            app.RootFinderUIFigure.Position = [500 500 932 415];
            app.RootFinderUIFigure.Name = 'Root Finder';

            % Create FileMenu
            app.FileMenu = uimenu(app.RootFinderUIFigure);
            app.FileMenu.Text = 'File';

            % Create ReadMenu
            app.ReadMenu = uimenu(app.FileMenu);
            app.ReadMenu.MenuSelectedFcn = createCallbackFcn(app, @ReadMenuSelected, true);
            app.ReadMenu.Text = 'Read';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.RootFinderUIFigure);
            app.TabGroup.Position = [0 1 932 415];

            % Create SolverTab
            app.SolverTab = uitab(app.TabGroup);
            app.SolverTab.Title = 'Solver';

            % Create InputsPanel
            app.InputsPanel = uipanel(app.SolverTab);
            app.InputsPanel.Title = ' Inputs';
            app.InputsPanel.FontWeight = 'bold';
            app.InputsPanel.FontSize = 38;
            app.InputsPanel.Position = [0 -1 284 391];

            % Create SolveButton
            app.SolveButton = uibutton(app.InputsPanel, 'push');
            app.SolveButton.ButtonPushedFcn = createCallbackFcn(app, @SolveButtonPushed, true);
            app.SolveButton.Position = [167 14 100 22];
            app.SolveButton.Text = 'Solve';

            % Create FunctionFxEditFieldLabel
            app.FunctionFxEditFieldLabel = uilabel(app.InputsPanel);
            app.FunctionFxEditFieldLabel.HorizontalAlignment = 'right';
            app.FunctionFxEditFieldLabel.Position = [16 287 75 22];
            app.FunctionFxEditFieldLabel.Text = 'Function F(x)';

            % Create FunctionFxEditField
            app.FunctionFxEditField = uieditfield(app.InputsPanel, 'text');
            app.FunctionFxEditField.Position = [113 287 155 22];

            % Create MethodDropDownLabel
            app.MethodDropDownLabel = uilabel(app.InputsPanel);
            app.MethodDropDownLabel.HorizontalAlignment = 'right';
            app.MethodDropDownLabel.Position = [16 248 47 22];
            app.MethodDropDownLabel.Text = 'Method';

            % Create MethodDropDown
            app.MethodDropDown = uidropdown(app.InputsPanel);
            app.MethodDropDown.Items = {'Bisection', 'False Position', 'Fixed Point', 'Newton Raphson', 'Secant'};
            app.MethodDropDown.ValueChangedFcn = createCallbackFcn(app, @MethodDropDownValueChanged, true);
            app.MethodDropDown.Position = [113 248 155 22];
            app.MethodDropDown.Value = 'Bisection';

            % Create MaxIterationsEditFieldLabel
            app.MaxIterationsEditFieldLabel = uilabel(app.InputsPanel);
            app.MaxIterationsEditFieldLabel.HorizontalAlignment = 'right';
            app.MaxIterationsEditFieldLabel.Position = [16 92 82 22];
            app.MaxIterationsEditFieldLabel.Text = 'Max Iterations';

            % Create MaxIterationsEditField
            app.MaxIterationsEditField = uieditfield(app.InputsPanel, 'numeric');
            app.MaxIterationsEditField.Limits = [1 Inf];
            app.MaxIterationsEditField.HorizontalAlignment = 'left';
            app.MaxIterationsEditField.Position = [113 92 155 22];
            app.MaxIterationsEditField.Value = 50;

            % Create PercisionLabel
            app.PercisionLabel = uilabel(app.InputsPanel);
            app.PercisionLabel.HorizontalAlignment = 'right';
            app.PercisionLabel.Position = [16 53 76 22];
            app.PercisionLabel.Text = 'Percision (%)';

            % Create PercisionEditField
            app.PercisionEditField = uieditfield(app.InputsPanel, 'numeric');
            app.PercisionEditField.Limits = [0 Inf];
            app.PercisionEditField.HorizontalAlignment = 'left';
            app.PercisionEditField.Position = [113 53 155 22];
            app.PercisionEditField.Value = 1e-05;

            % Create GxInput_Label
            app.GxInput_Label = uilabel(app.InputsPanel);
            app.GxInput_Label.HorizontalAlignment = 'right';
            app.GxInput_Label.Enable = 'off';
            app.GxInput_Label.Position = [16 131 27 22];
            app.GxInput_Label.Text = 'G(x)';

            % Create GxInput
            app.GxInput = uieditfield(app.InputsPanel, 'text');
            app.GxInput.Enable = 'off';
            app.GxInput.Position = [113 131 155 22];

            % Create XlLabel
            app.XlLabel = uilabel(app.InputsPanel);
            app.XlLabel.HorizontalAlignment = 'right';
            app.XlLabel.Position = [16 209 25 22];
            app.XlLabel.Text = 'Xl  ';

            % Create XiInput
            app.XiInput = uieditfield(app.InputsPanel, 'numeric');
            app.XiInput.HorizontalAlignment = 'left';
            app.XiInput.Enable = 'off';
            app.XiInput.Position = [50 170 88 22];

            % Create XlInput
            app.XlInput = uieditfield(app.InputsPanel, 'numeric');
            app.XlInput.HorizontalAlignment = 'left';
            app.XlInput.Position = [50 209 88 22];

            % Create Xi1Input
            app.Xi1Input = uieditfield(app.InputsPanel, 'numeric');
            app.Xi1Input.HorizontalAlignment = 'left';
            app.Xi1Input.Enable = 'off';
            app.Xi1Input.Position = [179 170 88 22];
            app.Xi1Input.Value = 1;

            % Create XuEditField_2Label
            app.XuEditField_2Label = uilabel(app.InputsPanel);
            app.XuEditField_2Label.HorizontalAlignment = 'right';
            app.XuEditField_2Label.Position = [145 209 25 22];
            app.XuEditField_2Label.Text = 'Xu';

            % Create XuInput
            app.XuInput = uieditfield(app.InputsPanel, 'numeric');
            app.XuInput.HorizontalAlignment = 'left';
            app.XuInput.Position = [179 209 88 22];
            app.XuInput.Value = 1;

            % Create XiInput_Label
            app.XiInput_Label = uilabel(app.InputsPanel);
            app.XiInput_Label.HorizontalAlignment = 'right';
            app.XiInput_Label.Enable = 'off';
            app.XiInput_Label.Position = [16 170 25 22];
            app.XiInput_Label.Text = 'Xi  ';

            % Create Xi1Input_Label
            app.Xi1Input_Label = uilabel(app.InputsPanel);
            app.Xi1Input_Label.HorizontalAlignment = 'right';
            app.Xi1Input_Label.Enable = 'off';
            app.Xi1Input_Label.Position = [143 170 27 22];
            app.Xi1Input_Label.Text = 'Xi-1';

            % Create OutputsPanel
            app.OutputsPanel = uipanel(app.SolverTab);
            app.OutputsPanel.Title = ' Outputs';
            app.OutputsPanel.FontWeight = 'bold';
            app.OutputsPanel.FontSize = 38;
            app.OutputsPanel.Position = [283 -1 650 391];

            % Create UITable
            app.UITable = uitable(app.OutputsPanel);
            app.UITable.ColumnName = {'xl'; 'f(xl)'; 'xu'; 'f(xu)'; 'xr'; 'f(xr)'; 'ÿa'};
            app.UITable.Position = [8 43 629 266];

            % Create AllIterationsLabel
            app.AllIterationsLabel = uilabel(app.OutputsPanel);
            app.AllIterationsLabel.Position = [8 308 72 22];
            app.AllIterationsLabel.Text = 'All Iterations';

            % Create IterationsEditFieldLabel
            app.IterationsEditFieldLabel = uilabel(app.OutputsPanel);
            app.IterationsEditFieldLabel.HorizontalAlignment = 'right';
            app.IterationsEditFieldLabel.Position = [8 14 65 22];
            app.IterationsEditFieldLabel.Text = '# Iterations';

            % Create IterationsEditField
            app.IterationsEditField = uieditfield(app.OutputsPanel, 'numeric');
            app.IterationsEditField.Editable = 'off';
            app.IterationsEditField.HorizontalAlignment = 'left';
            app.IterationsEditField.Position = [79 14 64 22];

            % Create RootEditFieldLabel
            app.RootEditFieldLabel = uilabel(app.OutputsPanel);
            app.RootEditFieldLabel.HorizontalAlignment = 'right';
            app.RootEditFieldLabel.Position = [157 14 31 22];
            app.RootEditFieldLabel.Text = 'Root';

            % Create RootEditField
            app.RootEditField = uieditfield(app.OutputsPanel, 'numeric');
            app.RootEditField.ValueDisplayFormat = '%.10f';
            app.RootEditField.Editable = 'off';
            app.RootEditField.HorizontalAlignment = 'left';
            app.RootEditField.Position = [196 14 116 22];

            % Create PercisionEditField_2Label
            app.PercisionEditField_2Label = uilabel(app.OutputsPanel);
            app.PercisionEditField_2Label.HorizontalAlignment = 'right';
            app.PercisionEditField_2Label.Position = [320 14 55 22];
            app.PercisionEditField_2Label.Text = 'Percision';

            % Create PercisionEditField_2
            app.PercisionEditField_2 = uieditfield(app.OutputsPanel, 'numeric');
            app.PercisionEditField_2.ValueDisplayFormat = '%.7f';
            app.PercisionEditField_2.Editable = 'off';
            app.PercisionEditField_2.HorizontalAlignment = 'left';
            app.PercisionEditField_2.Position = [382 14 70 22];

            % Create ExcutionTimeEditFieldLabel
            app.ExcutionTimeEditFieldLabel = uilabel(app.OutputsPanel);
            app.ExcutionTimeEditFieldLabel.HorizontalAlignment = 'right';
            app.ExcutionTimeEditFieldLabel.Position = [459 14 82 22];
            app.ExcutionTimeEditFieldLabel.Text = 'Excution Time';

            % Create ExcutionTimeEditField
            app.ExcutionTimeEditField = uieditfield(app.OutputsPanel, 'numeric');
            app.ExcutionTimeEditField.ValueDisplayFormat = '%.7f';
            app.ExcutionTimeEditField.Editable = 'off';
            app.ExcutionTimeEditField.HorizontalAlignment = 'left';
            app.ExcutionTimeEditField.Position = [548 14 76 22];

            % Create SimulationTab
            app.SimulationTab = uitab(app.TabGroup);
            app.SimulationTab.Title = 'Simulation';

            % Create InputsPanel_2
            app.InputsPanel_2 = uipanel(app.SimulationTab);
            app.InputsPanel_2.Title = ' Inputs';
            app.InputsPanel_2.FontWeight = 'bold';
            app.InputsPanel_2.FontSize = 38;
            app.InputsPanel_2.Position = [0 -1 284 391];

            % Create StartButton
            app.StartButton = uibutton(app.InputsPanel_2, 'push');
            app.StartButton.ButtonPushedFcn = createCallbackFcn(app, @StartButtonPushed, true);
            app.StartButton.Position = [16 98 100 22];
            app.StartButton.Text = 'Start';

            % Create FunctionFxEditField_2Label
            app.FunctionFxEditField_2Label = uilabel(app.InputsPanel_2);
            app.FunctionFxEditField_2Label.HorizontalAlignment = 'right';
            app.FunctionFxEditField_2Label.Position = [16 287 75 22];
            app.FunctionFxEditField_2Label.Text = 'Function F(x)';

            % Create FunctionFxEditField_2
            app.FunctionFxEditField_2 = uieditfield(app.InputsPanel_2, 'text');
            app.FunctionFxEditField_2.Position = [113 287 155 22];

            % Create PercisionLabel_2
            app.PercisionLabel_2 = uilabel(app.InputsPanel_2);
            app.PercisionLabel_2.HorizontalAlignment = 'right';
            app.PercisionLabel_2.Position = [16 166 76 22];
            app.PercisionLabel_2.Text = 'Percision (%)';

            % Create PercisionEditField_3
            app.PercisionEditField_3 = uieditfield(app.InputsPanel_2, 'numeric');
            app.PercisionEditField_3.Limits = [0 Inf];
            app.PercisionEditField_3.HorizontalAlignment = 'left';
            app.PercisionEditField_3.Position = [113 166 155 22];
            app.PercisionEditField_3.Value = 1e-05;

            % Create XlLabel_2
            app.XlLabel_2 = uilabel(app.InputsPanel_2);
            app.XlLabel_2.HorizontalAlignment = 'right';
            app.XlLabel_2.Position = [16 209 25 22];
            app.XlLabel_2.Text = 'Xl  ';

            % Create XlInput_2
            app.XlInput_2 = uieditfield(app.InputsPanel_2, 'numeric');
            app.XlInput_2.HorizontalAlignment = 'left';
            app.XlInput_2.Position = [50 209 88 22];

            % Create XuEditField_2Label_2
            app.XuEditField_2Label_2 = uilabel(app.InputsPanel_2);
            app.XuEditField_2Label_2.HorizontalAlignment = 'right';
            app.XuEditField_2Label_2.Position = [145 209 25 22];
            app.XuEditField_2Label_2.Text = 'Xu';

            % Create XuInput_2
            app.XuInput_2 = uieditfield(app.InputsPanel_2, 'numeric');
            app.XuInput_2.HorizontalAlignment = 'left';
            app.XuInput_2.Position = [179 209 88 22];
            app.XuInput_2.Value = 1;

            % Create BackButton
            app.BackButton = uibutton(app.InputsPanel_2, 'push');
            app.BackButton.ButtonPushedFcn = createCallbackFcn(app, @BackButtonPushed, true);
            app.BackButton.Enable = 'off';
            app.BackButton.Position = [16 45 100 22];
            app.BackButton.Text = 'Back';

            % Create NextButton
            app.NextButton = uibutton(app.InputsPanel_2, 'push');
            app.NextButton.ButtonPushedFcn = createCallbackFcn(app, @NextButtonPushed, true);
            app.NextButton.Enable = 'off';
            app.NextButton.Position = [167 45 100 22];
            app.NextButton.Text = 'Next';

            % Create MethodEditFieldLabel
            app.MethodEditFieldLabel = uilabel(app.InputsPanel_2);
            app.MethodEditFieldLabel.Position = [19 247 72 22];
            app.MethodEditFieldLabel.Text = 'Method';

            % Create MethodEditField
            app.MethodEditField = uieditfield(app.InputsPanel_2, 'text');
            app.MethodEditField.Editable = 'off';
            app.MethodEditField.Position = [113 247 154 22];
            app.MethodEditField.Value = 'Bisection';

            % Create OutputsPanel_2
            app.OutputsPanel_2 = uipanel(app.SimulationTab);
            app.OutputsPanel_2.Title = ' Outputs';
            app.OutputsPanel_2.FontWeight = 'bold';
            app.OutputsPanel_2.FontSize = 38;
            app.OutputsPanel_2.Position = [283 -1 650 391];

            % Create PlottingLabel
            app.PlottingLabel = uilabel(app.OutputsPanel_2);
            app.PlottingLabel.Position = [8 308 46 22];
            app.PlottingLabel.Text = 'Plotting';

            % Create IterationsEditField_2Label
            app.IterationsEditField_2Label = uilabel(app.OutputsPanel_2);
            app.IterationsEditField_2Label.HorizontalAlignment = 'right';
            app.IterationsEditField_2Label.Position = [8 14 65 22];
            app.IterationsEditField_2Label.Text = '# Iterations';

            % Create IterationsEditField_2
            app.IterationsEditField_2 = uieditfield(app.OutputsPanel_2, 'numeric');
            app.IterationsEditField_2.Editable = 'off';
            app.IterationsEditField_2.HorizontalAlignment = 'left';
            app.IterationsEditField_2.Position = [79 14 64 22];

            % Create RootEditField_2Label
            app.RootEditField_2Label = uilabel(app.OutputsPanel_2);
            app.RootEditField_2Label.HorizontalAlignment = 'right';
            app.RootEditField_2Label.Position = [247 14 31 22];
            app.RootEditField_2Label.Text = 'Root';

            % Create RootEditField_2
            app.RootEditField_2 = uieditfield(app.OutputsPanel_2, 'numeric');
            app.RootEditField_2.ValueDisplayFormat = '%.10f';
            app.RootEditField_2.Editable = 'off';
            app.RootEditField_2.HorizontalAlignment = 'left';
            app.RootEditField_2.Position = [286 14 116 22];

            % Create PercisionEditField_4Label
            app.PercisionEditField_4Label = uilabel(app.OutputsPanel_2);
            app.PercisionEditField_4Label.HorizontalAlignment = 'right';
            app.PercisionEditField_4Label.Position = [474 14 55 22];
            app.PercisionEditField_4Label.Text = 'Percision';

            % Create PercisionEditField_4
            app.PercisionEditField_4 = uieditfield(app.OutputsPanel_2, 'numeric');
            app.PercisionEditField_4.ValueDisplayFormat = '%.7f';
            app.PercisionEditField_4.Editable = 'off';
            app.PercisionEditField_4.HorizontalAlignment = 'left';
            app.PercisionEditField_4.Position = [546 14 78 22];

            % Create UIAxes
            app.UIAxes = uiaxes(app.OutputsPanel_2);
            title(app.UIAxes, 'Function')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.Box = 'on';
            app.UIAxes.XGrid = 'on';
            app.UIAxes.YGrid = 'on';
            app.UIAxes.Position = [8 45 616 264];

            % Show the figure after all components are created
            app.RootFinderUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = RootFinder_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.RootFinderUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.RootFinderUIFigure)
        end
    end
end