#!/bin/bash

echo -e  "\nBienvenu dans le jeu Hyrule Castle, un jeu produit par l'ETNA et developpé par Idir.C :)\n"

#definition des fonctions et des variables



bvie=0

Presentation() {  #fonction de personnage avec le nom de l'utilisateur
    echo "Nom du joueur : "
    read -s playername 
    echo "Bonjour $playername, le jeu va commencer, bonne chance." 
    playerHP=60
    playerSTR=15
    hpMax=$playerHP
}

Choixplayername () {      #fonction de parametrage des personnages avec leurs carateristiques
    ./player.sh
    playername=0
    read -s playername
    if (( $playername == 1 )); then
	  playername="Link"
	  playerHP=60
	  playerSTR=15
    elif (( $playername == 2 )); then
	  playername="Young Link"
	  playerHP=40
	  playerSTR=8
    elif (( $playername == 3 )); then
	  playername="Sheik"
	  playerHP=50
	  playerSTR=12
    elif (( $playername == 4 )); then
	  playername="Impa"
	  playerHP=50
	  playerSTR=5
    elif (( $playername == 5 )); then
	  playername="Hylia"
	  playerHP=100
	  playerSTR=10
    fi
     hpMax=$playerHP
echo "Bonjour $playername"
}

Fbvie () {  #fonction barre de vie
    bvie=0
    vie="♥"     	
    if (( $playerHP !=0 )); then
     while [ $bvie -le  $playerHP ]; do
        bvie=$(($bvie+1))
	vie=("$vie"" ♥")
     done
     while [ $bvie -lt $hpMax ]; do
	bvie=$(($bvie+1))
	vie=("$vie"" ♡")
     done
     echo -e  "\033[35m $vie \033[0m $playerHP/$hpMax"
    else
     echo -e "HP: \033[35m ♡ $playerHP \033[0m /$hpMax"
    fi  
 
    
    
}

finjeu () {  #fonction de fin de jeu

echo "Vous avez fini le jeu, vous pouvez jouer à nouveau" 
}


Floor () {      #fonction étage avec le protocole de combat

    
    choixoption=0
    echo -e "\n=============== ETAGE $netage ==============\n"
    while [ $playerHP -gt 0 -o $monstreHP -gt 0 ]; do
	
	#  si le joueur sort de la boucle de combat
	if (( $monstreHP <= 0 )); then
	    echo "GG vous avez battu le monstre"
	    break
	elif (( $playerHP <= 0 )); then
	    Fbvie  
	    echo "You loose !"
	    exit
	fi     

        Fbvie
	echo -e "\nVous faites face à un\033[31m $monstreName \033[0m avec $monstreHP HP, battez vous !!\n"
        

        
        
        echo -e "\n \033[32m \"$playername\" \033[0m vous avez \033[35m $playerHP\033[0m HP\n"
       
	echo -e "\n ---------------OPTIONS-------------\n"
        echo -e " 1. Attaque ... 2. Heal ($(($hpMax/2)))HP\n"
 
        read -s choixoption 

	#attaque du joueur
        if (( $choixoption == 1 )); then 
	    monstreHP=$(($monstreHP - $playerSTR)) 
	    playerHP=$(($playerHP - $monstreSTR))  #attaque du monstre
	    echo -e "Bravo le\033[31m $monstreName \033[0m a perdu $playerSTR HP!! HP du monstre: $monstreHP "
	    echo -e "\nAïe !\033[31m $monstreName \033[0m vous a fait $monstreSTR points de dégats"
	    echo -e "\nVous avez $playerHP points de vie"
	    
        #condition de heal
	elif (( $choixoption == 2 )); then
	    playerHP=$(($playerHP+$hpMax/2))      #Heal!
	    if (( $playerHP > $hpMax )); then
		playerHP=$hpMax #empeche l'exedent de vie
	    fi
	    
	    playerHP=$(($playerHP - $monstreSTR)) #attaque du monstre
	    echo -e "\n Aïe !  \033[31m $monstreName  \033[0m vous a fait $monstreSTR points de dégats"
	    echo -e "\n Vous avez $playerHP points de vie"
	    echo -e "Vous avez choisi de vous soigner. HP de $playername: $playerHP"
	elif (( $netage == 10 && $monsterHP == 0 )); then
	    finjeu
	    break
	fi

    done    
}


#Début du jeu
#Choix du personnage personnalisé ou prédéfini

choixperso=0
echo "Si vous voulez un personnage prédéfini tapez 1 si vous voulez un personnage personnalisé tapez 0"
read -s choixperso
if (( $choixperso == 1 )); then
    Choixplayername
else
    Presentation
fi

echo -e "Vous avez  \033[35m $playerHP \033[0m  points de vie et $playerSTR points d'attaque" 

netage=1
while [ $netage -le 9 ]; do
    monstreName="Bokoblin"
    monstreHP=30
    monstreSTR=5
    Floor $netage
    netage=$(($netage+1))
    if (( $netage == 10 )); then
	monstreName="Ganon"
	monstreHP=150
	monstreSTR=20
        Floor $netage
    fi	
done
