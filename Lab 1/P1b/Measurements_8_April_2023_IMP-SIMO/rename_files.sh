#!/bin/bash

# Das Verzeichnis, in dem die Dateien umbenannt werden sollen
VERZEICHNIS="./"

# Die aktuelle Endung, nach der gesucht wird (z.B. .txt)
ALT_ENDUNG=".xlsx"

# Die neue Endung, die anstelle der alten Endung verwendet werden soll (z.B. .log)
NEU_ENDUNG=".xls"

# Prüfe, ob das angegebene Verzeichnis existiert
if [ ! -d "$VERZEICHNIS" ]; then
    echo "Das Verzeichnis $VERZEICHNIS existiert nicht."
    exit 1
fi

# Gehe in das angegebene Verzeichnis
cd "$VERZEICHNIS"

# Umbenenne alle Dateien mit der alten Endung in die neue Endung
for DATEI in *$ALT_ENDUNG; do
    # Ersetze die alte Endung durch die neue Endung
    NEUER_NAME=${DATEI%$ALT_ENDUNG}$NEU_ENDUNG
    
    # Prüfe, ob die Datei bereits existiert (um Überschreibungen zu vermeiden)
    if [ -f "$NEUER_NAME" ]; then
        echo "Die Datei $NEUER_NAME existiert bereits. Bitte überprüfen Sie den Dateinamen."
    else
        # Benenne die Datei um
        mv "$DATEI" "$NEUER_NAME"
        echo "Datei $DATEI erfolgreich in $NEUER_NAME umbenannt."
    fi
done

echo "Fertig!"

