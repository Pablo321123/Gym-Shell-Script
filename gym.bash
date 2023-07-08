#!/bin/bash

pressAnyButton(){
	echo "Pressione qualquer tecla para continuar"
	read -n 1 -s
}

if [ $# -ne 2 ]; then
    echo "Usage: $0 [TrainingFile] [dietFile]"
    exit 0
fi


trainingFile=$1
dietFile=$2
escolha=0
arqPerderPeso="perderPeso.txt"
arqManterPeso="manterPeso.txt"
arqGanharPeso="ganharPeso.txt"
arqDietaGanharMassa= "dietaGanharMassa.txt"
arqAwk="gym.awk"
arqDietAwk="arqDietAwk.awk"



while [[ $escolha -ne 4 ]]; do
    clear
    echo -e "-----------------------------------------------\nO seu treino sera salvo em: $trainingFile\nA sua dieta sera salva em: $dietFile\n-----------------------------------------------"
    echo "======== MENU ========"
    echo "1. Perder Peso"
    echo "2. Manter meu Peso"
    echo "3. Ganhar Massa"
    echo "4. Sair"
    echo "======================"
    echo -n "Qual é o seu objetivo? "
    read escolha


    case $escolha in
    1)
    	clear
        echo "Você escolheu PERDER PESO! Bora, voce consegue!"
        if [[ -f "$arqPerderPeso" ]]; then        	
        	gawk -f "$arqAwk" "$arqPerderPeso" > "$trainingFile"
        	cat "$trainingFile"
        fi
        pressAnyButton
        ;;
    2)
    	clear
        echo "Você escolheu MANTER O PESO!"
        if [[ -f "$arqManterPeso" ]]; then        	
        	gawk -f "$arqAwk" "$arqManterPeso" > "$trainingFile"
        	cat "$trainingFile"
        fi
        pressAnyButton
        ;;
    3)
    	clear
        echo "Você FICAR MONSTRAO! Boa escolha! BIRLLL!"
        if [[ -f "$arqGanharPeso" ]]; then        	
        	gawk -f "$arqAwk" "$arqGanharPeso" > "$trainingFile"
        	cat "$trainingFile"
        	#gawk -f "$arqDietAwk" "$arqDietaGanharMassa" #> "$dietFile"
        	#cat "$dietFile"
        fi
        pressAnyButton
        ;;
    4)
        echo "Saindo..."
        ;;
    *)
        echo "Opção inválida!"
        ;;
    esac	
    echo
done


echo "Fim do programa."



