<?php



class UserSession {
	public function __construct() {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }
    /*Méthode de création de session*/
    public function create($id, $name, $email, $isAdmin, $image) {
        $_SESSION['user']['id'] = $id;
        $_SESSION['user']['name'] = $name;
        $_SESSION['user']['email'] = $email;
        $_SESSION['user']['is_admin'] = $isAdmin;
        $_SESSION['user']['image'] = $image;
    }
    /*Méthode de fermeture de session de session*/	
	public function destroy() {
        session_destroy();
    }
    /*Méthode de recupération de status d'utilisateur de session*/
    public function getAdminStatus() {
        $isAdmin = $_SESSION['user']['is_admin'];
        return $isAdmin;
    }
    /*Méthode de recupération d'image d'utilisateur*/
    public function getImage() {
        $image = $_SESSION['user']['image'];
        return $image; 
    }
    /*Méthode de recupération de pseudo d'utilisateur*/
    public function getName() {
        $name = $_SESSION['user']['name'];
        return $name;
    }
    /*Méthode de recupération d'image d'utilisateur*/
    public function getId() {
        $userId = $_SESSION['user']['id'];
        return $userId;
    }
    /*Méthode de recupération d'addresse mail*/
    public function getMail() {
        $userId = $_SESSION['user']['email'];
        return $userId;
    }
    /*Méthode de modification d'information de session d'utilisateur*/
    public function editSession($newUserName, $newMail, $newUserImage) {
        $_SESSION['user']['name'] = $newUserName;
        $_SESSION['user']['email'] = $newMail;
        $_SESSION['user']['image'] = $newUserImage;
    }
    /*Méthode de verification d'authentification d'utilisateur*/
	public function isAuthenticated() {
        if(array_key_exists('user', $_SESSION)) {
            if (!empty($_SESSION['user'])) {
                return true;
            }
        }
        return false;
    }
}