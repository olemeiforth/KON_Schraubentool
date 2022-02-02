classdef KON_Schraubentool < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        LaTeXExportErrorLamp            matlab.ui.control.Lamp
        ErrorLamp_2Label                matlab.ui.control.Label
        ErrorLamp                       matlab.ui.control.Lamp
        ErrorLampLabel                  matlab.ui.control.Label
        sigma_minEditField              matlab.ui.control.NumericEditField
        sigma_minEditFieldLabel         matlab.ui.control.Label
        sigma_maxEditField              matlab.ui.control.NumericEditField
        sigma_maxEditFieldLabel         matlab.ui.control.Label
        mu_maxEditField                 matlab.ui.control.NumericEditField
        mu_maxEditFieldLabel            matlab.ui.control.Label
        mu_minEditField                 matlab.ui.control.NumericEditField
        mu_minEditFieldLabel            matlab.ui.control.Label
        F_SmaxNEditField                matlab.ui.control.NumericEditField
        F_SmaxNEditFieldLabel           matlab.ui.control.Label
        F_SminNEditField                matlab.ui.control.NumericEditField
        F_SminNEditFieldLabel           matlab.ui.control.Label
        F_ASNEditField                  matlab.ui.control.NumericEditField
        F_ASNEditFieldLabel             matlab.ui.control.Label
        A_Smm2EditField                 matlab.ui.control.NumericEditField
        A_Smm2EditFieldLabel            matlab.ui.control.Label
        d_SmmEditField                  matlab.ui.control.NumericEditField
        d_SmmEditFieldLabel             matlab.ui.control.Label
        d_3mmEditField                  matlab.ui.control.NumericEditField
        d_3mmEditFieldLabel             matlab.ui.control.Label
        d_2mmEditField                  matlab.ui.control.NumericEditField
        d_2mmLabel                      matlab.ui.control.Label
        A_ersleftmm2rightEditField      matlab.ui.control.NumericEditField
        A_ersleftmm2rightEditFieldLabel  matlab.ui.control.Label
        alpha_AEditField                matlab.ui.control.NumericEditField
        alpha_AEditFieldLabel           matlab.ui.control.Label
        F_VmaxNEditField                matlab.ui.control.NumericEditField
        F_VmaxNLabel                    matlab.ui.control.Label
        nEditField                      matlab.ui.control.NumericEditField
        nEditFieldLabel                 matlab.ui.control.Label
        F_VminNEditField                matlab.ui.control.NumericEditField
        F_VminNEditFieldLabel           matlab.ui.control.Label
        delta_PleftfracmmNrightEditField  matlab.ui.control.NumericEditField
        delta_PleftfracmmNrightEditFieldLabel  matlab.ui.control.Label
        F_ZNEditField                   matlab.ui.control.NumericEditField
        F_ZNEditFieldLabel              matlab.ui.control.Label
        delta_SleftfracmmNrightEditField  matlab.ui.control.NumericEditField
        delta_SleftfracmmNrightEditFieldLabel  matlab.ui.control.Label
        dmmEditField                    matlab.ui.control.NumericEditField
        dmmEditFieldLabel               matlab.ui.control.Label
        l_MmmEditField                  matlab.ui.control.NumericEditField
        l_MmmEditFieldLabel             matlab.ui.control.Label
        A_3mm2EditField                 matlab.ui.control.NumericEditField
        A_3mm2EditFieldLabel            matlab.ui.control.Label
        l_SKmmEditField                 matlab.ui.control.NumericEditField
        l_SKmmLabel                     matlab.ui.control.Label
        PhiEditField                    matlab.ui.control.NumericEditField
        PhiEditFieldLabel               matlab.ui.control.Label
        l_GmmEditField                  matlab.ui.control.NumericEditField
        l_GmmEditFieldLabel             matlab.ui.control.Label
        A_Nmm2EditField                 matlab.ui.control.NumericEditField
        A_Nmm2EditFieldLabel            matlab.ui.control.Label
        FestigkeitsklasseDropDown       matlab.ui.control.DropDown
        FestigkeitsklasseDropDownLabel  matlab.ui.control.Label
        f_ZmumEditField                 matlab.ui.control.NumericEditField
        f_ZmumEditFieldLabel            matlab.ui.control.Label
        FallDropDown                    matlab.ui.control.DropDown
        FallDropDownLabel               matlab.ui.control.Label
        AnziehverfahrenDropDown         matlab.ui.control.DropDown
        AnziehverfahrenDropDownLabel    matlab.ui.control.Label
        d_hmmEditField                  matlab.ui.control.NumericEditField
        d_hmmEditFieldLabel             matlab.ui.control.Label
        D_AmmEditField                  matlab.ui.control.NumericEditField
        D_AmmEditFieldLabel             matlab.ui.control.Label
        d_WmmEditField                  matlab.ui.control.NumericEditField
        d_WmmEditFieldLabel             matlab.ui.control.Label
        l_UGmmEditField                 matlab.ui.control.NumericEditField
        l_UGmmLabel                     matlab.ui.control.Label
        l_1mmEditField                  matlab.ui.control.NumericEditField
        l_1mmEditFieldLabel             matlab.ui.control.Label
        PEditField                      matlab.ui.control.NumericEditField
        PEditFieldLabel                 matlab.ui.control.Label
        E_PleftfracNmm2rightEditField   matlab.ui.control.NumericEditField
        E_PleftfracNmm2rightEditFieldLabel  matlab.ui.control.Label
        E_SleftfracNmm2rightEditField   matlab.ui.control.NumericEditField
        E_SleftfracNmm2rightLabel       matlab.ui.control.Label
        l_kmmEditField                  matlab.ui.control.NumericEditField
        l_kmmEditFieldLabel             matlab.ui.control.Label
        F_ANEditField                   matlab.ui.control.NumericEditField
        F_ALabel                        matlab.ui.control.Label
        VerbindungsartDropDown          matlab.ui.control.DropDown
        VerbindungsartDropDownLabel     matlab.ui.control.Label
        Label_2                         matlab.ui.control.Label
        Version013Januar2022Label       matlab.ui.control.Label
        Image                           matlab.ui.control.Image
        Label                           matlab.ui.control.Label
        LaTeXExportButton               matlab.ui.control.Button
        SpannungsigmaLabel              matlab.ui.control.Label
        ZugkraftanderSchraubeF_SLabel   matlab.ui.control.Label
        SpannungsquerschnittA_SLabel    matlab.ui.control.Label
        VorspannkraftF_VLabel           matlab.ui.control.Label
        Plattennachgiebigkeitdelta_PLabel  matlab.ui.control.Label
        xEqLabel                        matlab.ui.control.Label
        BedingungLabel                  matlab.ui.control.Label
        ErsatzquerschnittA_ersLabel     matlab.ui.control.Label
        Schraubennachgiebigkeitdelta_SLabel  matlab.ui.control.Label
        BerechneButton                  matlab.ui.control.Button
    end

    
    methods (Access = private)
        
        function [alpha_A,err] = alpha_a(app,err)
            switch app.AnziehverfahrenDropDown.Value
                case 'Schraubenschlüssel'
                    alpha_A = 4;
                case 'Schlagschrauber'
                    alpha_A = 4;
                case 'Drehschrauber'
                    alpha_A = 2.5;
                case 'Drehmomentschlüssel'
                    alpha_A = 1.6;
                case 'Hydraulisches Anziehen'
                    alpha_A = 1.6;
                case 'Längenmessung'
                    alpha_A = 1.5;
                case 'Drehwinkelgesteuertes Anziehen'
                    alpha_A = 1;
                case 'Streckgrenzengesteuertes Anziehen'
                    alpha_A = 1;
                otherwise
                    alpha_A = 0;
                    err = -1;
            end
        end
        
        function [n,err] = nFall(app,err)
            switch app.FallDropDown.Value
                case 'Querbeanspruchte, reibschlüssige Schraubenverbindung'
                    n = 1;
                case 'Ungünstige Deckelverschraubung, Kraftangriff weit vor Trennfuge'
                    n = 0.7;
                case 'Typischer Normalfall'
                    n = 0.5;
                case 'Günstiger Fall mit Kraftangriff nahe Trennfuge'
                    n = 0.3;
                otherwise
                    n = 0;
                    err = err-1;
            end
        end
        
        function [Rp02,err] = Rp02Festigkeit(app,err)
            switch app.FestigkeitsklasseDropDown.Value
                case '8.8'
                    Rp02 = 640;
                case '10.9'
                    Rp02 = 900;
                case '12.9'
                    Rp02 = 1080;
                otherwise
                    Rp02 = 0;
                    err = err-1;
            end
        end
        
        function [l_M,err,l_MString] = l_MCheck(app,err)

            d = app.dmmEditField.Value;

            if(strcmp(app.VerbindungsartDropDown.Value, 'DSV'))
                l_M = 0.4*d;
                l_MString = 'l_M=0,4 \cdot d';
            elseif(strcmp(app.VerbindungsartDropDown.Value, 'ESV'))
                l_M = 0.33*d;
                l_MString = 'l_M=0,33 \cdot d';
            else
                err = err-1;
                l_MString = 'ERROR';
            end
        end
        
        function [bedingung_out,A_ers,x_Eq,err,bedingung_str,x_str,A_ers_str] = Ersatzquerschnitt(app,err)

            d_W = app.d_WmmEditField.Value;
            D_A = app.D_AmmEditField.Value;
            l_k = app.l_kmmEditField.Value;
            d_h = app.d_hmmEditField.Value;

            if(d_W >= D_A)
                bedingung_out = '$d_W \geq D_A$';
                A_ers = (pi/4)*(D_A^2-d_h^2);
                x_Eq = '$x=0$';
                bedingung_str = '\(d_W \geq D_A\)\\';
                x_str = '\(x=0\)';
                A_ers_str = '\(frac{pi}{4} \cdot \left(D_A^2-d_h^2\right)';

            elseif(D_A<=(d_W+l_k))
                bedingung_out = '$D_A \leq d_W+l_k$';
                bedingung_str = '\(d_W < D_A \leq d_W+l_k\)\\';

                if(strcmp(app.VerbindungsartDropDown.Value, 'DSV'))
                    x_Eq = '$x=\sqrt[3]{\frac{l_k \cdot d_w}{D_A^2}}$';
                    x = ((l_k*d_W)/D_A^2)^(1/3);
                    x_str = '\(x=\sqrt[3]{\frac{l_k \cdot d_w}{D_A^2}}\)';
                elseif(strcmp(app.VerbindungsartDropDown.Value, 'ESV'))
                    x_Eq = '$x=\left(\frac{l_k}{D_A}\right)^{0,2}$';
                    x = (l_k/D_A)^(0.2);
                    x_str = '\(x=\left(\frac{l_k}{D_A}\right)^{0,2}\)';
                else
                    x_Eq = 'ERROR';
                    err = err-1;
                    x_str = x_Eq;
                end

                A_ers = (pi/4)*(d_W^2-d_h^2)+(pi/8)*d_W*(D_A-d_W)*(((x+1)^2)-1);
                A_ers_str = '\frac{\pi}{4}\cdot (d_W^2-d_h^2)+\frac{\pi}{8}\cdot d_W \cdot (D_A-d_W)\cdot \left[\left(x+1\right)^2-1\right]';

            elseif(D_A>=d_W+l_k)
                bedingung_out = '$D_A \geq d_W+l_k$';
                bedingung_str = '\(D_A \geq d_W+l_k\)\\';

                if(strcmp(app.VerbindungsartDropDown.Value, 'DSV'))
                    x_Eq = '$x=\sqrt[3]{\frac{l_k \cdot d_w}{(d_w+l_k)^2}}$';
                    x = ((l_k*d_W)/((d_W+l_k)^2))^(1/3);
                    x_str = '\(x=\sqrt[3]{\frac{l_k \cdot d_w}{(d_w+l_k)^2}}\)';
                elseif(strcmp(app.VerbindungsartDropDown.Value, 'ESV'))
                    x_Eq = '$x=\left(\frac{l_k}{d_w+l_k}\right)^{0,2}$';
                    x = (l_k/(d_W+l_k))^(0.2);
                    x_str = '\(x=\left(\frac{l_k}{d_w+l_k}\right)^{0,2}\)';
                else
                    x_Eq = 'ERROR';
                    err = err-1;
                    x_str = x_Eq;
                end

                A_ers = (pi/4)*(d_W^2-d_h^2)+(pi/8)*d_W*l_k*(((x+1)^2)-1);
                A_ers_str = '\frac{\pi}{4}\cdot (d_W^2-d_h^2)+\frac{\pi}{8}\cdot d_W \cdot l_k\cdot \left[\left(x+1\right)^2-1\right]';

            else
                bedingung_out = 'ERROR';
                err = err-1;
            end
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            % drawnow;
            app.UIFigure.WindowState = 'maximized';
        end

        % Button pushed function: BerechneButton
        function BerechneButtonPushed(app, event)
            err = 0;

            % Input
            F_A = app.F_ANEditField.Value;
            l_k = app.l_kmmEditField.Value;
            E_S = app.E_SleftfracNmm2rightEditField.Value;
            E_P = app.E_PleftfracNmm2rightEditField.Value;
            d = app.dmmEditField.Value;
            P = app.PEditField.Value;
            l_1 = app.l_1mmEditField.Value;
            l_UG = app.l_UGmmEditField.Value;
            d_W = app.d_WmmEditField.Value;
            D_A = app.D_AmmEditField.Value;
            d_h = app.d_hmmEditField.Value;
            f_Z = app.f_ZmumEditField.Value;
            F_Klerf = 0; % Unfinished
            
            [alpha_A,err] = alpha_a(app,err);
            [n,err] = nFall(app,err);
            [Rp02,err] = Rp02Festigkeit(app,err);

            % Calculation
            l_SK = 0.5*d; % eff. Kopflänge [mm]
            l_G = 0.5*d; % eff. Außengewindelänge [mm]
            d_2 = d-0.64952*P; % Flankendurchmesser [mm]
            d_3 = d-1.22687*P; % Kerndurchmesser [mm]
            d_S = 0.5*(d_2+d_3); %Spannungsdurchmesser [mm]
            A_N = (pi*d^2)/4; % Außen-/Nennfläche [mm^2]
            A_2 = (pi*d_2^2)/4; % Flankenfläche [mm^2]
            A_3 = (pi*d_3^2)/4; % Kernfläche [mm^2]

            [l_M,err] = l_MCheck(app,err);

            % Schraubennachgiebigkeit [mm/N]
            delta_S = (1/E_S)*((l_SK/A_N)+(l_1/A_N)+(l_G/A_3)+(l_UG/A_3)+(l_M/A_N));

            % Ersatzquerschnitt [mm^2]
            [bedingung_out,A_ers,x_Eq,err] = Ersatzquerschnitt(app,err);

            % Plattennachgiebigkeit [mm/N]
            delta_P = l_k/(E_P*A_ers);

            % Vorspannkraft [N]
            Phi = n*delta_P/(delta_P+delta_S);
            F_Z = (f_Z*(10^(-3)))/(delta_S+delta_P);
            F_Vmin = F_Klerf+F_Z+(1-Phi)*F_A;
            F_Vmax = alpha_A*F_Vmin;

            % Spannungsquerschnitt [mm^2]
            A_S = (pi*(d_S)^2)/4;

            % Zugkraft an der Schraube [N]
            F_AS = 0.1*Rp02*A_S;
            F_Smin = F_Vmin+F_AS;
            F_Smax = F_Vmax+F_AS;

            % Spannung [N/mm^2]
            sigma_min = F_Smin/A_S;
            sigma_max = F_Smax/A_S;

            % Sicherheit
            mu_min = Rp02/(sigma_min*1.5);      
            mu_max = Rp02/(sigma_max*1.5);
            
            % Output
            app.l_SKmmEditField.Value = l_SK;
            app.l_GmmEditField.Value = l_G;
            app.A_Nmm2EditField.Value = A_N;
            app.A_3mm2EditField.Value = A_3;
            app.l_MmmEditField.Value = l_M;

            app.delta_SleftfracmmNrightEditField.Value = delta_S;

            app.BedingungLabel.Text = bedingung_out;
            app.xEqLabel.Text = x_Eq;
            app.A_ersleftmm2rightEditField.Value = A_ers;

            app.delta_PleftfracmmNrightEditField.Value = delta_P;

            app.nEditField.Value = n;
            app.alpha_AEditField.Value = alpha_A;
            app.PhiEditField.Value = Phi;
            app.F_ZNEditField.Value = F_Z;

            app.F_VminNEditField.Value = F_Vmin;
            app.F_VmaxNEditField.Value = F_Vmax;

            app.d_2mmEditField.Value = d_2;
            app.d_3mmEditField.Value = d_3;
            app.d_SmmEditField.Value = d_S;

            app.A_Smm2EditField.Value = A_S;

            app.F_ASNEditField.Value = F_AS;

            app.F_SminNEditField.Value = F_Smin;
            app.F_SmaxNEditField.Value = F_Smax;

            app.sigma_minEditField.Value = sigma_min;
            app.sigma_maxEditField.Value = sigma_max;

            app.mu_minEditField.Value = mu_min;
            app.mu_maxEditField.Value = mu_max;

            % Error
            if(err<0)
                app.ErrorLamp.Color = [1.0 0.0 0.0];
            else
                app.ErrorLamp.Color = [0.8 0.8 0.8];
            end

        end

        % Button pushed function: LaTeXExportButton
        function LaTeXExportButtonPushed(app, event)
            % Berechnen
            BerechneButtonPushed(app);

            % Check for Temp-File
            tempKonDirectory = 'C:\temp\KonBerechnungsTool';
            tempDirectory = 'C:\temp';
            tempStatus = exist(tempDirectory,'dir');
            tempKonStatus = exist(tempKonDirectory,'dir');
            if tempStatus == 7
                if tempKonStatus == 7
                    delete(fullfile(tempKonDirectory,'*'));
                else
                    mkdir(tempKonDirectory);
                end

                outputFile = fopen('C:\temp\KonBerechnungstool\latexOutput.txt','w');
                outputString = ['Benötigte Packages: \n' ...
                    '\\usepackage{tabularx}\n' ...
                    '\\usepackage{siunitx}\n' ...
                    '\\usepackage{color,soul}\n\n' ...
                    '\\begin{center}\n' ...
                    '\\begin{small}\n' ...
                    '\\begin{tabularx}{0.8\\textwidth} {|>{\\centering}X|>{\\centering}X||>{\\centering}X|>{\\centering}X||>{\\centering}X|>{\\centering\\arraybackslash}X|}\n' ...
                    ' \\hline\n' ...
                    ' $F_A\\ \\si{[N]}$&%.3f&$l_k\\ \\si{[mm]}$&%.3f&$E_S\\ \\si{\\left[\\frac{N}{mm^2}\\right]}$&$%.3f$\\\\\n' ...
                    ' \\hline\n' ...
                    ' $E_P\\ \\si{\\left[\\frac{N}{mm^2}\\right]}$&$%.3f$&$d\\ \\si{[mm]}$&%d&P&%.1f\\\\\n' ...
                    ' \\hline\n' ...
                    ' $l_1\\ \\si{[mm]}$&%.1f&$l_{UG}\\ \\si{[mm]}$&%.1f&$d_W\\ \\si{[mm]}$&%.1f\\\\\n' ...
                    ' \\hline\n' ...
                    ' $D_A\\ \\si{[mm]}$&%.1f&$d_h\\ \\si{[mm]}$&%.1f&$f_Z\\ \\si{[\\mu m]}$&%d\\\\\n' ...
                    ' \\hline\n' ...
                    ' $\\alpha_a$&%.1f&$n$&%.1f&$R_{p0,2}\\ \\si{\\left[\\frac{N}{mm^2}\\right]}$&%d\\\\\n' ...
                    '\\hline\n' ...
                    '\\end{tabularx}\n' ...
                    '\\end{small}\\\\\n' ...
                    '\\end{center}\n' ...
                    '\\vspace{5pt}\n' ...
                    '\\underline{Schraubennachgiebigkeit \\(\\delta_S\\)}\\\\\n' ...
                    '\\begin{footnotesize}\n' ...
                    ' \\(A_N=\\frac{\\pi \\cdot d^2}{4}=%.5f\\ \\si{mm^2}\\)\\qquad\n' ...
                    ' \\(A_3=\\frac{\\pi \\cdot (d-1,22687\\cdot P)^2}{4}=%.3f\\ \\si{mm^2}\\)\\\\\n' ...
                    ' \\(l_{SK}=0,5 \\cdot d=%.1f\\ \\si{mm}\\)\\qquad\n' ...
                    ' \\(l_G=0,5 \\cdot d=%.1f\\ \\si{mm}\\)\\qquad\n' ...
                    ' \\(%s=%.2f\\si{mm}\\)\\\\\n' ...
                    '\\end{footnotesize}\n' ...
                    '\\[\\delta_S=\\frac{1}{E_S}\\left(\\frac{l_{SK}}{A_N}+\\frac{l_1}{A_N}+\\frac{l_G}{A_3}+\\frac{l_{UG}}{A_3}+\\frac{l_M}{A_N}\\right)=%g\\ \\si{\\frac{mm}{N}}\\]\\\\\n' ...
                    '\\underline{Ersatzquerschnitt \\(A_{ers}\\)}\\\\\n' ...
                    '\\begin{footnotesize}\n' ...
                    ' %s\n' ...
                    ' %s\n' ...
                    '\\end{footnotesize}\n' ...
                    '\\[\\rightarrow A_{ers}=%s=%g\\ \\si{mm^2}\\]\\\\\n' ...
                    '\\underline{Plattennachgiebigkeit \\(\\delta_P\\)}\\\\\n' ...
                    '\\[\\delta_P=\\frac{l_k}{E_P\\cdot A_{ers}}=%g\\ \\si{\\frac{mm}{N}}\\]\\\\\n' ...
                    '\\underline{Vorspannkraft \\(F_V\\)}\\\\\n' ...
                    '\\begin{footnotesize}\n' ...
                    ' \\(\\Phi=n\\cdot\\frac{\\delta_P}{\\delta_P+\\delta_S}=%.5f\\)\\\\\n' ...
                    ' \\(F_Z=\\frac{f_Z}{\\delta_S+\\delta_P}=%g\\ \\si{N}\\)\\\\\n' ...
                    '\\end{footnotesize}\n' ...
                    '\\[F_{V,min}=F_{Kl,erf}+F_Z+(1-\\Phi)\\cdot F_A=%g\\ \\si{N}\\]\n' ...
                    '\\[F_{V,max}=\\alpha_A \\cdot F_{V,min}=%g\\ \\si{N}\\]\\\\\n' ...
                    '\\underline{Spannungsquerschnitt \\(A_S\\)}\\\\\n' ...
                    '\\begin{footnotesize}\n' ...
                    ' \\(d_2=d-0,64952 \\cdot P=%.4f\\ \\si{mm}\\)\\qquad\n' ...
                    ' \\(d_3=d-1,22687 \\cdot P=%.4f\\ \\si{mm}\\)\\qquad\n' ...
                    ' \\(d_S=0,5 \\cdot (d_2+d_3)=%.4f\\ \\si{mm}\\)\\\\\n' ...
                    '\\end{footnotesize}\n' ...
                    '\\[A_S=\\frac{\\pi \\cdot d_S^2}{4}=%.4f\\ \\si{mm^2}\\]\\\\\n' ...
                    '\\underline{Zugkraft an der Schraube \\(F_S\\)}\\\\\n' ...
                    '\\begin{footnotesize}\n' ...
                    ' \\(F_{AS}\\leq 0,1 \\cdot R_{p0,2} \\cdot A_S\\)\\\\\n' ...
                    ' \\(\\rightarrow F_{AS}:=0,1 \\cdot R_{p0,2} \\cdot A_S=%.5f\\ \\si{N}\\)\n' ...
                    '\\end{footnotesize}\n' ...
                    '\\[F_{S,min}=F_{V,min}+F_{AS}=%.5f\\ \\si{N}\\]\n' ...
                    '\\[F_{S,max}=F_{V,max}+F_{AS}=%.5f\\ \\si{kN}\\]\n' ...
                    '\\underline{Spannung \\(\\sigma\\)}\\\\\n' ...
                    '\\[\\sigma_{min}=\\frac{F_{S,min}}{A_S}=%.5f\\ \\si{\\frac{N}{mm^2}}\\qquad' ...
                    '\\qquad \\mu_{min}:=\\frac{\\sigma_{zul}}{\\sigma_{min} \\cdot 1,5}\\]\n' ...
                    '\\[\\sigma_{max}=\\frac{F_{sV,max}}{A_S}=%.5f\\ \\si{\\frac{N}{mm^2}}\\qquad' ...
                    '\\qquad \\mu_{max}:=\\frac{\\sigma_{zul}}{\\sigma_{max} \\cdot 1,5}\\]\\\\\n' ...
                    '\\centerline{\\hl{$\\mu_{min} = %.5f$}\\qquad\\hl{$\\mu_{max}=%.5f$}}' ...
                    '\0'];

                alpha_A = alpha_a(app);
                n = nFall(app);
                Rp02 = Rp02Festigkeit(app);
                [~,~,l_MString] = l_MCheck(app,0);
                [~,~,~,~,bedingung_str,x_str,A_ers_str] = Ersatzquerschnitt(app,0);

                fprintf(outputFile,outputString,app.F_ANEditField.Value,app.l_kmmEditField.Value,app.E_SleftfracNmm2rightEditField.Value, ...
                    app.E_PleftfracNmm2rightEditField.Value,app.dmmEditField.Value,app.PEditField.Value,...
                    app.l_1mmEditField.Value,app.l_UGmmEditField.Value,app.d_WmmEditField.Value, ...
                    app.D_AmmEditField.Value,app.d_hmmEditField.Value,app.f_ZmumEditField.Value, ...
                    alpha_A, n, Rp02, ...
                    app.A_Nmm2EditField.Value,app.A_3mm2EditField.Value,app.l_SKmmEditField.Value, ...
                    app.l_GmmEditField.Value,l_MString,app.l_MmmEditField.Value, ...
                    app.delta_SleftfracmmNrightEditField.Value, ...
                    bedingung_str,x_str,A_ers_str,app.A_ersleftmm2rightEditField.Value, ...
                    app.delta_PleftfracmmNrightEditField.Value, ...
                    app.PhiEditField.Value, app.F_ZNEditField.Value, ...
                    app.F_VminNEditField.Value,app.F_VmaxNEditField.Value, ...
                    app.d_2mmEditField.Value,app.d_3mmEditField.Value,app.d_SmmEditField.Value, ...
                    app.A_Smm2EditField.Value, ...
                    app.F_ASNEditField.Value,app.F_SminNEditField.Value,app.F_SmaxNEditField.Value, ...
                    app.sigma_minEditField.Value,app.sigma_maxEditField.Value, ...
                    app.mu_minEditField.Value,app.mu_maxEditField.Value);

                fclose(outputFile);
                winopen('C:\temp\KonBerechnungstool\latexOutput.txt');
                exportError = 0;
            else
                exportError = -1;
            end

            % Error
            if(exportError<0)
                app.ErrorLamp.Color = [1.0 0.0 0.0];
            else
                app.ErrorLamp.Color = [0.8 0.8 0.8];
            end

        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 1920 1080];
            app.UIFigure.Name = 'MATLAB App';

            % Create BerechneButton
            app.BerechneButton = uibutton(app.UIFigure, 'push');
            app.BerechneButton.ButtonPushedFcn = createCallbackFcn(app, @BerechneButtonPushed, true);
            app.BerechneButton.Position = [137 386 253 45];
            app.BerechneButton.Text = 'Berechne';

            % Create Schraubennachgiebigkeitdelta_SLabel
            app.Schraubennachgiebigkeitdelta_SLabel = uilabel(app.UIFigure);
            app.Schraubennachgiebigkeitdelta_SLabel.Interpreter = 'latex';
            app.Schraubennachgiebigkeitdelta_SLabel.FontSize = 14;
            app.Schraubennachgiebigkeitdelta_SLabel.Position = [547 907 300 25];
            app.Schraubennachgiebigkeitdelta_SLabel.Text = 'Schraubennachgiebigkeit $\delta_S$';

            % Create ErsatzquerschnittA_ersLabel
            app.ErsatzquerschnittA_ersLabel = uilabel(app.UIFigure);
            app.ErsatzquerschnittA_ersLabel.Interpreter = 'latex';
            app.ErsatzquerschnittA_ersLabel.FontSize = 14;
            app.ErsatzquerschnittA_ersLabel.Position = [547 742 300 25];
            app.ErsatzquerschnittA_ersLabel.Text = 'Ersatzquerschnitt $A_{ers}$';

            % Create BedingungLabel
            app.BedingungLabel = uilabel(app.UIFigure);
            app.BedingungLabel.Interpreter = 'latex';
            app.BedingungLabel.Position = [547 706 160 31];
            app.BedingungLabel.Text = '';

            % Create xEqLabel
            app.xEqLabel = uilabel(app.UIFigure);
            app.xEqLabel.Interpreter = 'latex';
            app.xEqLabel.Position = [547 662 160 47];
            app.xEqLabel.Text = '';

            % Create Plattennachgiebigkeitdelta_PLabel
            app.Plattennachgiebigkeitdelta_PLabel = uilabel(app.UIFigure);
            app.Plattennachgiebigkeitdelta_PLabel.Interpreter = 'latex';
            app.Plattennachgiebigkeitdelta_PLabel.FontSize = 14;
            app.Plattennachgiebigkeitdelta_PLabel.Position = [547 576 300 25];
            app.Plattennachgiebigkeitdelta_PLabel.Text = 'Plattennachgiebigkeit $\delta_P$';

            % Create VorspannkraftF_VLabel
            app.VorspannkraftF_VLabel = uilabel(app.UIFigure);
            app.VorspannkraftF_VLabel.Interpreter = 'latex';
            app.VorspannkraftF_VLabel.FontSize = 14;
            app.VorspannkraftF_VLabel.Position = [547 464 300 25];
            app.VorspannkraftF_VLabel.Text = 'Vorspannkraft $F_V$';

            % Create SpannungsquerschnittA_SLabel
            app.SpannungsquerschnittA_SLabel = uilabel(app.UIFigure);
            app.SpannungsquerschnittA_SLabel.Interpreter = 'latex';
            app.SpannungsquerschnittA_SLabel.FontSize = 14;
            app.SpannungsquerschnittA_SLabel.Position = [1200 909 300 25];
            app.SpannungsquerschnittA_SLabel.Text = 'Spannungsquerschnitt $A_S$';

            % Create ZugkraftanderSchraubeF_SLabel
            app.ZugkraftanderSchraubeF_SLabel = uilabel(app.UIFigure);
            app.ZugkraftanderSchraubeF_SLabel.Interpreter = 'latex';
            app.ZugkraftanderSchraubeF_SLabel.FontSize = 14;
            app.ZugkraftanderSchraubeF_SLabel.Position = [1199 758 300 25];
            app.ZugkraftanderSchraubeF_SLabel.Text = 'Zugkraft an der Schraube $F_S$';

            % Create SpannungsigmaLabel
            app.SpannungsigmaLabel = uilabel(app.UIFigure);
            app.SpannungsigmaLabel.Interpreter = 'latex';
            app.SpannungsigmaLabel.FontSize = 14;
            app.SpannungsigmaLabel.Position = [1200 577 300 25];
            app.SpannungsigmaLabel.Text = 'Spannung $\sigma$';

            % Create LaTeXExportButton
            app.LaTeXExportButton = uibutton(app.UIFigure, 'push');
            app.LaTeXExportButton.ButtonPushedFcn = createCallbackFcn(app, @LaTeXExportButtonPushed, true);
            app.LaTeXExportButton.Position = [137 334 253 45];
            app.LaTeXExportButton.Text = 'LaTeX Export';

            % Create Label
            app.Label = uilabel(app.UIFigure);
            app.Label.Interpreter = 'latex';
            app.Label.VerticalAlignment = 'top';
            app.Label.FontColor = [0.502 0.502 0.502];
            app.Label.Position = [138 68 329 222];
            app.Label.Text = {'\(F_A\) = Angreifende Betriebskraft (axial)'; '\(l_k\) = Klemmlänge'; '\(E_S\) = E-Modul Schraube'; '\(E_P\) = E-Modul Platte'; '\(d\) = Nenndurchmesser'; '\(P\) = Gewindesteigung'; '\(l_1\) = Passlänge'; '\(l_{UG}\) = ung. Außengewindelänge'; '\(d_W\) = Durchmesser der Kopfauflage'; '\(D_A\) = 2\(\cdot\) kleinster Randabstand'; '\(d_h\) = Durchmesser des Durchgangslochs'; '\(f_Z\) = Setzbetrag (s.rechts)'};

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.Position = [431 69 224 221];
            app.Image.ImageSource = 'Screenshot 2022-02-02 020204.png';

            % Create Version013Januar2022Label
            app.Version013Januar2022Label = uilabel(app.UIFigure);
            app.Version013Januar2022Label.HorizontalAlignment = 'right';
            app.Version013Januar2022Label.FontColor = [0.149 0.149 0.149];
            app.Version013Januar2022Label.Position = [1628 18 273 33];
            app.Version013Januar2022Label.Text = {'Version 0.1.3'; 'Januar 2022'};

            % Create Label_2
            app.Label_2 = uilabel(app.UIFigure);
            app.Label_2.HorizontalAlignment = 'right';
            app.Label_2.VerticalAlignment = 'bottom';
            app.Label_2.Position = [1633 68 268 220];
            app.Label_2.Text = {'Benötigte LaTeX Packages: '; '\usepackage{tabularx}'; '\usepackage{siunitx}'; '\usepackage{color,soul}'};

            % Create VerbindungsartDropDownLabel
            app.VerbindungsartDropDownLabel = uilabel(app.UIFigure);
            app.VerbindungsartDropDownLabel.Interpreter = 'latex';
            app.VerbindungsartDropDownLabel.HorizontalAlignment = 'right';
            app.VerbindungsartDropDownLabel.Position = [165 910 94 22];
            app.VerbindungsartDropDownLabel.Text = 'Verbindungsart';

            % Create VerbindungsartDropDown
            app.VerbindungsartDropDown = uidropdown(app.UIFigure);
            app.VerbindungsartDropDown.Items = {'DSV', 'ESV'};
            app.VerbindungsartDropDown.Position = [274 910 62 21];
            app.VerbindungsartDropDown.Value = 'DSV';

            % Create F_ALabel
            app.F_ALabel = uilabel(app.UIFigure);
            app.F_ALabel.Interpreter = 'latex';
            app.F_ALabel.HorizontalAlignment = 'right';
            app.F_ALabel.Position = [169 879 60 22];
            app.F_ALabel.Text = '$F_A\ [N]$';

            % Create F_ANEditField
            app.F_ANEditField = uieditfield(app.UIFigure, 'numeric');
            app.F_ANEditField.ValueDisplayFormat = '%11.9g';
            app.F_ANEditField.Position = [244 876 92 27];
            app.F_ANEditField.Value = 261.904761;

            % Create l_kmmEditFieldLabel
            app.l_kmmEditFieldLabel = uilabel(app.UIFigure);
            app.l_kmmEditFieldLabel.Interpreter = 'latex';
            app.l_kmmEditFieldLabel.HorizontalAlignment = 'right';
            app.l_kmmEditFieldLabel.Position = [169 849 60 22];
            app.l_kmmEditFieldLabel.Text = '$l_k\ [mm]$';

            % Create l_kmmEditField
            app.l_kmmEditField = uieditfield(app.UIFigure, 'numeric');
            app.l_kmmEditField.ValueDisplayFormat = '%11.9g';
            app.l_kmmEditField.Position = [244 846 92 27];
            app.l_kmmEditField.Value = 83;

            % Create E_SleftfracNmm2rightLabel
            app.E_SleftfracNmm2rightLabel = uilabel(app.UIFigure);
            app.E_SleftfracNmm2rightLabel.Interpreter = 'latex';
            app.E_SleftfracNmm2rightLabel.HorizontalAlignment = 'right';
            app.E_SleftfracNmm2rightLabel.FontSize = 8;
            app.E_SleftfracNmm2rightLabel.Position = [175 817 54 28];
            app.E_SleftfracNmm2rightLabel.Text = '$E_S\ \left[\frac{N}{{mm}^2}\right]$';

            % Create E_SleftfracNmm2rightEditField
            app.E_SleftfracNmm2rightEditField = uieditfield(app.UIFigure, 'numeric');
            app.E_SleftfracNmm2rightEditField.ValueDisplayFormat = '%11.9g';
            app.E_SleftfracNmm2rightEditField.Position = [244 816 92 27];
            app.E_SleftfracNmm2rightEditField.Value = 199000;

            % Create E_PleftfracNmm2rightEditFieldLabel
            app.E_PleftfracNmm2rightEditFieldLabel = uilabel(app.UIFigure);
            app.E_PleftfracNmm2rightEditFieldLabel.Interpreter = 'latex';
            app.E_PleftfracNmm2rightEditFieldLabel.HorizontalAlignment = 'right';
            app.E_PleftfracNmm2rightEditFieldLabel.FontSize = 8;
            app.E_PleftfracNmm2rightEditFieldLabel.Position = [174 787 55 28];
            app.E_PleftfracNmm2rightEditFieldLabel.Text = '$E_P\ \left[\frac{N}{{mm}^2}\right]$';

            % Create E_PleftfracNmm2rightEditField
            app.E_PleftfracNmm2rightEditField = uieditfield(app.UIFigure, 'numeric');
            app.E_PleftfracNmm2rightEditField.ValueDisplayFormat = '%11.9g';
            app.E_PleftfracNmm2rightEditField.Position = [244 786 92 27];
            app.E_PleftfracNmm2rightEditField.Value = 27000;

            % Create PEditFieldLabel
            app.PEditFieldLabel = uilabel(app.UIFigure);
            app.PEditFieldLabel.Interpreter = 'latex';
            app.PEditFieldLabel.HorizontalAlignment = 'right';
            app.PEditFieldLabel.Position = [169 729 60 22];
            app.PEditFieldLabel.Text = '$P$';

            % Create PEditField
            app.PEditField = uieditfield(app.UIFigure, 'numeric');
            app.PEditField.ValueDisplayFormat = '%11.9g';
            app.PEditField.Position = [244 726 92 27];
            app.PEditField.Value = 1.5;

            % Create l_1mmEditFieldLabel
            app.l_1mmEditFieldLabel = uilabel(app.UIFigure);
            app.l_1mmEditFieldLabel.Interpreter = 'latex';
            app.l_1mmEditFieldLabel.HorizontalAlignment = 'right';
            app.l_1mmEditFieldLabel.Position = [175 699 54 22];
            app.l_1mmEditFieldLabel.Text = '$l_1\ [mm]$';

            % Create l_1mmEditField
            app.l_1mmEditField = uieditfield(app.UIFigure, 'numeric');
            app.l_1mmEditField.ValueDisplayFormat = '%11.9g';
            app.l_1mmEditField.Position = [244 696 92 27];
            app.l_1mmEditField.Value = 84;

            % Create l_UGmmLabel
            app.l_UGmmLabel = uilabel(app.UIFigure);
            app.l_UGmmLabel.Interpreter = 'latex';
            app.l_UGmmLabel.HorizontalAlignment = 'right';
            app.l_UGmmLabel.Position = [167 669 62 22];
            app.l_UGmmLabel.Text = '$l_{UG}\ [mm]$';

            % Create l_UGmmEditField
            app.l_UGmmEditField = uieditfield(app.UIFigure, 'numeric');
            app.l_UGmmEditField.ValueDisplayFormat = '%11.9g';
            app.l_UGmmEditField.Position = [244 666 92 27];
            app.l_UGmmEditField.Value = 1;

            % Create d_WmmEditFieldLabel
            app.d_WmmEditFieldLabel = uilabel(app.UIFigure);
            app.d_WmmEditFieldLabel.Interpreter = 'latex';
            app.d_WmmEditFieldLabel.HorizontalAlignment = 'right';
            app.d_WmmEditFieldLabel.Position = [168 639 61 22];
            app.d_WmmEditFieldLabel.Text = '$d_W\ [mm]$';

            % Create d_WmmEditField
            app.d_WmmEditField = uieditfield(app.UIFigure, 'numeric');
            app.d_WmmEditField.ValueDisplayFormat = '%11.9g';
            app.d_WmmEditField.Position = [244 636 92 27];
            app.d_WmmEditField.Value = 26;

            % Create D_AmmEditFieldLabel
            app.D_AmmEditFieldLabel = uilabel(app.UIFigure);
            app.D_AmmEditFieldLabel.Interpreter = 'latex';
            app.D_AmmEditFieldLabel.HorizontalAlignment = 'right';
            app.D_AmmEditFieldLabel.Position = [167 609 62 22];
            app.D_AmmEditFieldLabel.Text = '$D_A\ [mm]$';

            % Create D_AmmEditField
            app.D_AmmEditField = uieditfield(app.UIFigure, 'numeric');
            app.D_AmmEditField.ValueDisplayFormat = '%11.9g';
            app.D_AmmEditField.Position = [244 606 92 27];
            app.D_AmmEditField.Value = 45;

            % Create d_hmmEditFieldLabel
            app.d_hmmEditFieldLabel = uilabel(app.UIFigure);
            app.d_hmmEditFieldLabel.Interpreter = 'latex';
            app.d_hmmEditFieldLabel.HorizontalAlignment = 'right';
            app.d_hmmEditFieldLabel.Position = [172 579 57 22];
            app.d_hmmEditFieldLabel.Text = '$d_h\ [mm]$';

            % Create d_hmmEditField
            app.d_hmmEditField = uieditfield(app.UIFigure, 'numeric');
            app.d_hmmEditField.ValueDisplayFormat = '%11.9g';
            app.d_hmmEditField.Position = [244 576 92 27];
            app.d_hmmEditField.Value = 15;

            % Create AnziehverfahrenDropDownLabel
            app.AnziehverfahrenDropDownLabel = uilabel(app.UIFigure);
            app.AnziehverfahrenDropDownLabel.Interpreter = 'latex';
            app.AnziehverfahrenDropDownLabel.HorizontalAlignment = 'right';
            app.AnziehverfahrenDropDownLabel.Position = [138 517 102 22];
            app.AnziehverfahrenDropDownLabel.Text = 'Anziehverfahren';

            % Create AnziehverfahrenDropDown
            app.AnziehverfahrenDropDown = uidropdown(app.UIFigure);
            app.AnziehverfahrenDropDown.Items = {'Schraubenschlüssel', 'Schlagschrauber', 'Drehschrauber', 'Drehmomentschlüssel', 'Hydraulisches Anziehen', 'Längenmessung', 'Drehwinkelgesteuertes Anziehen', 'Streckgrenzengesteuertes Anziehen'};
            app.AnziehverfahrenDropDown.Position = [243 517 146 21];
            app.AnziehverfahrenDropDown.Value = 'Schraubenschlüssel';

            % Create FallDropDownLabel
            app.FallDropDownLabel = uilabel(app.UIFigure);
            app.FallDropDownLabel.Interpreter = 'latex';
            app.FallDropDownLabel.HorizontalAlignment = 'right';
            app.FallDropDownLabel.Position = [210 492 30 22];
            app.FallDropDownLabel.Text = 'Fall';

            % Create FallDropDown
            app.FallDropDown = uidropdown(app.UIFigure);
            app.FallDropDown.Items = {'Querbeanspruchte, reibschlüssige Schraubenverbindung', 'Ungünstige Deckelverschraubung, Kraftangriff weit vor Trennfuge', 'Typischer Normalfall', 'Günstiger Fall mit Kraftangriff nahe Trennfuge'};
            app.FallDropDown.Position = [243 492 146 21];
            app.FallDropDown.Value = 'Querbeanspruchte, reibschlüssige Schraubenverbindung';

            % Create f_ZmumEditFieldLabel
            app.f_ZmumEditFieldLabel = uilabel(app.UIFigure);
            app.f_ZmumEditFieldLabel.Interpreter = 'latex';
            app.f_ZmumEditFieldLabel.HorizontalAlignment = 'right';
            app.f_ZmumEditFieldLabel.Position = [175 549 54 22];
            app.f_ZmumEditFieldLabel.Text = '$f_Z\ [\mu m]$';

            % Create f_ZmumEditField
            app.f_ZmumEditField = uieditfield(app.UIFigure, 'numeric');
            app.f_ZmumEditField.ValueDisplayFormat = '%11.9g';
            app.f_ZmumEditField.Position = [244 546 92 27];
            app.f_ZmumEditField.Value = 8;

            % Create FestigkeitsklasseDropDownLabel
            app.FestigkeitsklasseDropDownLabel = uilabel(app.UIFigure);
            app.FestigkeitsklasseDropDownLabel.Interpreter = 'latex';
            app.FestigkeitsklasseDropDownLabel.HorizontalAlignment = 'right';
            app.FestigkeitsklasseDropDownLabel.Position = [137 467 103 22];
            app.FestigkeitsklasseDropDownLabel.Text = 'Festigkeitsklasse';

            % Create FestigkeitsklasseDropDown
            app.FestigkeitsklasseDropDown = uidropdown(app.UIFigure);
            app.FestigkeitsklasseDropDown.Items = {'8.8', '10.9', '12.9'};
            app.FestigkeitsklasseDropDown.Position = [243 467 146 21];
            app.FestigkeitsklasseDropDown.Value = '8.8';

            % Create A_Nmm2EditFieldLabel
            app.A_Nmm2EditFieldLabel = uilabel(app.UIFigure);
            app.A_Nmm2EditFieldLabel.Interpreter = 'latex';
            app.A_Nmm2EditFieldLabel.HorizontalAlignment = 'right';
            app.A_Nmm2EditFieldLabel.Position = [547 879 67 22];
            app.A_Nmm2EditFieldLabel.Text = '$A_N\ [mm^2]$';

            % Create A_Nmm2EditField
            app.A_Nmm2EditField = uieditfield(app.UIFigure, 'numeric');
            app.A_Nmm2EditField.ValueDisplayFormat = '%11.9g';
            app.A_Nmm2EditField.Editable = 'off';
            app.A_Nmm2EditField.HorizontalAlignment = 'left';
            app.A_Nmm2EditField.Position = [629 876 92 27];

            % Create l_GmmEditFieldLabel
            app.l_GmmEditFieldLabel = uilabel(app.UIFigure);
            app.l_GmmEditFieldLabel.Interpreter = 'latex';
            app.l_GmmEditFieldLabel.HorizontalAlignment = 'right';
            app.l_GmmEditFieldLabel.Position = [746 849 56 22];
            app.l_GmmEditFieldLabel.Text = '$l_G\ [mm]$';

            % Create l_GmmEditField
            app.l_GmmEditField = uieditfield(app.UIFigure, 'numeric');
            app.l_GmmEditField.ValueDisplayFormat = '%11.9g';
            app.l_GmmEditField.Editable = 'off';
            app.l_GmmEditField.HorizontalAlignment = 'left';
            app.l_GmmEditField.Position = [817 846 92 27];

            % Create PhiEditFieldLabel
            app.PhiEditFieldLabel = uilabel(app.UIFigure);
            app.PhiEditFieldLabel.Interpreter = 'latex';
            app.PhiEditFieldLabel.HorizontalAlignment = 'right';
            app.PhiEditFieldLabel.Position = [589 402 25 22];
            app.PhiEditFieldLabel.Text = '$\Phi$';

            % Create PhiEditField
            app.PhiEditField = uieditfield(app.UIFigure, 'numeric');
            app.PhiEditField.ValueDisplayFormat = '%11.9g';
            app.PhiEditField.Editable = 'off';
            app.PhiEditField.HorizontalAlignment = 'left';
            app.PhiEditField.Position = [629 399 92 27];

            % Create l_SKmmLabel
            app.l_SKmmLabel = uilabel(app.UIFigure);
            app.l_SKmmLabel.Interpreter = 'latex';
            app.l_SKmmLabel.HorizontalAlignment = 'right';
            app.l_SKmmLabel.Position = [552 849 62 22];
            app.l_SKmmLabel.Text = '$l_{SK}\ [mm]$';

            % Create l_SKmmEditField
            app.l_SKmmEditField = uieditfield(app.UIFigure, 'numeric');
            app.l_SKmmEditField.ValueDisplayFormat = '%11.9g';
            app.l_SKmmEditField.Editable = 'off';
            app.l_SKmmEditField.HorizontalAlignment = 'left';
            app.l_SKmmEditField.Position = [629 846 92 27];

            % Create A_3mm2EditFieldLabel
            app.A_3mm2EditFieldLabel = uilabel(app.UIFigure);
            app.A_3mm2EditFieldLabel.Interpreter = 'latex';
            app.A_3mm2EditFieldLabel.HorizontalAlignment = 'right';
            app.A_3mm2EditFieldLabel.Position = [738 879 64 22];
            app.A_3mm2EditFieldLabel.Text = '$A_3\ [mm^2]$';

            % Create A_3mm2EditField
            app.A_3mm2EditField = uieditfield(app.UIFigure, 'numeric');
            app.A_3mm2EditField.ValueDisplayFormat = '%11.9g';
            app.A_3mm2EditField.Editable = 'off';
            app.A_3mm2EditField.HorizontalAlignment = 'left';
            app.A_3mm2EditField.Position = [817 876 92 27];

            % Create l_MmmEditFieldLabel
            app.l_MmmEditFieldLabel = uilabel(app.UIFigure);
            app.l_MmmEditFieldLabel.Interpreter = 'latex';
            app.l_MmmEditFieldLabel.HorizontalAlignment = 'right';
            app.l_MmmEditFieldLabel.Position = [936 849 59 22];
            app.l_MmmEditFieldLabel.Text = '$l_M\ [mm]$';

            % Create l_MmmEditField
            app.l_MmmEditField = uieditfield(app.UIFigure, 'numeric');
            app.l_MmmEditField.ValueDisplayFormat = '%11.9g';
            app.l_MmmEditField.Editable = 'off';
            app.l_MmmEditField.HorizontalAlignment = 'left';
            app.l_MmmEditField.Position = [1010 846 92 27];

            % Create dmmEditFieldLabel
            app.dmmEditFieldLabel = uilabel(app.UIFigure);
            app.dmmEditFieldLabel.Interpreter = 'latex';
            app.dmmEditFieldLabel.HorizontalAlignment = 'right';
            app.dmmEditFieldLabel.Position = [177 756 53 29];
            app.dmmEditFieldLabel.Text = '$d\ [mm]$';

            % Create dmmEditField
            app.dmmEditField = uieditfield(app.UIFigure, 'numeric');
            app.dmmEditField.ValueDisplayFormat = '%11.9g';
            app.dmmEditField.Position = [244 756 92 27];
            app.dmmEditField.Value = 14;

            % Create delta_SleftfracmmNrightEditFieldLabel
            app.delta_SleftfracmmNrightEditFieldLabel = uilabel(app.UIFigure);
            app.delta_SleftfracmmNrightEditFieldLabel.Interpreter = 'latex';
            app.delta_SleftfracmmNrightEditFieldLabel.HorizontalAlignment = 'right';
            app.delta_SleftfracmmNrightEditFieldLabel.Position = [741 786 62 36];
            app.delta_SleftfracmmNrightEditFieldLabel.Text = '$\delta_S\ \left[\frac{mm}{N}\right]$';

            % Create delta_SleftfracmmNrightEditField
            app.delta_SleftfracmmNrightEditField = uieditfield(app.UIFigure, 'numeric');
            app.delta_SleftfracmmNrightEditField.ValueDisplayFormat = '%11.9g';
            app.delta_SleftfracmmNrightEditField.Editable = 'off';
            app.delta_SleftfracmmNrightEditField.HorizontalAlignment = 'left';
            app.delta_SleftfracmmNrightEditField.Position = [817 790 92 27];

            % Create F_ZNEditFieldLabel
            app.F_ZNEditFieldLabel = uilabel(app.UIFigure);
            app.F_ZNEditFieldLabel.Interpreter = 'latex';
            app.F_ZNEditFieldLabel.HorizontalAlignment = 'right';
            app.F_ZNEditFieldLabel.Position = [749 402 52 22];
            app.F_ZNEditFieldLabel.Text = '$F_Z\ [N]$';

            % Create F_ZNEditField
            app.F_ZNEditField = uieditfield(app.UIFigure, 'numeric');
            app.F_ZNEditField.ValueDisplayFormat = '%11.9g';
            app.F_ZNEditField.Editable = 'off';
            app.F_ZNEditField.HorizontalAlignment = 'left';
            app.F_ZNEditField.Position = [816 399 92 27];

            % Create delta_PleftfracmmNrightEditFieldLabel
            app.delta_PleftfracmmNrightEditFieldLabel = uilabel(app.UIFigure);
            app.delta_PleftfracmmNrightEditFieldLabel.Interpreter = 'latex';
            app.delta_PleftfracmmNrightEditFieldLabel.HorizontalAlignment = 'right';
            app.delta_PleftfracmmNrightEditFieldLabel.Position = [740 534 63 36];
            app.delta_PleftfracmmNrightEditFieldLabel.Text = '$\delta_P\ \left[\frac{mm}{N}\right]$';

            % Create delta_PleftfracmmNrightEditField
            app.delta_PleftfracmmNrightEditField = uieditfield(app.UIFigure, 'numeric');
            app.delta_PleftfracmmNrightEditField.ValueDisplayFormat = '%11.9g';
            app.delta_PleftfracmmNrightEditField.Editable = 'off';
            app.delta_PleftfracmmNrightEditField.HorizontalAlignment = 'left';
            app.delta_PleftfracmmNrightEditField.Position = [818 540 92 27];

            % Create F_VminNEditFieldLabel
            app.F_VminNEditFieldLabel = uilabel(app.UIFigure);
            app.F_VminNEditFieldLabel.Interpreter = 'latex';
            app.F_VminNEditFieldLabel.HorizontalAlignment = 'right';
            app.F_VminNEditFieldLabel.Position = [734 357 69 22];
            app.F_VminNEditFieldLabel.Text = '$F_{V,min}\ [N]$';

            % Create F_VminNEditField
            app.F_VminNEditField = uieditfield(app.UIFigure, 'numeric');
            app.F_VminNEditField.ValueDisplayFormat = '%11.9g';
            app.F_VminNEditField.Editable = 'off';
            app.F_VminNEditField.HorizontalAlignment = 'left';
            app.F_VminNEditField.Position = [818 354 92 27];

            % Create nEditFieldLabel
            app.nEditFieldLabel = uilabel(app.UIFigure);
            app.nEditFieldLabel.Interpreter = 'latex';
            app.nEditFieldLabel.HorizontalAlignment = 'right';
            app.nEditFieldLabel.Position = [589 432 25 22];
            app.nEditFieldLabel.Text = '$n$';

            % Create nEditField
            app.nEditField = uieditfield(app.UIFigure, 'numeric');
            app.nEditField.ValueDisplayFormat = '%11.9g';
            app.nEditField.Editable = 'off';
            app.nEditField.HorizontalAlignment = 'left';
            app.nEditField.Position = [629 429 92 27];

            % Create F_VmaxNLabel
            app.F_VmaxNLabel = uilabel(app.UIFigure);
            app.F_VmaxNLabel.Interpreter = 'latex';
            app.F_VmaxNLabel.HorizontalAlignment = 'right';
            app.F_VmaxNLabel.Position = [732 327 71 22];
            app.F_VmaxNLabel.Text = '$F_{V,max}\ [N]$';

            % Create F_VmaxNEditField
            app.F_VmaxNEditField = uieditfield(app.UIFigure, 'numeric');
            app.F_VmaxNEditField.ValueDisplayFormat = '%11.9g';
            app.F_VmaxNEditField.Editable = 'off';
            app.F_VmaxNEditField.HorizontalAlignment = 'left';
            app.F_VmaxNEditField.Position = [818 324 92 27];

            % Create alpha_AEditFieldLabel
            app.alpha_AEditFieldLabel = uilabel(app.UIFigure);
            app.alpha_AEditFieldLabel.Interpreter = 'latex';
            app.alpha_AEditFieldLabel.HorizontalAlignment = 'right';
            app.alpha_AEditFieldLabel.Position = [776 432 25 22];
            app.alpha_AEditFieldLabel.Text = '$\alpha_A$';

            % Create alpha_AEditField
            app.alpha_AEditField = uieditfield(app.UIFigure, 'numeric');
            app.alpha_AEditField.ValueDisplayFormat = '%11.9g';
            app.alpha_AEditField.Editable = 'off';
            app.alpha_AEditField.HorizontalAlignment = 'left';
            app.alpha_AEditField.Position = [816 429 92 27];

            % Create A_ersleftmm2rightEditFieldLabel
            app.A_ersleftmm2rightEditFieldLabel = uilabel(app.UIFigure);
            app.A_ersleftmm2rightEditFieldLabel.Interpreter = 'latex';
            app.A_ersleftmm2rightEditFieldLabel.HorizontalAlignment = 'right';
            app.A_ersleftmm2rightEditFieldLabel.Position = [731 631 71 22];
            app.A_ersleftmm2rightEditFieldLabel.Text = '$A_{ers}\ \left[mm^2\right]$';

            % Create A_ersleftmm2rightEditField
            app.A_ersleftmm2rightEditField = uieditfield(app.UIFigure, 'numeric');
            app.A_ersleftmm2rightEditField.ValueDisplayFormat = '%11.9g';
            app.A_ersleftmm2rightEditField.Editable = 'off';
            app.A_ersleftmm2rightEditField.HorizontalAlignment = 'left';
            app.A_ersleftmm2rightEditField.Position = [817 628 92 27];

            % Create d_2mmLabel
            app.d_2mmLabel = uilabel(app.UIFigure);
            app.d_2mmLabel.Interpreter = 'latex';
            app.d_2mmLabel.HorizontalAlignment = 'right';
            app.d_2mmLabel.Position = [1210 879 57 22];
            app.d_2mmLabel.Text = '$d_2\ [mm]$';

            % Create d_2mmEditField
            app.d_2mmEditField = uieditfield(app.UIFigure, 'numeric');
            app.d_2mmEditField.ValueDisplayFormat = '%11.9g';
            app.d_2mmEditField.Editable = 'off';
            app.d_2mmEditField.HorizontalAlignment = 'left';
            app.d_2mmEditField.Position = [1282 876 92 27];

            % Create d_3mmEditFieldLabel
            app.d_3mmEditFieldLabel = uilabel(app.UIFigure);
            app.d_3mmEditFieldLabel.Interpreter = 'latex';
            app.d_3mmEditFieldLabel.HorizontalAlignment = 'right';
            app.d_3mmEditFieldLabel.Position = [1398 879 57 22];
            app.d_3mmEditFieldLabel.Text = '$d_3\ [mm]$';

            % Create d_3mmEditField
            app.d_3mmEditField = uieditfield(app.UIFigure, 'numeric');
            app.d_3mmEditField.ValueDisplayFormat = '%11.9g';
            app.d_3mmEditField.Editable = 'off';
            app.d_3mmEditField.HorizontalAlignment = 'left';
            app.d_3mmEditField.Position = [1470 876 92 27];

            % Create d_SmmEditFieldLabel
            app.d_SmmEditFieldLabel = uilabel(app.UIFigure);
            app.d_SmmEditFieldLabel.Interpreter = 'latex';
            app.d_SmmEditFieldLabel.HorizontalAlignment = 'right';
            app.d_SmmEditFieldLabel.Position = [1590 879 58 22];
            app.d_SmmEditFieldLabel.Text = '$d_S\ [mm]$';

            % Create d_SmmEditField
            app.d_SmmEditField = uieditfield(app.UIFigure, 'numeric');
            app.d_SmmEditField.ValueDisplayFormat = '%11.9g';
            app.d_SmmEditField.Editable = 'off';
            app.d_SmmEditField.HorizontalAlignment = 'left';
            app.d_SmmEditField.Position = [1663 876 92 27];

            % Create A_Smm2EditFieldLabel
            app.A_Smm2EditFieldLabel = uilabel(app.UIFigure);
            app.A_Smm2EditFieldLabel.Interpreter = 'latex';
            app.A_Smm2EditFieldLabel.HorizontalAlignment = 'right';
            app.A_Smm2EditFieldLabel.Position = [1392 822 64 22];
            app.A_Smm2EditFieldLabel.Text = '$A_S\ [mm^2]$';

            % Create A_Smm2EditField
            app.A_Smm2EditField = uieditfield(app.UIFigure, 'numeric');
            app.A_Smm2EditField.ValueDisplayFormat = '%11.9g';
            app.A_Smm2EditField.Editable = 'off';
            app.A_Smm2EditField.HorizontalAlignment = 'left';
            app.A_Smm2EditField.Position = [1470 820 92 27];

            % Create F_ASNEditFieldLabel
            app.F_ASNEditFieldLabel = uilabel(app.UIFigure);
            app.F_ASNEditFieldLabel.Interpreter = 'latex';
            app.F_ASNEditFieldLabel.HorizontalAlignment = 'right';
            app.F_ASNEditFieldLabel.Position = [1210 729 57 22];
            app.F_ASNEditFieldLabel.Text = '$F_{AS}\ [N]$';

            % Create F_ASNEditField
            app.F_ASNEditField = uieditfield(app.UIFigure, 'numeric');
            app.F_ASNEditField.ValueDisplayFormat = '%11.9g';
            app.F_ASNEditField.Editable = 'off';
            app.F_ASNEditField.HorizontalAlignment = 'left';
            app.F_ASNEditField.Position = [1282 726 92 27];

            % Create F_SminNEditFieldLabel
            app.F_SminNEditFieldLabel = uilabel(app.UIFigure);
            app.F_SminNEditFieldLabel.Interpreter = 'latex';
            app.F_SminNEditFieldLabel.HorizontalAlignment = 'right';
            app.F_SminNEditFieldLabel.Position = [1388 677 68 22];
            app.F_SminNEditFieldLabel.Text = '$F_{S,min}\ [N]$';

            % Create F_SminNEditField
            app.F_SminNEditField = uieditfield(app.UIFigure, 'numeric');
            app.F_SminNEditField.ValueDisplayFormat = '%11.9g';
            app.F_SminNEditField.Editable = 'off';
            app.F_SminNEditField.HorizontalAlignment = 'left';
            app.F_SminNEditField.Position = [1471 674 92 27];

            % Create F_SmaxNEditFieldLabel
            app.F_SmaxNEditFieldLabel = uilabel(app.UIFigure);
            app.F_SmaxNEditFieldLabel.Interpreter = 'latex';
            app.F_SmaxNEditFieldLabel.HorizontalAlignment = 'right';
            app.F_SmaxNEditFieldLabel.Position = [1386 647 70 22];
            app.F_SmaxNEditFieldLabel.Text = '$F_{S,max}\ [N]$';

            % Create F_SmaxNEditField
            app.F_SmaxNEditField = uieditfield(app.UIFigure, 'numeric');
            app.F_SmaxNEditField.ValueDisplayFormat = '%11.9g';
            app.F_SmaxNEditField.Editable = 'off';
            app.F_SmaxNEditField.HorizontalAlignment = 'left';
            app.F_SmaxNEditField.Position = [1471 644 92 27];

            % Create mu_minEditFieldLabel
            app.mu_minEditFieldLabel = uilabel(app.UIFigure);
            app.mu_minEditFieldLabel.Interpreter = 'latex';
            app.mu_minEditFieldLabel.BackgroundColor = [1 1 0.0667];
            app.mu_minEditFieldLabel.HorizontalAlignment = 'right';
            app.mu_minEditFieldLabel.Position = [1238 467 30 22];
            app.mu_minEditFieldLabel.Text = '$\mu_{min}$';

            % Create mu_minEditField
            app.mu_minEditField = uieditfield(app.UIFigure, 'numeric');
            app.mu_minEditField.ValueDisplayFormat = '%11.9g';
            app.mu_minEditField.Editable = 'off';
            app.mu_minEditField.HorizontalAlignment = 'left';
            app.mu_minEditField.BackgroundColor = [1 1 0.0667];
            app.mu_minEditField.Position = [1283 464 92 27];

            % Create mu_maxEditFieldLabel
            app.mu_maxEditFieldLabel = uilabel(app.UIFigure);
            app.mu_maxEditFieldLabel.Interpreter = 'latex';
            app.mu_maxEditFieldLabel.BackgroundColor = [1 1 0.0667];
            app.mu_maxEditFieldLabel.HorizontalAlignment = 'right';
            app.mu_maxEditFieldLabel.Position = [1423 467 32 22];
            app.mu_maxEditFieldLabel.Text = '$\mu_{max}$';

            % Create mu_maxEditField
            app.mu_maxEditField = uieditfield(app.UIFigure, 'numeric');
            app.mu_maxEditField.ValueDisplayFormat = '%11.9g';
            app.mu_maxEditField.Editable = 'off';
            app.mu_maxEditField.HorizontalAlignment = 'left';
            app.mu_maxEditField.BackgroundColor = [1 1 0.0667];
            app.mu_maxEditField.Position = [1470 464 92 27];

            % Create sigma_maxEditFieldLabel
            app.sigma_maxEditFieldLabel = uilabel(app.UIFigure);
            app.sigma_maxEditFieldLabel.Interpreter = 'latex';
            app.sigma_maxEditFieldLabel.HorizontalAlignment = 'right';
            app.sigma_maxEditFieldLabel.Position = [1423 545 32 22];
            app.sigma_maxEditFieldLabel.Text = '$\sigma_{max}$';

            % Create sigma_maxEditField
            app.sigma_maxEditField = uieditfield(app.UIFigure, 'numeric');
            app.sigma_maxEditField.ValueDisplayFormat = '%11.9g';
            app.sigma_maxEditField.Editable = 'off';
            app.sigma_maxEditField.HorizontalAlignment = 'left';
            app.sigma_maxEditField.Position = [1470 542 92 27];

            % Create sigma_minEditFieldLabel
            app.sigma_minEditFieldLabel = uilabel(app.UIFigure);
            app.sigma_minEditFieldLabel.Interpreter = 'latex';
            app.sigma_minEditFieldLabel.HorizontalAlignment = 'right';
            app.sigma_minEditFieldLabel.Position = [1237 545 30 22];
            app.sigma_minEditFieldLabel.Text = '$\sigma_{min}$';

            % Create sigma_minEditField
            app.sigma_minEditField = uieditfield(app.UIFigure, 'numeric');
            app.sigma_minEditField.ValueDisplayFormat = '%11.9g';
            app.sigma_minEditField.Editable = 'off';
            app.sigma_minEditField.HorizontalAlignment = 'left';
            app.sigma_minEditField.Position = [1282 542 92 27];

            % Create ErrorLampLabel
            app.ErrorLampLabel = uilabel(app.UIFigure);
            app.ErrorLampLabel.HorizontalAlignment = 'right';
            app.ErrorLampLabel.Position = [1372 409 32 22];
            app.ErrorLampLabel.Text = 'Error';

            % Create ErrorLamp
            app.ErrorLamp = uilamp(app.UIFigure);
            app.ErrorLamp.Position = [1419 409 20 20];
            app.ErrorLamp.Color = [0.8 0.8 0.8];

            % Create ErrorLamp_2Label
            app.ErrorLamp_2Label = uilabel(app.UIFigure);
            app.ErrorLamp_2Label.HorizontalAlignment = 'right';
            app.ErrorLamp_2Label.Position = [400 345 32 22];
            app.ErrorLamp_2Label.Text = 'Error';

            % Create LaTeXExportErrorLamp
            app.LaTeXExportErrorLamp = uilamp(app.UIFigure);
            app.LaTeXExportErrorLamp.Position = [447 345 20 20];
            app.LaTeXExportErrorLamp.Color = [0.8 0.8 0.8];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = KON_Schraubentool

            runningApp = getRunningApp(app);

            % Check for running singleton app
            if isempty(runningApp)

                % Create UIFigure and components
                createComponents(app)

                % Register the app with App Designer
                registerApp(app, app.UIFigure)

                % Execute the startup function
                runStartupFcn(app, @startupFcn)
            else

                % Focus the running singleton app
                figure(runningApp.UIFigure)

                app = runningApp;
            end

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end