<?php

require ''.ROOT.'/app/models/GameModel.php';

class HomeController {

    private object $game;

    public function __construct()
    {
        $this->game = new GameModel();
    }
    //Récuperation des derniers jeux ajoutés
    public function getLastPosts() {

        return  $this->game->findLastAdded();
    }
    //Récupération des genres des derniers jeux
    public function getPostsGenre($id) {

        return $this->game->findSingleGameGenre($id);
    }
    //Récuperation des jeux populaires
    public function getPopularGames() {

        return $this->game->findPopularGames();
    }
}

$page = 'HomeView';

include  ''.ROOT.'/public/LayoutView.phtml';