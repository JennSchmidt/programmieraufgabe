% Programmieraufgabe 1
% -------------------------------------------------------------------------
% Dieses Scrpit ist ein Framework, mit dem auf Dateien und
% Dateienausschnitte aus der MIT/TIMIT - Datenbank zugegriffen werden kann.
% Diese Datenbank ist durchsuchbar nach:
% Aufnahmen einer Person, eines Satzes, eines Wortes und eines Phonems. 
% Dabei ist es möglich zusätzlich nach Kombinationen dieser Kriterien zu 
% suchen.
%
% Nach Ausführung wird der User vom Programm, mithilfe von Abragen,
% begleitet, um zum Ziel nach seiner Suche in dieser Datenbank zu gelangen.
%
% Usage: eingabe

%##########################################################################
%Author: T. Kalmer, J. Schmidt, M. Sydow
%History: Version 1.0
%Date: 01.05.15
%
%This Code is General Public License
%##########################################################################
close all
clear all

% Abfrage, ob nach einem bestimmten Kriterium oder nach Inhalte eines
% Ordners gesucht werden soll
a = input(['\n\nMöchten Sie nach einem Wort, Text oder Phonem suchen, \n',...
    'geben Sie eine 1 ein und bestätigen Sie mit Enter. \n',...
    'Möchten Sie die Inhalte eines Ordners durchsuchen, \n',...
    'geben Sie eine 2 ein und bestätigen Sie mit Enter.']);

% Fehlermeldung, falls die 'a'-Eingabe leer war
while isempty (a)
    a = input('Die Eingabe war nicht korrekt. \nBitte geben Sie keine leere Eingabe ein!');
end

% Falls die 'a'-Eingabe vom User falsch eingegeben wurde, gibt das Programm
% eine Fehlermeldung und einen dementsprechenden Hinweis aus.
while (isempty(a)) || (a > 3) || (a < 1)
    a = input('Die Eingabe war nicht korrekt. \nBitte geben Sie eine Zahl zwischen 1 und 2 ein!');
end


% Pfad eingeben, in der die Datenbank vorhanden ist.
% (Beispiel:  C:\Users\Jenn\Dropbox\Matlabprojekt\Jenn\timit)
ausOrdner = input('\n\n Geben Sie den Pfad an, des Ordners "Gruppenaufgabe": ','s');

% Fehlermeldung, falls die 'AusOrdner'-Eingabe leer war
while isempty (ausOrdner)
    ausOrdner = input('Die Eingabe war nicht korrekt. \nBitte geben Sie keine leere Eingabe ein!' ,'s');
end

% Wurde bei der Abfrage, nach der Art der Suche, Nr 1 gewählt, wird nun
% gefragt, nach welchem Kriterium gesucht werden soll.
if a == 1
    gesuchtNach = input(['\nWonach möchten Sie suchen? \n\n',...
        'Phoneme - geben Sie eine 1 ein. \n',...
        'Wörter - geben Sie eine 2 ein. \n',...
        'Satz oder Text - geben Sie eine 3 ein. \n',...
        'Phonem, Wort, Satz oder Text aus Audiodatei - ', ...
        'geben Sie eine 4 ein. \n',...
        'Nach allem - geben Sie eine 5 ein. \n',...
        '\nBestätigen Sie Ihre Eingabe mit Enter. ']);
    
    % Fehlermeldung, falls die 'gesuchtNach'-Eingabe leer war
    while isempty (gesuchtNach)
        gesuchtNach = input('Die Eingabe war nicht korrekt. \nBitte geben Sie keine leere Eingabe ein!');
    end
    
    % Falls die Eingaben vom User falsch eingegeben wurde, gibt das Programm
    % eine Fehlermeldung und einen dementsprechenden Hinweis aus.
    while (isempty (gesuchtNach)) || (gesuchtNach > 5) || (gesuchtNach < 1)
        gesuchtNach = input('Die Eingabe war nicht korrekt. \nBitte geben Sie eine Zahl zwischen 1 und 5 ein.');
    end
    
    % Wurde bei der Abfrage nach der Art der Suche Nr 2 gewählt, wird nun
    % gefragt, welcher Ordner durchsucht werden soll.
    if 0 < gesuchtNach && gesuchtNach < 5
        
        % Pfad eingeben, in der die Datenbank vorhanden ist
        gesucht = input('\n\nGeben Sie Ihren Suchbegriff ein: ' ,'s');
        
        % Fehlermeldung, falls die 'gesucht'-Eingabe leer war
        while isempty (gesucht)
            gesucht = input('Die Eingabe war nicht korrekt. \nBitte geben Sie keine leere Eingabe ein!' , 's');
        end
        
        % Abfrage, ob nach bestimmten oder nach allen Ordnern gesucht
        % werden soll.
        Ordner = input(['\n\nMöchten Sie bestimmte Ordner', ...
            ' durchsuchen, drücken Sie die 1. \n',...
            'Möchten Sie alle Ordner', ...
            ' durchsuchen, drücken Sie die 2.\n',...
            '\nBestätigen Sie Ihr Eingabe mit Enter.']);
        
        % Fehlermeldung, falls die 'Ordner'-Eingabe leer war
        while isempty (Ordner)
            Ordner = input('Die Eingabe war nicht korrekt. \nBitte geben Sie keine leere Eingabe ein!');
        end
        
        % Falls die 'Ordner'-Eingaben vom User falsch eingegeben wurde,
        % gibt das Programm eine Fehlermeldung und einen dementsprechenden
        % Hinweis aus.
        while (isempty (Ordner)) || (Ordner > 3) || (Ordner < 1)
            a=input('Die Eingabe war nicht korrekt. \nBitte geben Sie eine Zahl zwischen 1 und 2 ein.');
        end
        
        if Ordner == 1
            fprintf('Zur Auswahl stehen folgende Ordner:\n');
            fprintf('1 = dr1-fvmh0\n');
            fprintf('2 = dr1-mcpm0\n');
            fprintf('3 = dr2-faem0\n');
            fprintf('4 = dr2-marc0\n');
            fprintf('5 = dr3-falk0\n');
            fprintf('6 = dr3-madc0\n');
            fprintf('7 = dr4-falr0\n');
            fprintf('8 = dr4-maeb0\n');
            fprintf('9 = dr5-ftlg0\n');
            fprintf('10 = dr5-mbgt0\n');
            fprintf('11 = dr6-fapb0\n');
            fprintf('12 = dr6-mbma1\n');
            fprintf('13 = dr7-fblv0\n');
            fprintf('14 = dr7-madd0\n');
            fprintf('15 = dr8-fbcg1\n');
            fprintf('16 = dr8-mbcg0\n');
            
            % Falls nach bestimmten Ordnern gesucht wird, muss der User nun
            % den Anfangs- und Endordner angeben. Wenn der User nur einen
            % einzigen Ordner durchsuchen möchte, wird dieser ebenfalls
            % danach gefragt.
            fprintf('Bitte geben Sie 2 Zahlen ein und bestätigen Sie mit Enter. \n');
            fprintf('Die erste Zahl gibt den Anfangsordner der zu durchsuchenden Ordner an \n');
            fprintf('und die zweite Zahl gibt den Endordner an.\n ');
            fprintf('Möchten Sie nur einen Ordner durchsuchen, geben Sie als zweite Zahl eine Null an. \n');
            fprintf('Bestätigen Sie Ihre Eingabe mit Enter.\n');
            vonOrdner = input('Anfangsordner: ');
            bisOrdner = input('Endordner: ');
            DatenbankDurchsuchen(gesucht, gesuchtNach, ausOrdner, ...
                vonOrdner, bisOrdner)
            
            % Fehlermeldung, falls die 'vonOrdner'-Eingabe leer war
            while isempty (vonOrdner)
                vonOrdner=input('Die Eingabe bei ''Anfangsordner'' war nicht korrekt. Bitte geben Sie eine Zahl zwischen 1 und 16 sein.');
            end
            
            % Fehlermeldung, falls die 'bisOrdner'-Eingabe leer war
            while isempty (bisOrdner)
                bisOrdner=input('Die Eingabe bei ''Endordner'' war nicht korrekt. Bitte geben Sie eine Zahl zwischen 1 und 16 sein.');
            end
            
            % Falls die 'vonOrdner'-Eingaben vom User falsch eingegeben
            % wurde, gibt das Programm  eine Fehlermeldung und einen
            % dementsprechenden Hinweis aus.
            while vonOrdner > 17 || vonOrdner < 0
                vonOrdner=input('Die Eingabe bei ''Anfangsordner'' war nicht korrekt. Bitte geben Sie eine Zahl zwischen 1 und 16 sein.');
            end
            
            % Falls die 'bisOrdner'-Eingaben vom User falsch eingegeben
            % wurde, gibt das Programm eine Fehlermeldung und einen
            % dementsprechenden Hinweis aus.
            while bisOrdner > 17 || bisOrdner < 0
                bisOrdner=input('Die Eingabe bei ''Endordner'' war nicht korrekt. Bitte geben Sie eine Zahl zwischen 1 und 16 sein.');
            end
            
        elseif Ordner == 2
            DatenbankDurchsuchen( gesucht, gesuchtNach, ausOrdner ,1, 16)
        end
        
        % Falls das gesuchte Kriterium in allen Ordnern gesucht werden soll,
        % wird der User daran erinnert, dass nur maximal 7 Ordner
        % gleichzeitig aufgerufen werden dürfen.
    elseif gesuchtNach == 5
        fprintf('Bitte beachten Sie, dass maximal 7 Ordner gleichzeitig abgerufen werden können, \n');
        fprintf('da der Prozess sonst zu komplex ist.\n');
        fprintf('Zur Auswahl stehen folgende Ordner,:\n');
        fprintf('1 = dr1-fvmh0\n');
        fprintf('2 = dr1-mcpm0\n');
        fprintf('3 = dr2-faem0\n');
        fprintf('4 = dr2-marc0\n');
        fprintf('5 = dr3-falk0\n');
        fprintf('6 = dr3-madc0\n');
        fprintf('7 = dr4-falr0\n');
        fprintf('8 = dr4-maeb0\n');
        fprintf('9 = dr5-ftlg0\n');
        fprintf('10 = dr5-mbgt0\n');
        fprintf('11 = dr6-fapb0\n');
        fprintf('12 = dr6-mbma1\n');
        fprintf('13 = dr7-fblv0\n');
        fprintf('14 = dr7-madd0\n');
        fprintf('15 = dr8-fbcg1\n');
        fprintf('16 = dr8-mbcg0\n');
        
        % Da nur maximal 7 Ordner gleichzeitig durchsucht werden können,
        % wird erneut nach dem Anfangs- und Endordner bei der bestimmten
        % Suche nach Ordnern gefragt.
        fprintf('\nBitte geben Sie 2 Zahlen ein und bestätigen Sie mit Enter.\n');
        fprintf('Die erste Zahl gibt den Anfangsordner der zu durchsuchenden \n');
        fprintf('Ordner an und die zweite Zahl gibt den Endordner an.\n');
        fprintf('Möchten Sie nur einen Ordner durchsuchen, geben Sie als zweite Zahl eine Null an.\n');
        fprintf('\nBestätigen Sie Ihre Eingabe mit Enter.\n');
        vonOrdner = input('Anfangsordner: ');
        bisOrdner = input('Endordner: ');
        
        % Fehlermeldung, falls die 'vonOrdner'-Eingabe leer war
        while isempty (vonOrdner)
            vonOrdner=input('Die Eingabe bei ''Anfangsordner'' war nicht korrekt. Bitte geben Sie keine leere Eingabe ein!');
        end
        
        % Fehlermeldung, falls die 'bisOrdner'-Eingabe leer war
        while isempty (bisOrdner)
            bisOrdner=input('Die Eingabe bei ''Endordner'' war nicht korrekt. Bitte geben Sie keine leere Eingabe ein!');
        end
        
        % Falls die 'vonOrdner'-Eingaben vom User falsch eingegeben
        % wurde, gibt das Programm  eine Fehlermeldung und einen
        % dementsprechenden Hinweis aus.
        while (isempty(vonOrdner)) || (vonOrdner > 17) || (vonOrdner < 0)
            vonOrdner=input('Die Eingabe bei ''Anfangsordner'' war nicht korrekt. \nBitte geben Sie eine Zahl zwischen 1 und 16 ein.');
        end
        
        % Falls die 'bisOrdner'-Eingaben vom User falsch eingegeben
        % wurde, gibt das Programm  eine Fehlermeldung und einen
        % dementsprechenden Hinweis aus.
        while (isempty(bisOrdner)) || (bisOrdner > 17) || (bisOrdner < 0)
            bisOrdner = input('Die Eingabe bei ''Endordner'' war nicht korrekt. \nBitte geben Sie eine Zahl zwischen 1 und 16 ein.');
        end
        
        AnzahlOrdner = (vonOrdner : bisOrdner);
        % Diese Anweisung soll eine Fehlermeldung widergeben, falls der
        % User eine Zahl größer als 8 eingegeben hat. Grund dafür ist, dass
        % nur 7 Ordner zeitgleich durchsucht werden können. Somit wird ein
        % Absturz des Programmes vermieden.
        while (isempty(AnzahlOrdner)) || (length(AnzahlOrdner) > 8)
            fprintf('Die Eingabe war nicht korrekt. \nBitte beachten Sie, dass nur maximal 7 Ordner ausgewählt werden dürfen: \n');
            vonOrdner = input('Anfangsordner: ');
            bisOrdner = input('Endordner: ');
            
            AnzahlOrdner = (vonOrdner : bisOrdner);
            if length(AnzahlOrdner) < 8
                continue
            end
           
        end
        
        % Eingabe des Textes/Wortes/Satzes/Phonems / der Audiodatei, nach
        % dem/der gesucht werden soll.
        gesucht = input('Geben Sie Ihren Suchbegriff ein: ', 's');
        
        DatenbankDurchsuchen(gesucht, gesuchtNach, ausOrdner, vonOrdner, bisOrdner)
        
        % Fehlermeldung, falls die 'gesucht'-Eingabe leer war
        while isempty (gesucht)
            gesucht = input('Die Eingabe war nicht korrekt. \nBitte geben Sie keine leere Eingabe ein!', 's');
        end
    else
        fprintf('FEEEHLEEEER' );
    end
    
    % Falls das gesuchte Kriterium nur in einem bestimmten Ordner gesucht
    % soll, wird der User nach dem jeweiligen gefragt.
elseif a == 2
    fprintf('Zur Auswahl stehen folgende Ordner:\n');
    fprintf('1 = dr1-fvmh0\n');
    fprintf('2 = dr1-mcpm0\n');
    fprintf('3 = dr2-faem0\n');
    fprintf('4 = dr2-marc0\n');
    fprintf('5 = dr3-falk0\n');
    fprintf('6 = dr3-madc0\n');
    fprintf('7 = dr4-falr0\n');
    fprintf('8 = dr4-maeb0\n');
    fprintf('9 = dr5-ftlg0\n');
    fprintf('10 = dr5-mbgt0\n');
    fprintf('11 = dr6-fapb0\n');
    fprintf('12 = dr6-mbma1\n');
    fprintf('13 = dr7-fblv0\n');
    fprintf('14 = dr7-madd0\n');
    fprintf('15 = dr8-fbcg1\n');
    fprintf('16 = dr8-mbcg0\n');
    Ordner = input('\nGeben Sie die entsprechende Zahl ein und bestätigen Sie mit Enter. ');
    
    % Fehlermeldung, falls die 'Ordner'-Eingabe leer war
    while isempty (Ordner)
        Ordner = input('Die Eingabe war nicht korrekt. \nBitte geben Sie keine leere Eingabe ein!.');
    end
    
    % Falls die 'Ordner'-Eingabe vom User falsch eingegeben wurde, gibt das Programm
    % eine Fehlermeldung und einen dementsprechenden Hinweis aus.
    while (isempty(Ordner)) || (Ordner > 17) || (Ordner < 1)
        Ordner = input('Die Eingabe war nicht korrekt. \nBitte geben Sie eine Zahl zwischen 1 und 16 ein.');
    end
    
    % Abfrage, nach welchem Kriteriem im gesuchten Ordner gesucht werden
    % soll.
    SucheNach = input(['\n\nNach welchem Dateityp soll der Ordner durchsucht werden? \n',...
        '1 = TXT-Dateien \n',...
        '2 = WAV-Dateien \n',...
        '3 = WRD-Dateien \n',...
        '4 = PHN-Dateien \n',...
        'Geben Sie die entsprechende Zahl ein und bestätigen Sie mit Enter. ']);
    
    % Fehlermeldung, falls die 'SucheNach'-Eingabe leer war
    while isempty (SucheNach)
        SucheNach=input('Die Eingabe war nicht korrekt. \nBitte geben Sie keine leere Eingabe ein!');
    end
    
    % Falls die 'SucheNach'-Eingaben vom User falsch eingegeben wurde, gibt das Programm
    % eine Fehlermeldung und einen dementsprechenden Hinweis aus.
    while (isempty (SucheNach)) || (SucheNach > 4) || (SucheNach < 1)
        SucheNach=input('Die Eingabe war nicht korrekt. \nBitte geben Sie eine Zahl zwischen 1 und 4 ein.');
    end
    
    % Je nachdem, nach welchem Kriterium gesucht wird, werden diese in den
    % dementsprechenden Ordnern / im dementsprechenden Ordner gesucht und
    % angezeigt.
    if SucheNach == 1
        OrdnersucheTXT( Ordner, ausOrdner)
    elseif SucheNach == 2
        OrdnersucheWAV( Ordner, ausOrdner)
    elseif SucheNach == 3
        OrdnersucheWRD( Ordner, ausOrdner)
    elseif SucheNach == 4
        OrdnersuchePHN( Ordner, ausOrdner)
    end
end