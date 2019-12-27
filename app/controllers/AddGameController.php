<?php

require ''.ROOT.'/app/controllers/GameController.php';

class AddGameController extends GameController {

    public function __construct() {

        parent::__construct();
    }
    //Methode d'ajout de jeu
    public function addNewGame() {

        $newGameName = strtolower($_POST['gametitle']);
        $newGameDescription = addslashes($_POST['description']);
        $newGameDev = $_POST['dev'];
        $newGameEditor  = $_POST['editor'];

        //Date de parution du jeu
        $newGameReleaseDate = $_POST['releasedate'];

        //Creation de la date d'ajout du jeu dans la BDD
        $newGameCreateDate = date('Y-m-d H:i:s', time());
        $newGameUserId = $_SESSION['user']['id'];
        $newGameImage = $_FILES['picture']['name'];

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
        if (!empty($newGameName) && $newGameDev != 0 && $newGameEditor != 0 && !empty($gamePlatforms) && !empty($gameGenres)) {
            /*Si aucune image n'est envoyée on utilise l'image par defaut*/
            if ($newGameImage === '') {
                $newGameImage = 'defaultgame.png';
            }

            if (strlen($newGameReleaseDate) == 4 && is_numeric($newGameReleaseDate)) {            
                $games = $this->game->findGameByName($newGameName);

                if (empty($games)) {
                    /*Si OK alors ajout du jeu*/
                    $newGameAdded = $this->game->addGame($newGameName, $newGameDescription, $newGameDev, $newGameEditor, $newGameReleaseDate, $newGameCreateDate, $newGameUserId, $newGameImage);
                    /*Ajout de l'image dans le repertoir image des jeux*/
                    move_uploaded_file($_FILES['picture']['tmp_name'],'public/img/games/'.$newGameImage.'');
                    /*Puis ajout des liens de platformes*/
                    $this->game->addPlatformLink($gamePlatforms, $newGameAdded);
                    /*Et des liens de genres*/
                    $this->game->addGenreLink($gameGenres, $newGameAdded);
                    /*redirection sur la page d'accueil*/
                    header('Location: index.php');

                } else {
                    echo "<div class='addmsg'>Ce jeu à déjà été enregistré.</div>";
                }

            } else {
                echo "<div class='addmsg'>L'année de sortie n'est pas valide</div>";
            }

        } else {
                /*Si non alors affichage d'un message d'erreur*/
                echo "<div class='addmsg'>Erreur lors de la tentative d'ajout.</div>";
        }
    }
}

$page = 'AddGameView';

include  ''.ROOT.'/public/LayoutView.phtml';