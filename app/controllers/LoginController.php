<?php

require ''.ROOT.'/app/models/UserModel.php';
require ''.ROOT.'/app/classes/UserSession.php';

class LoginController {

	/*Méthode d'authentification */
	public function getSession() {

		$userModel = new UserModel();
		$error = "<div class= errormsg id=loginmsg>L'identifiant ou le mot de passe est incorrect</div>";
		$userToLog =  $userModel->find($_POST['login']);

		if (!empty($userToLog)) {

			/*Verification du mot de passe*/
			if (password_verify($_POST['loginpswrd'], $userToLog['password']) === true) {
				$userSession = new UserSession();
				$userSession->create($userToLog['id'], $userToLog['username'], $userToLog['mail'], $userToLog['is_admin'], $userToLog['image']);
				header('Location: index.php');
			} else {
				echo $error;
			}

		} else {
			echo $error;
		}	
	}
	
	/*Methode de verification d'authentification */
	public function checkAuthentication() {
		$userSession = new UserSession();
		return $userSession->isAuthenticated();
	}

	/*Methode de verification des droits d'utilisateurs */
	public function isAdmin() {
		$userSession = new UserSession();
		$isAdmin = $userSession->getAdminStatus();
		if ($isAdmin == 1) {
			return  true;
		} else {
			return false;
		}
	}
	/*Methode de recupération d'Id d'utilisateur*/
	public function showId() {
		$userSession = new UserSession();
		return $userSession->getId();
	}

	/*Methode de recupération du nom d'utilisateur*/
	public function showName() {
		$userSession = new UserSession();
		return $userSession->getName();
	}

	/*Methode de recupération de l'image d'utilisateur*/
	public function showUserImage() {
		$userSession = new UserSession();
		return $userSession->getImage();
	}
	
	/*Methode de fermeture de session */
	public function close() {
		$userSession = new UserSession();
		$userSession->destroy();	
		header('Location: index.php');
	}
}