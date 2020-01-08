#LOGO GENERATOR - FACE CA RECHINASUL SA SE MISTE
#variabile definite in scriptul antrior: instanta logo_count
### 0fac fisierele print nevizibile si le schimb denumirea
###
###

		# PRIMA INSTANTA A LOGOULUI, DE LA ACEASTA INSTANTA VOR DERIVA CELELALTE INSTANTE		
		echo '                   /|            .' > '.afisschimbabil'
		echo '                  O/  ___/|     .'			>> '.afisschimbabil'
		echo '                 \ o   __ |         .'		>> '.afisschimbabil'
		echo '                  \___/  \|      .'		>> '.afisschimbabil'
       		
   #PRIMA INSTANTA: RECHINASUL MERGE SPRE STANGA
   if [ $instanta -eq 1 ]
   then
   		logo_count=$(($logo_count + 1))
        #IF RECHINAS AJUNGE IN STANGA
   		if [ $logo_count -eq 17 ]
		then
            instanta=2
            #printeaza 17
			cut -c ${logo_count}- '.afisschimbabil' > .afisschimbabil_fin
            #AFISEAZA LOGO-UL
			echo -e "$blue" "$(cat '.afisschimbabil_fin')"
            echo -e "$default"
        #ALTFEL
		else
            #MISCA LOGOUL
			cut -c ${logo_count}- '.afisschimbabil' > .afisschimbabil_fin
			#AFISEAZA LOGOUL
            echo -e "$blue" "$(cat '.afisschimbabil_fin')"
            echo -e "$default"
		fi
    #A DOUA INSTANTA: RECHINASUL MERGE SPRE DREAPTA
    elif [ $instanta -eq 2 ]
    then
    	#CALCULUL SE FACE REVERSIBIL
    	logo_count=$(($logo_count - 1))
        #IF RECHINAS AJUNGE INAPOI IN DREAPTA
    	if [ $logo_count -eq 1 ]
        then
        	instanta=1
            #punem logo_count = 0 ca a aiba ce sa fie calculat. Ca sa existe logo_count pozitie initiala
            logo_count=0
            #afiseaza .afisschimbabil_fin adica inceputul mesului spre stanga
			echo "$(cat '.afisschimbabil')" > .afisschimbabil_fin
            #AFISEAZA LOGO-UL
			echo -e "$blue" "$(cat '.afisschimbabil_fin')"
            echo -e "$default"
        else
      	   #CREAREA CELEI DE A DOUA INSTANTE
            echo '	 .                     |\     '   > '.afisschimbabil'
   			echo '              .     |\___  \O   '   >> '.afisschimbabil'
   			echo '          .         | __   o /  '		>> '.afisschimbabil'
   			echo '             .      |/  \___/    '	>> '.afisschimbabil'
   
   
            #MISCA LOGOUL
			cut -c ${logo_count}- '.afisschimbabil' > .afisschimbabil_fin
			#AFISEAZA LOGOUL
            echo -e "$blue" "$(cat '.afisschimbabil_fin')"
            echo -e "$default"
    	fi
	fi
