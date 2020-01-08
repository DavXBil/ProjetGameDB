<?php

require ''.ROOT.'/app/models/GameModel.php';

class ShowUserController {

    private object $user;
    private object $gameModel;

    public function __construct() {

        $this->user = new UserSession();
        $this->gameModel = new GameModel();
    }

    /*Methode de recupération du nom d'utilisateur*/
    public function showName() {
 
        return $this->user->getName();
    }

    /*Methode de recupération de l'image d'utilisateur*/
    public function showUserImage() {

        return $this->user->getImage();
    }
    /*Methode de recupération de l'addresse mail d'utilisateur*/
    public function showMail() {

        return $this->user->getMail(); 
    } 
    /*Methode de recupération des évaluations de l'utilisateur*/
    public function getUserReviews() {

        $userId = $this->user->getId();
        return $this->gameModel->findReviewsByUser($userId);
    }
    /*Methode de recupération des jeux ajoutés par utilisateur*/
    public function getUserAddedGames() {
        $userId = $this->user->getId();
        return $this->gameModel->findGameByUsers($userId);

    }
}

$page = 'ShowUserView';

include  ''.ROOT.'/public/LayoutView.phtml';