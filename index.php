<?php


define('ROOT', __DIR__);

require_once 'app/models/DatabaseModel.php';

require 'app/controllers/LoginController.php';

/*Si une page spécifique est demandé on definit p avec cette page*/ 
if (isset($_GET['p'])) {
    $p = $_GET['p'];
} else {
/*Sinon p est la page accueil*/ 
    $p = 'home';
}

$title = null;

if (!$title) {
    
}

/*Contrôle et direction vers une page ou une action spécifiée*/
switch ($p) {
    /*Page d'accueil*/
    case 'home':
        $title = 'Video-Games Database - Accueil';
        require 'app/controllers/HomeController.php';
        break;
    /*Page d'informations sur un jeu*/
    case 'show':
        $title = 'Video-Games Database - Détail jeu';
        require 'app/controllers/ShowGameController.php';
        break;
    /*Page d'ajout de jeu*/
    case 'add':
        $title = 'Video-Games Database - Ajout d\'un Jeu';
        require 'app/controllers/AddGameController.php';
        break;
    /*Page d'enregistrement utilisateur*/
    case 'register':
        $title = 'Video-Games Database - Inscription';
        require 'app/controllers/RegisterController.php';
        break;
    /*Page de liste de tour les jeux*/  
    case 'all':
        $title = 'Video-Games Database - Tous les jeux';
        require 'app/controllers/AllGameController.php';
        break;
    /*Page d'administrateur de gestion des données du site*/
    case 'admin':
        $title = 'Video-Games Database - Admin';
        require 'app/controllers/AdminController.php';
        break;
    /*Page d'édition de jeu*/
    case 'editg':
        $title = 'Video-Games Database - Edition de jeu';
        require 'app/controllers/EditGameController.php';
        break;
    /*Page d'édition d'information utilisateur*/
    case 'editu':
        $title = 'Video-Games Database - Edition d\'utilisateur';
        require 'app/controllers/EditUserController.php';
        break;
    /*Page du profil utilisateur*/   
    case 'usernfo':
        $title = 'Video-Games Database - Profil utilisateur';
        require 'app/controllers/ShowUserController.php';
        break;
    /*Deconnexion de session utilisateur*/
    case 'deco':
        $logout = new LoginController();
        $logout->close(); 
}