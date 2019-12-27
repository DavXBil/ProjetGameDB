<?php

class UserModel {

   public function __construct() {
        $this->_instance = Database::getInstance();
    }

    /*Requête de recherche d'un utilisateur*/
    public function find($userName) {
        $sql = 'SELECT * FROM user WHERE username = :username';
        return $this->_instance->queryOne($sql, ['username' => $userName]);
    }

    /*Requête d'ajout d'utilisateur*/
    public function addUser($userName, $mail, $password, $userImage) {
        $sql = 'INSERT INTO user (is_admin, username, mail, password, image)
        VALUES (:is_admin, :username, :mail, :password, :userimage)';
        $this->_instance->execSql($sql, ['is_admin' => 0, 'username' => $userName, 'mail' => $mail, 'password' => $password, 'userimage' => $userImage]);
    }

    /*Requête d'édition d'utilisateur*/
    public function editUser($userId, $userName, $mail, $password, $userImage) {
        $sql = 'UPDATE user SET username = :username, mail = :mail, password = :password, image = :userimage 
        WHERE id= :userid';
        $this->_instance->execSql($sql, ['username' => $userName, 'mail' => $mail, 'password' => $password, 'userimage' => $userImage, 'userid' => $userId]);
    } 
}