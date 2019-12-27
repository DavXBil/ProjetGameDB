<?php



require ''.ROOT.'/app/controllers/GameController.php';

class ShowGameController extends GameController {



    public function __construct()
    {
        parent::__construct();
    }
    //Récuperation des infos du jeu
    public function getGame() {

        $gameId = $_GET['id'];
        return $this->game->findGame($gameId);
    }
    //Récupération des plateformes liées au jeux
    public function getGamePlatforms($id) {

        return $this->game->findSingleGamePlatforms($id);
    }
    //Récupération des genres du jeu
    public function getGameGenre($id) {

        return $this->game->findSingleGameGenre($id);
    }
    //Récupération des développeur du jeu
    public function getGameDev($id) {

        return $this->game->findSingleGameDev($id);
    }
    //Récuperation de l'éditeur
    public function getGameEditor($id) {

        return $this->game->findSingleGameEditor($id);
    }
    //Récupération de l'id du dernier jeu
    public function getLastId() {
        $lastGame = $this->game->findLastId();
        return $lastGame['lastGame'];
    }
    //Récupération des évaluations utlisateurs du jeu
    public function getReviews($id) {
        return $this->game->findReviews($id);
    }

    //Fonction d'ajout évaluation
    public function review() {

        $gameId = $_GET['id'];
        $userId = $_SESSION['user']['id'];
        //Le formulaire est-il rempli?
        if(isset($_POST['note']) && !empty($_POST['comment'])) {
            //Récupération des reviews du jeu
            $checkReview = $this->game->findReviews($gameId);

            $alreadyReviewed = false;
            for ($i=0; $i < count($checkReview); $i++) { 
                //L'utilisateur a t-il déja écrit une évaluation sur ce jeu
                if (in_array($userId, $checkReview[$i])) {

                    $alreadyReviewed = true;
                    break;
                }
            }
            //Si l'uilisateur n'a pas encore écris une évaluation sur ce jeu
            if (!$alreadyReviewed) {
                $newReviewCreateDate = date('Y-m-d H:i:s', time());
                $newReviewNote = $_POST['note'];
                $newReviewComment = $_POST['comment'];
                //Ajout de l'évaluation ne BDD
                $this->game->addReview($newReviewNote, $newReviewComment, $newReviewCreateDate, $gameId, $userId);
                $response = "Avis enregistré avec Succès";
            }
            else {
                $response = "Vous avez déjà rédigé un avis pour ce jeu";
            }
        } else {
            $response = "Un des champs est vide";
        }
        return $response; 
    }
    //Méthode de redirection de page détaillé d'un jeu en cas de jeu éffacé précédemment
    public function redirect() {
        //On récupère le sens de navigation (Suivant/Précédent) 
        $direction = $_GET['side'];
        switch ($direction) {
            case 'prev':
                $id = $_GET['id'] - 1;
                header("Location: index.php?p=show&side=prev&id=".$id);
                break;
            
            case 'next':
                $id = $_GET['id'] + 1;
                header("Location: index.php?p=show&side=next&id=".$id);
                break;
        }
    }
}

$page = 'ShowGameView';

include  ''.ROOT.'/public/LayoutView.phtml';