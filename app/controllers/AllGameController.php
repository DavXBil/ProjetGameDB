<?php

require ''.ROOT.'/app/controllers/GameController.php';

class AllGameController extends GameController {

    private int $limit = 80;

    public function __construct() {

        $this->game = new GameModel();
    }
    //récupération des jeux
    public function getGames() {
        $calledGames = array_unique($this->game->findAll(), SORT_REGULAR);
        $games= [];
        foreach ($calledGames as $game) {

            $game['platform'] = [...$this->getGamePlatforms($game['id'])];
            $game['genre'] = [...$this->getGameGenres($game['id'])];
            array_push($games, $game);
        }
        return $games;
    }
    //récupération du nombre de page
    public function getPageNumbers() {
        $nbElements = $this->game->findRows();
        $nbPages = ceil($nbElements[0]['found_rows()'] / $this->limit);
        return $nbPages;
    }

}
$page = 'AllGameView';

include  ''.ROOT.'/public/LayoutView.phtml';