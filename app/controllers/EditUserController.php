<?php

use phpDocumentor\Reflection\PseudoTypes\True_;

class EditUserController {

    private object $user;
    private object $session;
    private $error; 

    public function __construct() {

        $this->user = new UserModel();
        $this->session = new UserSession();
        $this->error = false;

    }
    /*Récupération des infos de l'utilisateur*/
    public function getUserInfos() {

        return $this->user->find($_SESSION['user']['name']);
    }
    
    public function getUser($newUsername) {

        return $this->user->find($newUsername);
    }

    /*Edition des infos d'utilisateur*/
    public function editUser() {
        /*Appel de méthode de récupération*/
        $userNfo = $this->getUserInfos();
        
        /*Infos du formulaire*/
        $formNfos = $_POST;

        /*Tableau des nouvelles infos*/
        $newUserNfo = [];

        /*Si le champ Pseudo est rempli et different du pseudo initial*/
        if ((!empty($formNfos['username'])) && ($formNfos['username'] != $userNfo['username'])) {
            /*Le nouveau pseudo est-t'il déjà pris*/
                $formName = $this->getUser($formNfos['username']);
                /*Si Oui message d'erreur*/
                    if (is_array($formName)) {
                        echo "<div class='editmsg'>Ce Pseudo existe déjà.</div>";
                        $this->error = True;
                        $newUserNfo['username'] = $userNfo['username'];
                    } else {
                        /*Ajout du nouveau Pseudo au tableau des nouvelle infos à enregistrer*/
                        $newUserNfo['username'] =  $formNfos['username'];
                    }

        } else {
            $newUserNfo['username'] = $userNfo['username'];
        }

        /*IDEM pour le champ e-mail*/
        if ((!empty($formNfos['mail'])) && filter_var($_POST['mail'], FILTER_VALIDATE_EMAIL) && ($formNfos['mail'] != $userNfo['mail'])) {
            /*Ajout de la nouvelle addresse mail au tableau*/
            $newUserNfo['mail'] =  $formNfos['mail'];
        } else {
            $newUserNfo['mail'] = $userNfo['mail'];
        }  

        /*Pour le champ de mot de passe*/
        if (!empty($formNfos['password'])) {
            /*est-ce que l'ancien mot de passe est correct*/
            if (password_verify($formNfos['oldpassword'], $userNfo['password']) && ($formNfos['password'] === $userNfo['password'])) {
                /*cryptage du mot-de-passe*/
                $newUserNfo['password'] = password_hash($formNfos['password'], PASSWORD_DEFAULT);
            } else {
                echo "<div class='editmsg'>Erreur pendant la modification du mot de passe, un champ est érroné</div>";
                $this->error = True;
                $newUserNfo['password'] = $userNfo['password'];
            }

        } else {
            $newUserNfo['password'] = $userNfo['password'];
        }
        
        /*Pour le champ d'image utilisateur*/
        if (!empty($_FILES['userimage']['name'])) {
            /*Ajout du champ image*/
            $newUserNfo['image'] = $_FILES['userimage']['name'];
            //Si l'image actuelle n'est pas celle par défaut...
            if ($userNfo['image'] != 'defaultimg.jpg') {
                //Supression de l'ancienne image du dossier
                unlink('public/img/users/'.$userNfo['image'].'');
            }
            
            //Ajout de la nouvelle image dans le dossier
            move_uploaded_file($_FILES['userimage']['tmp_name'],'public/img/users/'.$newUserNfo['image'].'');
        } else {
            $newUserNfo['image'] = $userNfo['image'];
        }
        //Edition d'utilisateur
        $this->user->editUser($userNfo['id'], $newUserNfo['username'], $newUserNfo['mail'], $newUserNfo['password'], $newUserNfo['image']);
        //Edition des informations de session
        $this->session->editSession($newUserNfo['username'], $newUserNfo['mail'], $newUserNfo['image']);
        if (!$this->error) {
            echo "<div class='editmsg'>Modifications enregistrées avec succès</div>";
        }
        
    }
}

$page = 'EditUserView';

include  ''.ROOT.'/public/LayoutView.phtml';