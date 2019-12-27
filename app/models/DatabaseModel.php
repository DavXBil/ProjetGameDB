<?php


class Database {

	private $pdo;
	private string $host = "localhost";
	private string $user = "root";
	private string $pass = "";
	private string $dbname = "video_games_archives";
	private static $_instance;
	
	private function __construct() {
		try {
			$this->pdo = new PDO('mysql:host=' .$this->host. ';dbname=' . $this->dbname.';charset=UTF8',
				$this->user,
				$this->pass,
					[
						PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
						PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
					]);
		} catch(PDOException $e) {
			echo 'Une Erreur est survenue : '.$e->getMessage();
			die;
		};
	}
	/*Méthode de récupération de l'instance de BDD*/
	public static function getInstance() {

		if (is_null(self::$_instance)) {
		 self::$_instance = new Database();
		}

		return self::$_instance;
	}
	/*Execution de requête d'ajout/supression/édition */
	public function execSql($sql, array $values = array()) {

		$query = $this->pdo->prepare($sql);

		$query->execute($values);

		return $this->pdo->lastInsertId();
	}
	/*Execution de requête de récuperation d'éléments BDD*/
    public function query($sql, array $criteria = array()) {

        $query = $this->pdo->prepare($sql);
		$query->execute($criteria);

        return $query->fetchAll(PDO::FETCH_ASSOC);
    }
	/*Execution de requête de récuperation d'un élément BDD*/
    public function queryOne($sql, array $criteria = array()) {
		
        $query = $this->pdo->prepare($sql);

        $query->execute($criteria);

        return $query->fetch(PDO::FETCH_ASSOC);
    }
}
