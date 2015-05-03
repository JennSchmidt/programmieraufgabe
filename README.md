#Programmierprojekt
##Funktion des Projekts
Mithilfe des erarbeiteten Projekts kann die gegebene Datenbank nach den Aufnahmen einer Person, eines Satzes, eines Wortes, eines Phonems, sowie nach Kombinationen dieser Aufnahmen, durchsucht werden. 

## Lizenz
Der Code ist GNU lizenziert. Nähere Informationen sind der Datei **GNU.md** zu entnehmen.

##Dateien im Projekt
In dem Projekt befinden sich unterschiedliche Dateien und Dateiausschnitte. Die zu durchsuchende Datenbank besteht aus mehreren Text- und Audiodateien. Die Dateitypen sind im Folgenden aufgelistet:
* PHN --> Textdatei
* WRD --> Textdatei
* WAV --> Audiodatei
* TXT --> Textdatei

Desweiteren wurden im Rahmen des Projekts neun Matlab-Funktionen und ein Matlab-Skript erstellt. 
* eingabe.m --> Dieses Scrpit ist ein Framework, mit dem auf Dateien und
   Dateiausschnitte aus der MIT/TIMIT - Datenbank zugegriffen werden kann. 
* DurchsuchenWRD.m --> Diese Funktion sucht nach WRD-Dateien.
* DurchsuchenWAV.m --> Diese Funktion sucht nach WAV-Dateien.
* DurchsuchenTXT.m --> Diese Funktion sucht nach TXT-Dateien.
* DurchsuchenPHN.m --> Diese Funktion sucht nach PHN-Dateien.
* DatenbankDurchsuchen.m –-> Mit dieser Funktion kann die vorhandene Datenbank nach den, vom 
  Nutzer eingegebenen Parametern durchsucht werden.
* OrdnersuchePHN.m --> Diese Funktion sucht nach Ordnern mit PHN-Dateien.
* OrdnersucheWAV.m --> Diese Funktion sucht nach Ordnern mit WAV-Dateien.
* OrdnersucheTXT.m --> Diese Funktion sucht nach Ordnern mit TXT-Dateien.
* OrdnersucheWRD.m --> Diese Funktion sucht nach Ordnern mit WRD-Dateien.

## Bedienung der Dateien
Zur Ausführung des Projekts ist lediglich das Öffnen des Skripts *eingabe.m* notwendig. Die oben genannten Funktionen benötigt das Skript zur Durchführung der Suche. Nachdem das Skript *eingabe.m* mit Matlab geöffnet wurde, ist darauf zu achten, dass der Anwender sich im korrekten *Current Folder* befindet. Anschließend kann im *Command Window* **eingabe** eingegeben werden. Das System führt den Anwender anschließend mit Fragen zu den gewünschten Ausgaben, welche direkt im Command Window beantwortet werden können. Im Folgenden ein Beispielausschnitt der Anwendung:

`Möchten Sie nach einem Wort, Text oder Phonem suchen, 
geben Sie eine 1 ein und bestätigen Sie mit Enter. 
Möchten Sie die Inhalte eines Ordners durchsuchen, 
geben Sie eine 2 ein und bestätigen Sie mit Enter.`

Der Anwender antwortet zum Beispiel mit 1 und bestätigt mit Enter 

`Geben Sie den Pfad des Ordners an, in dem die Dateien und Dateiausschnitte aus der MIT/TIMIT-Datenbank zu finden sind`: 

C:\Users\Tanja\Desktop\timit <-- **Beispielpfad**

Der Anwender gibt den Pfad an, in dem sich der Ordner **timit** befindet. Dieser ist, falls unbekannt, direkt oben in Matlab zu finden.

Anschließend werden weitere Fragen vom Anwender beantwortet, bis das gewünschte Ergebnis ermittelt ist.

## Fehlerbekanntgabe/Tests
Werden in dem oben genannten Beispiel Eingaben getätigt, welche Fehler hervorrufen würden, gibt das Projekt eine Fehlermeldung aus. 

Beispiel:

`Möchten Sie nach einem Wort, Text oder Phonem suchen, 
geben Sie eine 1 ein und bestätigen Sie mit Enter. 
Möchten Sie die Inhalte eines Ordners durchsuchen, 
geben Sie eine 2 ein und bestätigen Sie mit Enter.`

Gibt der Anwender in diesem Fall zum Beispiel eine *6* ein, gibt das Programm folgende Fehlermeldung:

`Die Eingabe war nicht korrekt. 
Bitte geben Sie eine Zahl zwischen 1 und 2 ein! aus.`
 

## Benötigte Software
Zur Anwendung dieses Projekts wird das Programm **Matlab** benötigt. Zur Installation ist es hilfreich sich die zur Verfügung gestellten Videos auf (https://de.mathworks.com) anzusehen. Anschließend ist eine Registrierung  auf derselben Seite bei Mathworks notwendig. Zum Herunterladen des Programms ist desweiteren eine Lizenz erforderlich, welche auf der Internetseite von Mathworks direkt erworben werden kann, sofern diese nicht bereits vorhanden ist. 

## Autorinnen
Marilena Sydow 

Jennifer Schmidt 

Tanja Kalmer 




