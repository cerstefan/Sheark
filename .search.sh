# # # PROCES CAUTARE FISIER $TEX_DE_CA IN $U
# variabile necesare $tex_de_ca , $u
if [ -z "$tex_de_ca" ] || [ -z "$u" ]
then 
	echo " Nu ai introdus folderul sau textul"
	echo " Blue..Bye!"
	exit	
fi

# # INTRODUCEREA ELEMENTELOR IN FISIERUL DIRECTOR2.TXT
	rm .director2 .trash_mic .output 2> /dev/null
	ls -a -R ${u}/ | grep ":" | sed 's/.$/\//' > .director2
	#director2= `echo < director2.txt`
	#AFIS
	instanta=1
	logo_init=0
	logo_count=0
	# LOADING
	loading_count=0
	loading_dots="."
	loading_dotpct="."
	clear
	count_rez=0
	for dir_ind in $(cat .director2) #dir_ind = director individual rezultat din for
	do
		clear
	    loading_count=$(($loading_count + 1))
	    loading_dots=$loading_dots$loading_dotpct
        
        
        #LOADING SHOW PANNEL - PANNELUL DE INCARCARE
	echo ""
        echo '               - shearking oromaios.ro            '									
	echo ""
        #CREAZ[ INSTANTELE RECHINASULUI CARE INOATA
        source .logogen.sh
        echo ''
	    echo -e "Se cauta fisiere in care se afla textul: "${tex_de_ca} "\nIncarcare "$loading_dots
	    {
	    if [ $loading_count -eq 24 ] 
	    then 
	    	loading_dots="."
	        loading_count=0
	    elif [ $loading_count -eq 7 ]
	    then
	    	loading_dotpct="A"
	   	elif [ $loading_count -eq 8 ]
	    then
	    	loading_dotpct="S"
	    elif [ $loading_count -eq 9 ]
	    then
	    	loading_dotpct="T"
	    elif [ $loading_count -eq 10 ]
	    then
	    	loading_dotpct="E"
	    elif [ $loading_count -eq 11 ]
	    then
	    	loading_dotpct="A"
	   	elif [ $loading_count -eq 12 ]
	    then
	    	loading_dotpct="P"
	    elif [ $loading_count -eq 13 ]
	    then
	    	loading_dotpct="T"
	    elif [ $loading_count -eq 14 ]
	    then
	    	loading_dotpct="A"
	    elif [ $loading_count -eq 15 ]
	    then
	    	loading_dotpct="."
	    fi
	    }
	    
	    # PROCES
	     

	    for fis_ind in $(echo $(ls -a $dir_ind 2> /dev/null)) #fis_ind = fisier individual rezultat din for
	    do
	    	fisier_in_parte=$dir_ind$fis_ind    
	      	if [ -z "$(cat $fisier_in_parte 2> /dev/null | grep "$tex_de_ca")" ] 
	    	then
	        	zero=0	
	        else
			count_rez=$(($count_rez + 1))
			echo " #${count_rez}#"$dir_ind$fis_ind >> .trash_mic 2> /dev/null
	            #cat $dir_ind$fis_ind >> .trash
	        fi
	    done
	done
    
    	# AFISARE CONSOLA2
	clear
	echo -e \s \s \s \s --------------------------------------- sheark oromaios.ro
	echo ""
	#NU S-A GASIT NICI UN TEXT IN FOLDERUL $u
	if [ ! -e .trash_mic ]
	then
		echo "Nu s-a gasit textul \"${tex_de_ca}\" in folderul $u."
	else
		echo -e "$blue"
		cat .trash_mic
		echo -e "$default"
	fi

	echo ""	
	echo ""
    
    
