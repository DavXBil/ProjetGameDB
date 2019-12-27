<?php

require ''.ROOT.'/app/controllers/GameController.php';

class EditController extends GameController {
    

    public function __construct() {

        parent::__construct();
    }
    //Récupération du jeu
    public function getGame($id) {

        return $this->game->findGame($id);
    }
    //Récupération des plateformes du jeu à éditer
    public function getToEditGamePlatforms($id) {

        return $this->game->findSinglegamePlatforms($id);
    }
    //Récupération des genres du jeu à éditer
    public function getToEditGameGenres($id) {
        return $this->game->findSinglegameGenre($id);

    }
    //Edition du jeu
    public function editGame() {

        $toEditGameId = $_POST['gameid'];        
        $toEditGameName = $_POST['gametitle'];
        $toEditGameDescription = $_POST['description'];
        $toEditGameDev = $_POST['dev'];
        $toEditGameEditor  = $_POST['editor'];
        //Date de parution du jeu
        $toEditGameReleaseDate = intval($_POST['releasedate']);

        $oldGameNfos = $this->getGame($toEditGameId);

        $platformsDatas = [
            $_POST['platform1'],
            $_POST['platform2'],
            $_POST['platform3'],
            $_POST['platform4'],
            $_POST['platform5'],
            $_POST['platform6'],
        ];
        //Tableau des option des champs platform selectionnés après verifications
        $gamePlatforms = [];

        $genresDatas = [
            $_POST['genre1'],
            $_POST['genre2'],
            $_POST['genre3'],
        ];
         //Tableau des option des champs genre selectionnés après verifications
         $gameGenres = [];
        
        //Parcours des champs de plateforme 
        for ($i=0; $i < count($platformsDatas); $i++) { 
            //ESt-ce que l'option est autre que par défaut?
            if ($platformsDatas[$i] != 0) {
                /*Si oui est-ce que l'option n'est pas déjà entré dans le tableau gamePlatforms*/
                if (!in_array($platformsDatas[$i], $gamePlatforms)) {
                    /*Ajout dans le tableau gamePlatforms pret à l'envoie*/
                    array_push($gamePlatforms, $platformsDatas[$i]);
                } 
            }
        }
        /*IDEM pour les champs select de genre*/
        for ($i=0; $i < count($genresDatas); $i++) {
            //ESt-ce que l'option est autre que par défaut? 
            if ($genresDatas[$i] != 0) {
                /*Si oui est-ce que l'option n'est pas déjà entré dans le tableau gamePlatforms*/
                if (!in_array($genresDatas[$i], $gameGenres)) {
                    /*Ajout dans le tableau gameGenres pret à l'envoie*/
                    array_push($gameGenres, $genresDatas[$i]);
                }
            }
        }


        /*Est-ce que le champs sont rempli et les select ne sont pas sur l'option par défaut?*/
        if (!empty($toEditGameName) && $toEditGameDev != 0 && $toEditGameEditor != 0 && !empty($toEditGameReleaseDate) && !empty($gamePlatforms) && !empty($gameGenres)) {

            if ($_FILES['picture']['error'] === 4){
                $picture = $oldGameNfos['image'];
            } else {
                $picture = $_FILES['picture']['name'];
                //Supression de l'ancienne image du dossier
                unlink('public/img/games/'.$oldGameNfos['image'].'');
                //Ajout de la nouvelle image dans le dossier
                move_uploaded_file($_FILES['picture']['tmp_name'],'public/img/games/'.$picture.'');
            }            
            $toEditGameAdded = $this->game->editGame($toEditGameId, $toEditGameName, $toEditGameDescription, $toEditGameDev, $toEditGameEditor, $toEditGameReleaseDate, $picture);

            /*Suppression des anciens liens de platformes*/
            $this->game->deletePlatformLink($toEditGameId);
            /*Puis ajout des nouveaux*/
            $this->game->addPlatformLink($gamePlatforms, $toEditGameId);
            /*Idem pour les liens de genres*/
            $this->game->deleteGenreLink($toEditGameId);
            $this->game->addGenreLink($gameGenres, $toEditGameId);
            /*redirection sur la page d'accueil*/
            header('Location: index.php?p=admin');
            
        }  else {
            /*Si non alors affichage d'un message d'erreur*/
            echo "erreur lors de la tentative d'edition";
        }
    }
}


$page = 'EditGameView';

include  ''.ROOT.'/public/LayoutView.phtml';