#!/bin/bash
#
#Author : Jan Schröder
#last updated: 17.08.2023 - Documentation
#
#Skript zum Auslesen einer Liste und dem interieren über und vergleichen
#zum .bash_history files. 
#
#TODO:Rückmeldung welche Befehle vergessen worden sind -> counter = 0 add suchebgriff to array. 
#print out der fehlenden suchbegriffe  



controlllist=()
suchbegriffzeile=0 
txt file wird eingelesen und auf suchbegriffe gemapt
mapfile -t suchbegriffe < /labStuff/labExerciseScripts/Scripts/$1/grade/suchbegriffe.txt
	
#Schleife beginnt mit erstem Eintrag aus der Suchbegriffsliste
	for suchbegriff in "${suchbegriffe[@]}"; do
		COUNTER=0
		 
		while read -r befehl; do
		#suchbegriff wird mit jedem eintrag im .bash_hsitory fileabgeglichen 
				
			if [[  $befehl == *"$suchbegriff"* ]]; then
	       			echo "$befehl | $suchbegriff"
				let COUNTER++

  			fi

		done < "/home/student/.bash_history"

		#falls es Treffer gab wird der Counter einem Array hinzugefüt
		if [[ "$COUNTER" -gt "0" ]] ; then 
		controlllist+=($COUNTER)
		fi
	#bevor der nächste Suchbegriff iteriert wird erhöhen wir den Zähler für die Zeilennotation der Suchbegriffsliste
	let suchbegriffzeile++
	done 

#Stimmen die Zeilenanzahl mit der Anzahl an verschiedener Treffer überein wurde alles erledigt
#ansonsten sollen die Fehlenden bzw falschen aufgabenschritte ausgegeben werden. 

if [[ "${#controlllist[@]}" == "$suchbegriffzeile" ]];then
	echo "Alle richtig :D "
else echo "da ist was flasch :c" 
#TODO: Ausgabe der fehlenden Aufgabenteile	

fi



echo "${#controlllist[@]}"
echo "$suchbegriffzeile" 









