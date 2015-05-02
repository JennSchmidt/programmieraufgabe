function [Ausgabe] = DatenbankDurchsuchen(gesucht, gesuchtNach, AusOrdner, vonOrdner, bisOrdner)
% Programmieraufgabe 1 - DatenbankDurchsuchen
% -------------------------------------------------------------------------
% Diese Funktion hat den Nutzen, die vorhandene Datenbank nach den, vom
% User eingegebenen, Parametern, zu durchsuchen
%
% Usage: DatenbankDurchsuchen(gesucht, gesuchtNach, AusOrdner , vonOrdner, bisOrdner)
%
% Input Parameter
% gesucht     : Suchbegriff
% gesuchtNach : wonach gesucht wird (Phonem, Text, Wort, Satz, Audiodatei)
% AusOrdner   : Pfad des Ordners, in dem die Datenbank ist
% vonOrdner   : von welchem Ordner (der Person)
% bisOrdner   : bis zu welchem Ordner (der Person)
%
% Output Paramter
% Ausgabe     : Antwort auf die Abfrage, nach welchem Kriterium gesucht
%               werden soll

%##########################################################################
%Author: T. Kalmer, J. Schmidt, M. Sydow
%History: Version 1.0
%Date: 01.05.15
%
%This Code is General Public License
%##########################################################################

cd(AusOrdner); % Es wird in den Ordner gesprungen

% F�r die manuelle Durchsuchung der Ordner, werden die Variablen angepasst.
% 1. Bedingung: Wenn nur ein Ordner durchsucht werden soll
% 2. Bedingung: Wenn von einem bestimmten Ordner bis zu einen bestimmten
% Ordner durchsucht werden soll
if bisOrdner == 0
    bisOrdner = vonOrdner+1;
else 
    bisOrdner = bisOrdner+1;
end

% Nummerierung der vorhandenen Ordner von 1 bis 16, f�r den sp�teren
% Zugriff
liste{1} = 'dr1-fvmh0\';
liste{2} = 'dr1-mcpm0\';
liste{3} = 'dr2-faem0\';
liste{4} = 'dr2-marc0\';
liste{5} = 'dr3-falk0\';
liste{6} = 'dr3-madc0\';
liste{7} = 'dr4-falr0\';
liste{8} = 'dr4-maeb0\';
liste{9} = 'dr5-ftlg0\';
liste{10} = 'dr5-mbgt0\';
liste{11} = 'dr6-fapb0\';
liste{12} = 'dr6-mbma1\';
liste{13} = 'dr7-fblv0\';
liste{14} = 'dr7-madd0\';
liste{15} = 'dr8-fbcg1\';
liste{16} = 'dr8-mbcg0\';

% Anweisung, in der nach Phonemen .PHN gesucht werden soll
if gesuchtNach == 1
    Platz = 1; % F�r die Ausgabe wird ein Counter angelegt
    
    % Die Schleife wird so lange durchlaufen, bis alle ausgew�hlten Ordner
    % durchsucht wurden:
    while vonOrdner < bisOrdner 
        
        % Zu durchsuchender Ordner wird in die Variable 'PATH' gespeichert
        PATH = cell2mat(liste(vonOrdner)); 
        
        % Der zu durchsuchende Ordner wird nach Phonemen durchsucht und die
        % Antwort in der Ausgabe bei jedem Durchlauf einen Platz
        % weiter gespeichert, um die Ausgabe des vorherigen Durchlaufs
        % nicht zu �berspeichern.
        Ausgabe{Platz} = DurchsuchenPHN(PATH, gesucht, AusOrdner);
        
        % vonOrdner wird hoch gez�hlt, um den n�chsten Ordner zu durchsuchen
        vonOrdner = vonOrdner + 1;
        
        % Platz wird hoch gez�hlt, um die n�chste Antwort in der Ausgabe
        % einen Platz weiter zu speichern.
        Platz = Platz + 1;
    end
    Ausgabe = cell2mat(Ausgabe); % Die ferige Ausgabe wird generiert
end

% Anweisung, in der nach W�rtern .WRD gesucht werden soll
if gesuchtNach == 2
    Platz = 1;
    while vonOrdner < bisOrdner
        PATH = cell2mat(liste(vonOrdner));
        Ausgabe{Platz} = DurchsuchenWRD( PATH, gesucht, AusOrdner);
        vonOrdner = vonOrdner+1;
        Platz = Platz + 1;
    end
    Ausgabe = cell2mat(Ausgabe);
end

% Anweisung, in der nach Texten .TXT gesucht werden soll
if gesuchtNach == 3
    Platz = 1;
    while vonOrdner < bisOrdner
        PATH = cell2mat(liste(vonOrdner));
        Ausgabe{Platz} = DurchsuchenTXT( PATH, gesucht, AusOrdner);
        vonOrdner = vonOrdner + 1;
        Platz = Platz + 1;
    end
    Ausgabe = cell2mat(Ausgabe);
end

% Anweisung, in der nach Audiodateien .WAV gesucht werden soll
if gesuchtNach == 4
    Platz = 1;
    while vonOrdner < bisOrdner
        PATH = cell2mat(liste(vonOrdner)); % Zu durchsuchender Ordner
        Ausgabe{Platz} = DurchsuchenWAV( PATH, gesucht, AusOrdner);
        vonOrdner = vonOrdner + 1;
        Platz = Platz + 1;
    end
    Ausgabe = cell2mat(Ausgabe);
end

% Anweisung, in der nach allen Kriterien gesucht werden soll
if gesuchtNach == 5
    Platz = 1;
    while vonOrdner < bisOrdner
        PATH = cell2mat(liste(vonOrdner)); % Zu durchsuchender Ordner
        Ausgabe{Platz} = DurchsuchenPHN( PATH, gesucht, AusOrdner);
        Platz = Platz + 1;
        Ausgabe{Platz} = DurchsuchenWRD( PATH, gesucht, AusOrdner);
        Platz = Platz + 1;
        Ausgabe{Platz} = DurchsuchenTXT( PATH, gesucht, AusOrdner);
        Platz = Platz + 1;
        Ausgabe{Platz} = DurchsuchenWAV( PATH,gesucht, AusOrdner);
        Platz = Platz + 1;
        vonOrdner = vonOrdner + 1;
    end
    Ausgabe = cell2mat(Ausgabe);
end
end