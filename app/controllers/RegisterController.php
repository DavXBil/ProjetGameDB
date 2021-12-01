<?php

class RegisterController {

    private object $userModel;

    public function register() {

        $this->userModel = new UserModel();
        /*Si tout les champs sont remplis et valides...*/
        if (!empty($_POST['username']) && filter_var($_POST['mail'], FILTER_VALIDATE_EMAIL) && $_POST['password'] && $_POST['password'] == $_POST['pswrdconfirm']) {
            /*Le pseudo est-il déà utilisé?*/ 
            $users = $this->userModel->find($_POST['username']);
            /*Sinon...*/
            if (empty($users)) {
                                
                /*cryptage du mot de passe...*/
                $hashedPassword = password_hash($_POST['password'], PASSWORD_DEFAULT);
                /*si aucune image d'utilisateur n'est defini on defini l'image par défaut*/           
                if ($_FILES['userimage']['error'] === 4){
                    $userImage = 'defaultimg.jpg';
                } else {
                    $userImage = $_FILES['userimage']['name'];
                }
                /*et envoi*/
                $this->userModel->addUser($_POST['username'], $_POST['mail'], $hashedPassword, $userImage); 
                move_uploaded_file($_FILES['userimage']['tmp_name'],'public/img/users/'.$userImage.'');
                // Message de confirmation d'enregistrement
                echo "<div class='addmsg'>Enregistrement effectué avec succès.</div>";
            } else {
                // Si oui: message
                echo "<div class='addmsg'>Ce Pseudo existe déjà.</div>";
            }
        }
    }
}

$page = 'RegisterView';

include  ''.ROOT.'/public/LayoutView.phtml';