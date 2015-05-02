function [ Ausgabe ] = DurchsuchenWAV( PATH, gesucht, AusOrdner)
% Programmieraufgabe 1 - DurchsuchenWAV
% -------------------------------------------------------------------------
% Diese Funktion hat den Nutzen, die vorhandene Datenbank nach Audiodateien 
% zu durchsuchen.
%
% Usage: DurchsuchenWAV( PATH, gesucht, AusOrdner)
%
% Input Parameter
% PATH        : Ordner, der durchsucht wird
% gesucht     : Suchbegriff
% AusOrdner   : Pfad des Ordners, in dem die Datenbank ist
%
% Output Paramter
% Ausgabe     : Antwort auf die Abrage, wo die gesuchte Audiodatei zu
%               finden ist

%##########################################################################
%Author: T. Kalmer, J. Schmidt, M. Sydow
%History: Version 1.0
%Date: 01.05.15
%
%This Code is General Public License
%##########################################################################

% Im angegebenen Ordner werden WAV-Dateien gesucht
FILES = dir([PATH '*.txt']); 

% Anzahl der vorhandenen WAV-Dateien wird in der Variable
% 'NUMBER' gespeichert.
NUMBER = size (FILES);

GesAdresse = [AusOrdner,'\', PATH]; % Pfad wird angepasst
gesuchtWhiteSpace = ['\s(',gesucht, ')\s']; % Das Wort wird begrenz

% Variablen werden angelegt
Counter = 1;
Zaehler = 1;
FuerAusgabe = '';

% In dieser while-Schleife werden alle gefundenen Dateien durchsucht.
while Counter < NUMBER(1)
    Struct = FILES(Counter);
    Name = Struct.name; % Der Dateiname wird in Name gespeichert
    
    % Es wird in den Ordner gegangen, der durchsucht worden ist
    cd(GesAdresse);
    
    % Datei wird geöffnet, 'r' gibt an, dass die Datei zum Lesen 
    % geöffnet wird
    file = fopen(Name,'r'); 
    data = fgetl(file); % Liest eine ganze Zeile ein
    
    % Das gefragte Wort wird gesucht
    a = regexpi(data , gesuchtWhiteSpace ,'match'); 
    
    % Textdatei wird in eine Wavdatei umgeändert
    newname = strrep(Name,'.txt','.wav');
    
       % Ausgabe, wenn das Kriterium gefunden wird
    if length(a) > 0
        str1 = 'Die Eingabe "';
        str2 = '" ist in der Audiodatei "';
        str3 = '" enthalten. ';
        FuerAusgabe = ([FuerAusgabe, str1, gesucht, ...
                        str2 , newname, str3 char(13) ]);
        Zaehler = Zaehler + 1;
    end
    cd(AusOrdner);
    Counter = Counter+1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if Zaehler == 1
    
    % Im angegebenen Ordner werden PHN-Dateien gesucht
    FILES = dir([PATH '*.phn']); 
    gesuchtWhiteSpace = ['\s(',gesucht, ')\s']; % Das Wort wird begrenzt
    
    % Anzahl der vorhandenen PHN-Dateien wird in der Variable 
    % 'NUMBER' gespeichert.
    NUMBER = size (FILES);
    GesAdresse = [AusOrdner,'\', PATH]; % Pfad wird angepasst
    
    % Variablen anlegen
    Counter = 1;
    Zaehler = 1;
    FuerAusgabe = '';
    
    while Counter < NUMBER(1) % Die PHN-Dateien werden durchlaufen
        Struct = FILES(Counter);
        % Der Dateiname wird in Name gespeichert
        Name = Struct.name;
        % Es wird in den Ordner gegangen, der durchsucht worden ist
        cd(GesAdresse);
        
        % Datei wird geöffnet, 'r' gibt an, dass die Datei zum Lesen 
        % geöffnet wird
        file = fopen(Name,'r'); 
        data = fscanf(file,'%c',inf);
        
        % Das gefragte Wort wird gesucht
        a = regexpi(data , gesuchtWhiteSpace ,'match'); 
        
        % Ausgabe, wenn das Kriterium gefunden wird
        if isempty(a) > 0
            str1 = 'Die Eingabe "';
            str2 = '" ist ein Phonem und in der Datei "';
            str3 = '" enthalten. ';
            FuerAusgabe = ([FuerAusgabe, str1, gesucht, str2 , Name, str3 char(13) ]);
            Zaehler = Zaehler + 1;
        end
        cd(AusOrdner);
        Counter = Counter + 1;
    end
    
    % Anweisung, die ausgeben soll, ob (und wo) ein Kriterium in dem 
    % jeweiligen Ordner gefunden wurde oder nicht.
    if Zaehler == 1
       Ausgabe = (['In dem Ordner "', PATH, ... 
                 '" ist die gesuchte Eingabe nicht enthalten.', char(13)]);
    else
        Ausgabe = (['Funde in dem Ordner "', PATH, ...
                    '":', char(13), FuerAusgabe]);
    end
else
    Ausgabe=['Funde in dem Ordner "', PATH, '":', char(13), FuerAusgabe];
end
end

