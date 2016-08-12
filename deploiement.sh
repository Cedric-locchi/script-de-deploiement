                                                                                                  1,1          Tout
#!/bin/sh -e

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

#===  FUNCTION  ================================================================
#          NAME: moveToFolder
#   DESCRIPTION: deplacement dans le dossier
#    PARAMETERS: 
#       RETURNS:
#===============================================================================

moveToFolder(){

    folder = $1

    cd /home/adigit/$folder
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

    folder = $1

    moveToFolder folder

    if [ -d "/home/adigit/$folder/node_modules" ]; then

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

    echo "script $folder terminé";
}

read -r -p "choisir le dossier a utiliser pour la mise a jour (all pour tous mettre a jour)" folder

#===  LANCEMENT DU SCRIPT  =====================================================
#===============================================================================

deploie $folder                                                                                                          7,27         Tout