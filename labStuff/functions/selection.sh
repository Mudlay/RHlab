#!/bin/bash


case $2 in 
	start) 
		# > ~/.bash_history
		echo "start Script: "$1.sh""
		source /labStuff/labExerciseScripts/Scripts/$1/"start"/"$1.sh"
	
		
	;;


		
	grade) 
		echo "grade Script"$1.sh""
		source /labStuff/functions/searchHistory.sh $1
		#controllHistory + txt file in exersice folder 


	;;



	finish)
		echo "finish Script"
		source /labStuff/labExerciseScripts/Scripts/$1/finish/cleanup.sh
		
 

	;;










esac	
