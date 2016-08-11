                                                                                                  1,1          Tout
#!/bin/bash -e

#===============================================================================
#
#          FILE:  deploiement.sh
#
#         USAGE:  ./deploiement.sh
#
#   DESCRIPTION: script de deploiement des sites adigit
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  cedric locchi cedric@adigit.com
#       COMPANY:  adigit
#       VERSION:  0.0.0.1
#       CREATED:  11/08/2016
#
#===============================================================================

array=( "commerce" "informatique" "telecom" "entreprise" )

#===  FUNCTION  ================================================================
#          NAME: moveToFolder
#   DESCRIPTION: deplacement dans le dossier
#    PARAMETERS: 
#       RETURNS:
#===============================================================================

moveToFolder(){
    cd /home/adigit/$1
    git pull origin master
}

#===  FUNCTION  ================================================================
#          NAME: npmInstallAndBuild
#   DESCRIPTION: npm install
#    PARAMETERS:  
#       RETURNS:
#===============================================================================

npmInstallAndBuild(){
    npm install
    gulp build
}

#===  FUNCTION  ================================================================
#          NAME: deploie
#   DESCRIPTION: script de deploiement adigit
#    PARAMETERS: $folder 
#       RETURNS:
#===============================================================================

deploie() {

    moveToFolder

    if [ -d "/home/adigit/$1/node_modules" ]; then

        read -r -p "lancer un npm install quand même? [Y/n] " input

        case $input in
            [yY][eE][sS]|[yY])
                npmInstallAndBuild
                ;;
            [nN][oO]|[nN])
                gulp build
                ;;
            *)
        esac

    else
        npmInstallAndBuild
    fi

    echo "script $1 terminé";
}

read -r -p "choisir le dossier a utiliser pour la mise a jour (all pour tous mettre a jour)" folder

#===  LANCEMENT DU SCRIPT  =====================================================
#===============================================================================

deploie $folder                                                                                                          7,27         Tout