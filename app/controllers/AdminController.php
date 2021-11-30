<?php 

require ''.ROOT.'/app/models/GameModel.php';


class AdminController {

  private object $game;
  private int $limit = 20;

  public function __construct() {

      $this->game = new GameModel();
  }

  /*Méthode d'affichage de tableau des jeux*/
  public function showgames() {
    $games = $this->game->findLimitGames();
    return $games;
  }
  /*Méthode d'affichage de tableau des devs*/
  public function showDevs() {
    return $this->game->findLimitDevs();
  }
  /*Méthode d'affichage de tableau des éditeurs*/
  public function showEditors() {
    return $this->game->findLimitEditors();
  }
  /*Méthode d'affichage de tableau des genres*/
  public function showGenres() {
    return $this->game->findLimitGenres();
  }
  /*Méthode d'affichage de tableau des plateformes*/
  public function showPlatforms() {
    return $this->game->findLimitPlatforms();
  }
/*Méthode de récupération du nombre de pages pour la pagination*/
  public function getPageNumbers() {
    $nbElements = $this->game->findRows();
    $nbPages = ceil($nbElements[0]['found_rows()'] / $this->limit);
    return $nbPages;
  }
/*Méthode d'affichage de tableau des jeux*/
  public function addElement() {

    $clearToAdd = true;
    /*si un formulaire a été envoyé*/
    if (!in_array('', $_POST)) {

      /*si le champ d'ajout de dev est rempli*/
      if (isset($_POST['adddev'])) {
        /*récupération de tous les devs*/
        $devs = $this->game->findAllDev();
        
        foreach ($devs as $dev) {
          /*si le nom d'un des devs recupéré est identique à celui qu'on veut ajouter*/
          if (strtolower($dev['name']) == strtolower($_POST['adddev'])) {
          /*l'ajout n'est pas a faire*/
            $clearToAdd = false;
          }
        } 
        /*si l'ajout est faisable*/
        if ($clearToAdd === true) {
          /*Ajout en BDD*/
          $this->game->addDevelopper(ucwords($_POST['adddev']));
          /*Et redirection*/
          header('Location: index.php?p=admin&list=dev&status=success');
        }    
      }
      /*si le champ d'ajout de genre est rempli*/
      if (isset($_POST['addgenre'])) {
        /*récupération de tous les genres*/
        $genres = $this->game->findAllGenre();
        
        foreach ($genres as $genre) {
          /*Si le nom d'un des genres recupéré est identique à celui qu'on veut ajouter*/
          if (strtolower($genre['name']) == strtolower($_POST['addgenre'])) {
            /*l'ajout n'est pas a faire*/
            $clearToAdd = false;
          }
        }
        /*Si l'ajout est faisable*/
        if ($clearToAdd === true) {
          /*Ajout en BDD*/
          $this->game->addGenre(ucwords($_POST['addgenre']));
          /*Et redirection*/
          header('Location: index.php?p=admin&list=genre&status=success');
        }
      }
      /*Si le champ d'ajout d'éditeur est rempli*/
      if (isset($_POST['addeditor'])) {
        /*Récupération de tous les editeurs*/
        $editors = $this->game->findAllEditor();
        
        foreach ($editors as $editor) {
          /*Si le nom d'un des editeurs recupéré est identique à celui qu'on veut ajouter*/
          if (strtolower($editor['name']) == strtolower($_POST['addeditor'])) {
            /*l'ajout n'est pas a faire*/
            $clearToAdd = false;
          }  
        }
        /*Si l'ajout est faisable*/
        if ($clearToAdd === true) {
          /*Ajout en BDD*/
          $this->game->addEditor(ucwords($_POST['addeditor']));
          /*Et redirection*/
          header('Location: index.php?p=admin&list=editor&status=success');
        }
      } 
      /*Si les champs d'ajout de plateformes sont remplis*/
      if (isset($_POST['addplatformname']) && isset($_POST['addplatformdate'])) {


        if(strlen($_POST['addplatformdate']) == 4 && is_numeric($_POST['addplatformdate'])) {
          /*Récupération des plateformes*/
          $platforms = $this->game->findAllPlatform();
          
          foreach ($platforms as $platform) {
            /*Si le nom d'une des plateformes récupérées est identique*/
            if (strtolower($platform['name']) == strtolower($_POST['addplatformname'])) {
              /*L'ajout n'est pas a faire*/
              $clearToAdd = false;
            }  
          }

          /*Si l'ajout est faisable*/
          if ($clearToAdd === true) {
            /*Ajout en BDD*/
            $this->game->addPlatform(ucwords($_POST['addplatformname']), $_POST['addplatformdate']);
            /*Et redirection*/
            header('Location: index.php?p=admin&list=platform&status=success');
          }
        } else {
          echo "<div class='addmsg'>La date n'est pas valide.</div>";  
        }
      }
      /*Si l'ajout n'est pas à faire afficahge du message*/
      if ($clearToAdd == false) {
        echo "<div class='addmsg'>L'élément à déjà été enregistré.</div>";
      }
      /*Si le champ d'ajout n'est aps rempli affichage du message*/
    } else {
        echo "<div class='addmsg'>Au moins un des champ n'est pas rempli.</div>";
    }
  }
  /*Méthode de suppression d'un élement*/
  public function removeElement($toRemoveElement, $list) {
    $table = "";
    switch ($list) {
      case 'dev':
        $table = "developper";
        break;
      case 'game':
        $table = "game";
        break;
      case 'editor':
        $table = "editor";
        break;
      case 'genre':
        $table = "genre";
        break;
      case 'platform':
        $table = "platform";
        break;
      default: 
        exit("Erreur liste non reconnue");
    }
    $this->game->deleteElement($toRemoveElement, $table);
    header('Location: index.php?p=admin&list='.$list.'&status=success');
  }
}

$page = 'AdminView';

include  ''.ROOT.'/public/LayoutView.phtml';