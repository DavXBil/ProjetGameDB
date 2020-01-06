<?php


class GameModel {

	private $_instance;

	public function __construct() {
		$this->_instance = Database::getInstance();
	}

	/*Recherche de tous les jeux en BDD*/
	public function findAll() {
		$sql = 'SELECT SQL_CALC_FOUND_ROWS game.id, game.name, game.dev_id, game.editor_id, game.released_at, game.created_at, game.description, game.user_id, username, game.image
		FROM game
		INNER JOIN user ON game.user_id = user.id
		INNER JOIN genrelink ON genrelink.game_id = game.id
		INNER JOIN platformlink ON platformlink.game_id = game.id
		INNER JOIN developper ON developper.id = game.dev_id
		INNER JOIN editor ON editor.id = game.editor_id
		WHERE 1=1 ';

		$values = [];
			
		if (!empty($_POST['search'])) {
			$search = htmlentities($_POST['search'], ENT_QUOTES);
		} elseif (!empty($_GET['search'])) {
			$search = htmlentities($_GET['search'], ENT_QUOTES);
		}

		/*Si il y a des mots clés entrés on les ajoute à la requête*/
		if (isset($search)) {
			$searchWords = explode(" ", $search);
			foreach ($searchWords as $word) {
				$sql .= "AND game.name LIKE ?";
			
				array_push($values, "%".$word."%");
			} 
		}

		/*--------------Test des filtres de recherches--------------*/
		
		/*Si des données de filtre de genre sont enregistré et sur une valeur valide*/
		if (!empty($_POST['genrefilter']) || !empty($_GET['genrefilter'])) {
			if (!empty($_POST['genrefilter']) && $_POST['genrefilter'] != 0) {
				$genreFilter = $_POST['genrefilter'];
				/*On ajoute à la requête*/
				$sql .= 'AND genrelink.genre_id = ? ' ;
				array_push($values,$genreFilter);
			} elseif (!empty($_GET['genrefilter']) && $_GET['genrefilter'] != 0 ) {
				$genreFilter = $_GET['genrefilter'];
				/*On ajoute à la requête*/
				$sql .= 'AND genrelink.genre_id = ? ' ;
				array_push($values,$genreFilter);
			}
		}

		/*IDEM pour le champs de platfeforme*/
		if (!empty($_POST['platformfilter']) || !empty($_GET['platformfilter'])) {
			if (!empty($_POST['platformfilter']) && $_POST['platformfilter'] != 0) {
				$platformFilter = $_POST['platformfilter'];
				/*On ajoute à la requête*/
				$sql .= 'AND platformlink.platform_id = ? ' ;
				array_push($values,$platformFilter);
			} elseif (!empty($_GET['platformfilter']) && $_GET['platformfilter'] != 0 ) {
				$platformFilter = $_GET['platformfilter'];
				/*On ajoute à la requête*/
				$sql .= 'AND platformlink.platform_id = ? ' ;
				array_push($values,$platformFilter);
			}
		}

		/*IDEM pour le champs de développeur*/
		if (!empty($_POST['devfilter']) || !empty($_GET['devfilter'])) {
			if (!empty($_POST['devfilter']) && $_POST['devfilter'] != 0) {
				$devFilter = $_POST['devfilter'];
			} elseif (!empty($_GET['devfilter']) && $_GET['devfilter'] != 0 ) {
				$devFilter = $_GET['devfilter'];
			}
			$sql .= 'AND developper.id = ? ' ;
			array_push($values,$devFilter);
		}

		/*IDEM pour le champs de éditeur*/
		if (!empty($_POST['editorfilter']) || !empty($_GET['editorfilter'])) {
			if (!empty($_POST['editorfilter']) && $_POST['editorfilter'] != 0) {
				$editorFilter = $_POST['editorfilter'];
			} elseif (isset($_GET['editorfilter']) && $_GET['editorfilter'] != 0 ) {
				$editorFilter = $_GET['editorfilter'];
			}
			$sql .= 'AND editor.id = ? ' ;
			array_push($values,$editorFilter);
		}

		/*Si enregistré, ajout du critère de tri par première lettre du nom de jeu  */
		if (!empty($_GET['letterfilter'])) {
			$letter = strtolower($_GET['letterfilter']);
			$sql .= "AND game.name LIKE ?";
			array_push($values,$letter."%");
		}

		//Si un ordre de tri est enregistré

		$orderFilter = $_POST['orderfilter'] ?? $_GET['orderfilter'] ?? $orderFilter = 'alphabeticalasc';

		//Test du choix d'ordre de tri
		switch ($orderFilter) {
			case 'alphabeticalasc':
				$order = "game.name ASC";
				break;
			case 'alphabeticaldesc':
				$order = "game.name DESC";
				break;
			case 'creationdateasc':
				$order = "game.created_at ASC";
				break;
			case 'creationdatedesc':
				$order = "game.created_at DESC";
				break;
			case 'releasedateasc':
				$order = "game.released_at ASC";
				break;
			case 'releasedatedesc':
				$order = "game.released_at DESC";
				break;
		}

		/*Tri par ordre choisi ou par défaut*/
		$sql .= 'ORDER BY '.$order.'';

		return $this->_instance->query($sql, $values);
	}

	/*Requête de recherche des jeux les plus populaire*/
	public function findPopularGames() {
		$sql = 'SELECT game.name, game.image, game.id AS gameId, AVG(note) AS moyenne, released_at
		FROM review
		INNER JOIN game ON game.id = review.game_id
		INNER JOIN genrelink ON genrelink.game_id = game.id
		INNER JOIN genre ON genrelink.genre_id = genre.id
		GROUP BY gameId
		ORDER BY moyenne DESC
		LIMIT 5';
		return $this->_instance->query($sql);
	}
	/*Requête de recherche du nombre total de jeux en BDD*/
	public function findRows() {
		$sql="SELECT found_rows()";
		return $this->_instance->query($sql);
	}
	/*Requete de recherche de jeux avec limite pour le tableau admin*/
	public function findLimitGames() {
		$sql = 'SELECT SQL_CALC_FOUND_ROWS game.id, game.name, game.dev_id, game.editor_id, game.released_at, game.created_at, game.description, game.user_id, username, game.image
		FROM game
		INNER JOIN user ON game.user_id = user.id
		ORDER BY game.name ASC';
		return $this->_instance->query($sql);
	}
	/*Requete de recherche de developpeurs avec limite pour le tableau admin*/
	public function findLimitDevs() {
		$sql = 'SELECT SQL_CALC_FOUND_ROWS id, developper.name FROM developper ORDER BY name ASC';
		return $this->_instance->query($sql);
	}
	/*Requête de recherche des éditeurs avec limite pour le tableau admin*/
	public function findLimitEditors() {
		$sql = 'SELECT SQL_CALC_FOUND_ROWS id, editor.name FROM editor ORDER BY name ASC';
		return $this->_instance->query($sql);
	}
	/*Requête de recherche des genres avec limite pour le tableau admin*/
	public function findLimitGenres() {
		$sql = 'SELECT SQL_CALC_FOUND_ROWS id, genre.name FROM genre ORDER BY name ASC';
		return $this->_instance->query($sql);
	}
	/*Requête de recherche des plateformes avec limite pour le tableau admin*/
	public function findLimitPlatforms() {
		$sql = 'SELECT SQL_CALC_FOUND_ROWS id, platform.name FROM platform ORDER BY name ASC';
		return $this->_instance->query($sql);
	}

	/*Requête de recherche d'un jeu unique par id*/
	public function findGame($id) {
		$sql = 'SELECT game.id, game.name, game.image, game.dev_id, game.editor_id, game.released_at, game.created_at, game.description, developper.name AS devName, editor.name AS editorName
		FROM game
		INNER JOIN developper ON developper.id = game.dev_id
		INNER JOIN editor ON editor.id = game.editor_id
		WHERE game.id = :id';
		return $this->_instance->queryOne($sql, ['id' => $id]);
	}
	/*Requête de recherche d'un jeu unique par nom*/
	public function findGameByName($name) {
		$sql = 'SELECT game.name FROM game WHERE game.name = :name';
		return $this->_instance->queryOne($sql, ['name' => $name]);
	}
	/*Requête de recherche d'un jeu unique par id d'utilisateur*/
	public function findGameByUsers($id) {
		$sql = 'SELECT count(game.id) AS addedGames, game.id, game.name, game.image
		FROM game
		WHERE game.user_id = :id';
		return $this->_instance->queryOne($sql, ['id' => $id]);
	}
	/*Requête de recherche d'évaluation d'un jeu*/
	public function findReviews($id) {
		$sql = 'SELECT review.note, review.comment, review.post_date, user.id AS userId, user.username, user.image
		FROM review
		INNER JOIN user ON user.id = review.user_id
		WHERE review.game_id = :id';
		return $this->_instance->query($sql, ['id' => $id]);
	}
	/*Requête de recherche d'évaluation par id d'utilisateur*/
	public function findReviewsByUser($userId) {
		$sql = 'SELECT review.note, review.comment, review.post_date, user.username, game.image, game.name AS gameName
		FROM review
		INNER JOIN user ON user.id = review.user_id
		INNER JOIN game ON game.id = review.game_id
		WHERE review.user_id = :userid
		ORDER BY review.post_date DESC';
		return $this->_instance->query($sql, ['userid' => $userId]);
	}
	/*Requête de recherche du dernier jeu ajouté*/
	public function findLastId() {
		$sql = 'SELECT MAX(game.id) AS lastGame 
		FROM game';
		return $this->_instance->queryOne($sql);
	}
	/*Requête de recherche des 5 dernier jeux ajoutés*/
	public function findLastAdded() {
		$sql = 'SELECT game.id, game.name, game.created_at, game.image
		FROM game
		ORDER BY game.id DESC LIMIT 5';
		return $this->_instance->query($sql);
	}
	/*Requête de recherche des developppeurs*/
	public function findAllDev() {
		$sql = 'SELECT * FROM developper ORDER BY name';
		return $this->_instance->query($sql);
	}
	/*Requête de recherche des éditeurs*/
	public function findAllEditor() {
		$sql = 'SELECT * FROM editor ORDER BY name';
		return $this->_instance->query($sql);
	}
	/*Requête de recherche des genres*/
	public function findAllGenre() {
		$sql = 'SELECT * FROM genre ORDER BY name';
		return $this->_instance->query($sql);
	}
	/*Requête de recherche des plateformes*/
	public function findAllPlatform() {
		$sql = 'SELECT * FROM platform ORDER BY name';
		return $this->_instance->query($sql);
	}
	/*Requête de recherche des plateformes d'un seul jeu*/
	public function findSingleGamePlatforms($id) {
		$sql = 'SELECT platform.name, platform.id
		FROM platformlink
		INNER JOIN platform ON platformlink.platform_id = platform.id
		WHERE platformlink.game_id = :id';
		return $this->_instance->query($sql, ['id' => $id]);
	}
	/*Requête de recherche des genres d'un seul jeu*/
	public function findSingleGameGenre($id) {
		$sql = 'SELECT genre.name, genre.id
		FROM genrelink
		INNER JOIN genre ON genrelink.genre_id = genre.id
		WHERE genrelink.game_id = :id';
		return $this->_instance->query($sql, ['id' => $id]);
	}
	/*Requête de recherche des developpeurs d'un seul jeu*/
	public function findSingleGameDev($id) {
		$sql = 'SELECT *
		FROM developper
		WHERE id = :id';
		return $this->_instance->query($sql, ['id' => $id]);
	}
	/*Requête de recherche des éditor d'un seul jeu*/
	public function findSingleGameEditor($id) {
		$sql = 'SELECT *
		FROM editor
		WHERE id = :id';
		return $this->_instance->query($sql, ['id' => $id]);
	}
	/*Requête d'ajout de jeu*/
	public function addGame($newGameName, $newGameDescription, $newGameDev, $newGameEditor, $newGameReleaseDate, $newGameCreateDate, $newGameUserId, $newGameImage) {
		$sql = 'INSERT INTO game (name, description, dev_id, editor_id, released_at, created_at, user_id, image)
				VALUES (:newgamename, :newgamedescription, :newgamedev, :newgameeditor, :newgamereleaseddate, :newgamecreatedate, :newgameuserid, :newgameimage)';
		return $this->_instance->execSql($sql, ['newgamename' => $newGameName, 'newgamedescription' => $newGameDescription, 'newgamedev' => $newGameDev, 'newgameeditor' => $newGameEditor, 'newgamereleaseddate' => $newGameReleaseDate, 'newgamecreatedate' => $newGameCreateDate, 'newgameuserid' => $newGameUserId, 'newgameimage' => $newGameImage]);
	}
	/*Requête d'ajout de developpeur*/
	public function addDevelopper($newDev) {
		$sql = 'INSERT INTO developper (name)
		VALUES (:newdev)';
		return $this->_instance->execSql($sql, ['newdev' => $newDev]);
	}
	/*Requête d'ajout d'éditeur*/
	public function addEditor($newEditor) {
		$sql = 'INSERT INTO editor (name)
		VALUES (:neweditor)';
		return $this->_instance->execSql($sql, ['neweditor' => $newEditor]);
	}
	/*Requête d'ajout de genre*/
	public function addGenre($newGenre) {
		$sql = 'INSERT INTO genre (name)
		VALUES (:newgenre)';
		return $this->_instance->execSql($sql, ['newgenre' => $newGenre]);
	}
	/*Requête d'ajout de plateforme*/
	public function addPlatform($newPlatformName, $newPlatformDate) {
		$sql = 'INSERT INTO platform (name, launched_at)
		VALUES (:newplatformname, :newplatformdate)';
		return $this->_instance->execSql($sql, ['newplatformname' => $newPlatformName, 'newplatformdate' => $newPlatformDate]);
	}
	/*Requête d'ajout de lien de plateforme*/
	public function addPlatformLink($platforms, $gameId) {

		$sql = 'INSERT INTO platformlink (platform_id, game_id) 
				VALUES ';
		$values = [];
		for ($i=0; $i < count($platforms); $i++) { 
			if ($i < count($platforms)-1) {
				$sql .= "(?, ?), ";
			} else {
				$sql .= "(?, ?)";
			}
			array_push($values,$platforms[$i]);
			array_push($values, $gameId);
		}
		
		$this->_instance->execSql($sql, $values);
	}
	/*Requête d'ajout de lien de genre*/
	public function addGenreLink($genres, $gameId) {

		$sql = 'INSERT INTO genrelink (genre_id, game_id)
				VALUES ';
		$values = [];
		for ($i=0; $i < count($genres); $i++) { 
			if ($i < count($genres)-1) {
				$sql .= "(?, ?), ";
			} else {
				$sql .= "(?, ?)";
			}
			array_push($values,$genres[$i]);
			array_push($values, $gameId);
		}
		$this->_instance->execSql($sql, $values);
	}
	/*Requête d'ajout d'évaluation*/
	public function addReview($newReviewNote, $newReviewComment, $newReviewCreateDate, $newReviewGame, $newReviewUser) {
		$sql = 'INSERT INTO review (note, comment, post_date, game_id, user_id)
			VALUES (:newreviewnote, :newreviewcomment, :newreviewcreatedate, :newreviewgame, :newreviewuser)';
		$this->_instance->execSql($sql, ['newreviewnote' => $newReviewNote,'newreviewcomment' => $newReviewComment, 'newreviewcreatedate' => $newReviewCreateDate, 'newreviewgame' => $newReviewGame, 'newreviewuser' => $newReviewUser]);
	}
	/*Requête de suppression de jeu*/
	public function remove($removeId) {
		$sql = 'DELETE FROM game WHERE id= :removeid';
		$this->_instance->execSql($sql, ['removeid' => $removeId]);
	}
	/*Requête de suppression de jeu*/
	public function deletePlatformLink($removeId) {
		$sql = 'DELETE FROM platformlink WHERE game_id= :removeid';
		$this->_instance->execSql($sql, ['removeid' => $removeId]);
	}
	/*Requête de suppression de jeu*/
	public function deleteGenreLink($removeId) {
		$sql = 'DELETE FROM genrelink WHERE game_id= :removeid';
		$this->_instance->execSql($sql, ['removeid' => $removeId]);
	}
	/*Requête d'édition de jeu*/
	public function editGame($toEditGameId ,$toEditGameName, $toEditGameDescription, $toEditGameDev, $toEditGameEditor, $toEditGameReleaseDate, $toEditGamePicture) {
		$sql = 'UPDATE game SET name= :toeditgamename, description= :toeditgamedescription, dev_id= :toeditgamedev, editor_id= :toeditgameeditor, released_at= :toeditgamereleasedate, image=:toeditgamepicture  WHERE  id= :toeditgameid';
		$this->_instance->execSql($sql, ['toeditgamename' => $toEditGameName, 'toeditgamedescription' => $toEditGameDescription, 'toeditgamedev' => $toEditGameDev, 'toeditgameeditor' => $toEditGameEditor, 'toeditgamereleasedate' => $toEditGameReleaseDate, 'toeditgamepicture' => $toEditGamePicture, 'toeditgameid' => $toEditGameId]);
	}
	/*Requête de supression d'un élément*/
	public function deleteElement($toDeleteElement, $toDeleteElementTable) {
		$sql = 'DELETE FROM '.$toDeleteElementTable.' WHERE id= :element';
		$this->_instance->execSql($sql, ["element"=> $toDeleteElement]);
	}
} 