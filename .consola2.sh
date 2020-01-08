# # # SELECTIE DIN LISTA REZULTATELOR consola2
# variabile necesare $count_rez:



#!/bin/bash
	#afisare consola
	source .consola2.afis
	consola2_x=0
	while [ $consola2_x -eq 0 ]
	do
		echo ""
        #$selectie va fi in acelasi timp si $u
		read -p " Consola: " comanda selectie tex2_de_ca
		if [ -z "$comanda" ] 
		then
			echo " Nu ai introdus o comanda valida!"
			continue
		elif [ $comanda == "cat" ] 
		then
			cat_selectat=$(cat .trash_mic | grep "#${selectie}#" | sed "s/#${selectie}#//g")
			#$selectie sa nu fie mai mare decat $count_rez
			if [ -z "$selectie" ]
			then
				echo " Nu ai selectat un fisier! Introdu comanda show pentru a vedea fisierele valide. Ex: cat 4"
				continue
			fi	
		        #verifica ca $selectie sa fie integer
        		if [[ ! $selectie =~ ^[0-9]+$ ]] ; then
    			echo " Trebuie sa introduci un numar!"
    			continue
			fi
			if [ $selectie -gt $count_rez ]
			then
				echo " Nu ai selectat un fisier valid! Introdu comanda show pentru a vedea fisierele valide."
				continue
			fi		
		
			echo "$cat_selectat"
			cat $cat_selectat
            		echo ""
		elif [ $comanda == "ls" ]
		then
			ls_selectat=$(cat .trash_mic | grep "#${selectie}#" | sed "s/#${selectie}#//g")
			#$selectie sa nu fie mai mare decat $count_rez
			if [ -z "$selectie" ]
			then
				echo " Nu ai selectat un fisier! Introdu comanda show pentru a vedea fisierele valide. Ex: ls 4"
				continue
			fi		
            		if [[ ! $selectie =~ ^[0-9]+$ ]] ; then
    			echo " Trebuie sa introduci un numar!"
    			continue
			fi
            		if [ $selectie -gt $count_rez ]
			then
				echo " Nu ai selectat un fisier valid! Introdu comanda show pentru a vedea fisierele valide."
				continue
			fi		

			ls $ls_selectat
		elif [ $comanda == "show" ]
		then
			echo -e "$blue"
			cat .trash_mic
			echo -e "$default"
		elif [ $comanda == "mod" ]
		then
			mod_selectat=$(cat .trash_mic | grep "#${selectie}#" | sed "s/#${selectie}#//g")
			#$selectie sa nu fie mai mare decat $count_rez
			if [ -z "$selectie" ]
			then
				echo " Nu ai selectat un fisier! Introdu comanda show pentru a vedea fisierele valide. Ex: mod 4"
				continue
			fi		
            		if [[ ! $selectie =~ ^[0-9]+$ ]] ; then
    			echo " Trebuie sa introduci un numar!"
    			continue
			fi
            		if [ $selectie -gt $count_rez ]
			then
				echo " Nu ai selectat un fisier valid! Introdu comanda show pentru a vedea fisierele valide."
				continue
			fi		
			echo " $mod_selectat"
			vim $mod_selectat
        	elif [ $comanda == "sheark" ]
	        then 	
		
			if [ -z "$selectie" ]
			then
				echo " Nu ai selectat un director in care sa caute! Ex: sheark Desktop text"
				read -p "Introdu acum directorul in care doresti sa caute: " selectie
                		if [ -z "$selectie" ]
                		then
                			continue
	               		fi		
			fi
            		if [ ! -d "$selectie" ]
            		then
		            	echo " '$selectie' nu este un director valid!"
		                echo " sheark director text"
                		continue
            		fi
                        if [ -z "$tex2_de_ca" ]
			then
				echo " Nu ai selectat un text! Ex: sheark Desktop text"
				read -p " Introdu acum textul pe care doresti sa il caute: " tex2_de_ca
             			if [ -z "$tex2_de_ca" ]
                		then
                			continue
	               		fi
	    		fi		
            
        	u=$selectie
	        tex_de_ca=$tex2_de_ca
        	source .search.sh
            	source .consola2.afis

		elif [ $comanda == "exit" ]
		then
			echo " Blue..bye"
			clear
			consola2_x=1
		elif [ $comanda == "help" ]
		then
			clear
			echo " Sheark"
			echo " Program distribuit de oromaios.ro"
			echo ""
			    echo -e "$blue" "$(cat '.afisschimbabil_fin')"
		            echo -e "$default"
			    echo "               -----------------"
			echo ""
			echo " Pentru a folosi Sheark console"
			echo " Ai la dispozitie urmatoarele comenzi: (help) (ls) (cat) (mod) (show) (sheark) (desc) (exit)"
			echo " Pentru a afla mai multe informatii despre o anumita comanda, introdu: desc numele_comenzii. "
			echo " --------Exemplu: desc ls"
			echo ""
			echo " Comenzile ls, cat si  mod, trebuiesc urmate de numarul care apartine fisierului asupra careia se va folosi comanda, si care este delimitat de doua semne diez (#). EX: #1#, #2#, #3#"
			echo " --------Exemplu: Consola: mod 1"
			echo ""	
			echo " Pentru a revedea lista cu fisierele care contin textul: \"$tex_de_ca\" , foloseste comanda show."
			echo ""
			echo "             ----------------"
			echo " Creat de Cerlinca Stefan"
			echo " Toate drepturile rezervate! Acest program nu poate fi comercializat."

			echo ""
		elif [ $comanda == "desc" ]
		then
			if [ -z "$selectie" ]
			then
				echo " Nu ai selectat numele unei comenzi! Introdu: desc comanda_de_descris. Ex: desc cat"
				continue
			elif [ $selectie == "desc" ]
			then
				echo " desc (descrie)"
	        		echo " Afiseaza mai multe detalii despre o comanda."
		        	echo " Se introduce: desc comanda"
			        echo " Exemplu: desc ls"
			elif [ $selectie == "ls" ]
                        then
				echo " ls (listeaza)"
			        echo " Afiseaza locatia unui fisier selectat."
			        echo " Se introduce: ls fisier_identificat_prin_cifra"
			        echo " Exemplu: ls 300"
			elif [ $selectie == "cat" ]
                        then
				echo " cat (concatenate)"
			        echo " Afiseaza continutul unui fisier selectat"
			        echo " Se introduce: cat fisier_identificat_prin_cifra"
			        echo " Exemplu: cat 300"
			elif [ $selectie == "mod" ]
                        then
			        echo " mod (modifica)"
			        echo " Modifica un fisier folosind vim. Pentru a modifica acel fisier, trebuie sa aveti cunostinte de operare a editorului de text: vim !"
			        echo " Se introduce: mod fisier_identificat_prin_cifra"
			        echo " Exemplu: mod 300"
			elif [ $selectie == "show" ]
                        then
				echo " show (arata)"
			        echo " Afiseaza fisierele valide, asupra carora poti da anumite comenzi. Fisierele valide sunt identificate printr-o cifra pozitionata intre doua simboluri diez, ca in exemplul #1#, #300# etc."
			        echo " Se introduce: show"
			elif [ $selectie == "sheark" ]
                        then
				echo " sheark (Sheark este numele programului)"
			        echo " Cauta un text intr-un folder."
			        echo " Se introduce: sheark folder_in_care_se_cauta fisier_de_cautat"
			        echo " Exemplu: sheark Desktop oromaios"
			elif [ $selectie == "exit" ]
                        then
				echo " exit (iesire)"
			        echo " Iese din program. Inchide consola."
			        echo " Se introduce: exit"
			fi		
		fi
	done	
    
    
