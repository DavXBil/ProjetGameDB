<?php

require ''.ROOT.'/app/controllers/GameController.php';

class AllGameController extends GameController {

    private int $limit = 80;

    public function __construct() {

        $this->game = new GameModel();
    }
    //récupération des jeux
    public function getGames($page) {
        
        $start = ($page - 1) * $this->limit;

        return $this->game->findAll($this->limit, $start);
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