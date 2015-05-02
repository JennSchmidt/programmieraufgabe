function [ Ausgabe ] = OrdnersucheWRD(  Ordner, AusOrdner)
% Programmieraufgabe 1 - OrdnersucheWRD
% -------------------------------------------------------------------------
% Diese Funktion hat den Nutzen, den aktuellen Ordner nach Phonemen zu
% durchsuchen.
%
% Usage: OrdnersucheWRD( PATH, gesucht, AusOrdner)
%
% Input Parameter
% Ordner    : aktueller Ordner, in dem nach Dateien gesucht werden soll
% AusOrdner : Pfad des Ordners, in dem die Datenbank ist
%
% Output Paramter
% Ausgabe   : Antwort auf die Abrage, ob und wo Textdateien im Ordner sind

%##########################################################################
%Author: T. Kalmer, J. Schmidt, M. Sydow
%History: Version 1.0
%Date: 01.05.15
%
%This Code is General Public License
%##########################################################################


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

PATH = cell2mat(liste(Ordner));
% PATH=liste(Ordner);
FILES = dir([PATH '*.wrd']); % Im angegebenen Ordner werden WRD-Dateien gesucht

% Anzahl der vorhandenen WRD-Dateien wird in der Variable 'NUMBER' gespeichert.
NUMBER = size (FILES);

GesAdresse = [AusOrdner,'\', PATH];

Counter = 1;
FuerAusgabe = '';

% Alle gefundenen Dateien werden durchsucht
while Counter < NUMBER(1)
    % Der Dateiname wird in Name gespeichert
    Struct = FILES(Counter);
    Name = Struct.name;
    % Es wird in den Ordner gegangen, der durchsucht worden ist
    cd(GesAdresse);
    file = fopen(Name,'r'); % Datei wird geöffnet, 'r' gibt an das die Datei zum lesen geöffnet wird
    data = fscanf(file,'%c',[inf]);
    str = 'Dateiname: ';
    str2 = '. Mit dem Inhalt: ';
    FuerAusgabe = [FuerAusgabe, str, Name, str2, char(13), data, char(13)];
    % Ausgabe, wenn was gefunden wird
    cd(AusOrdner);
    Counter = Counter + 1;
end
Ausgabe = ['In dem Ordner "',PATH,'" sind folgende WRD-Dateien enthalte:', char(13), FuerAusgabe];
end