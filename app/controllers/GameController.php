<?php 

require ''.ROOT.'/app/models/GameModel.php';

class GameController {

    protected $game;

    public function __construct() {
        $this->game = new GameModel();
    }

    //Récupération de toutes les platformes
    public function getPlatforms() {
 
        return $this->game->findAllPlatform();
    }

    //Récupération de tous les developpeurs
    public function getDevs() {

        return $this->game->findAllDev();
    }
    //Récupération de tous les editeurs
    public function getEditors() {

        return $this->game->findAllEditor();
    }
   //Récupération de tous les genres
    public function getGenres() {

       return $this->game->findAllGenre();
    }
   //récupération des plateformes d'un jeu
    public function getGamePlatforms($id) {

        return $this->game->findSingleGamePlatforms($id);
    }
    //récupération des genres d'un jeu
    public function getGameGenres($id) {

        return $this->game->findSingleGameGenre($id);
    }

}