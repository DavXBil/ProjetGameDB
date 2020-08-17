const ELEMENTSLIMIT = 21
let nbPage = 1
let currentPage = 1
let w = window
let pagingNavBar = document.getElementById('pagingnavbar')


passedArray = Object.entries(passedArray).map(e => e[1])


for (let i = 0; i <= passedArray.length - 1; i++) {
	
	if (typeof w["array" + nbPage] == 'undefined') {

		w["array" + nbPage] = []
	}
	if (w["array" + nbPage].length == ELEMENTSLIMIT) {

		nbPage++
		w["array" + nbPage] = []
	}
		w["array" + nbPage].push(passedArray[i])
}

function loadFile() {
	let table;
	
	let xhr = new XMLHttpRequest();
 	let url
	let tableHeader = ""
	let tableBody = []
	let elements = w["array" + currentPage]

		//Somme nous sur la page "Tous les Jeux"?
		if (window.location.href.indexOf("index.php?p=all") != -1) {

			//Création du tableau correspondant
			url = window.location.href

			tableHeader = 
			`<thead>
				<tr>
					<th>Jeux</th>
					<th>Plateformes:</th>
					<th>Genres:</th>
					<th>Année de parution:</th>
				</tr>
			</thead>
			<tbody>`

			//Parcours des element et creation du corps du tableau
			elements.forEach(function(element) {
				tableBody += 
					`<tr>
						<td>
							<a href="index.php?p=show&id=${element.id}" class="gamename" >
								<img src="public/img/games/${element.image}">
								${element.name}
							</a>
						</td>
						<td>`;
							for(let i = 0; i <= element.platform.length - 1; i++) {
								if (i < element.platform.length - 1) {
									tableBody += `<a href="index.php?p=all&platformfilter=${element.platform[i].id}">${element.platform[i].name}</a> /`
								} else {
									tableBody += `<a href="index.php?p=all&platformfilter=${element.platform[i].id}">${element.platform[i].name}</a>
									</td>
									<td>`
								}                   
							}
							for(let i = 0; i <= element.genre.length - 1; i++) {

								if (i < element.genre.length -1 ) {
									tableBody += `<a href="index.php?p=all&genrefilter=${element.genre[i].id}">${element.genre[i].name}</a> /`
								} else {
									tableBody += `<a href="index.php?p=all&genrefilter=${element.genre[i].id}">${element.genre[i].name}</a></td>`
								}                        
							}
						tableBody += `<td>${element.released_at}</td></tr>
						</tbody>`
				})
			
			//Ajout du tableau dans le DOM
			document.getElementById('allgametable').innerHTML = tableHeader + tableBody
				
		// Sinon somme nous sur la page admin?
		} else if (window.location.href.indexOf("index.php?p=admin") != -1) {

			
			let list = document.querySelector('.list').querySelector('.currentpage')
			let listId = list.id
			url = list.getAttribute('href')
			
			//Quel tableau cherchons nous à afficher?
			switch (listId) {
				case 'game':
					table = 'admingame'
					break;
				case 'dev':
					table = 'admindev'
					break;
				case 'editor':
					table = 'admineditor'
					break;
				case 'genre':
					table = 'admingenre'
					break;
				case 'platform':
					table = 'adminplatform'
					break;
			}
			//liste des jeux
			if (table === 'admingame') {
				
				tableHeader = 
					`<thead>
						<tr>
							<th>Nom</th>
							<th>Ajouté le:</th>
							<th>Ajouté par:</th>
						</tr>
					</thead>
					<tbody>`

				
				for(let i = 0; i <= elements.length - 1; i++) {
					tableBody = tableBody + 
							`<tr>
								<td><a href="index.php?p=show&id=${elements[i].id}" class="gamename"> ${elements[i].name}</a></td>
								<td>${elements[i].created_at}</td>
								<td href="index.php?p=user&id=${elements[i].user_id} ?>"> ${elements[i].username}</td>
								<td><a href="index.php?p=editg&id= ${elements[i].id}"><i class="fa fa-edit"></i></a></td>
								<td><a href="index.php?p=admin&action=delgame&id=${elements[i].id}&list=game"><i class="fas fa-times"></i></a></td>
							</tr>
						</tbody>`
				};
			//les autres tableaux ont une construction similaire et rentre donc dans cette condition
			} else {

				tableHeader = 
					`<thead>
					<tr>
						<th>Nom</th>
					</tr>
					</thead>
					<tbody>`

				for(let i = 0; i <= elements.length - 1; i++) {
					tableBody = tableBody + 
							`<tr>
								<td><a href="index.php?p=all&devfilter=${elements[i].id}">${elements[i].name}</a></td>
								<td><a href="index.php?p=admin&action=delgame&id=${elements[i].id} &list=dev"><i class="fas fa-times"></i></a></td>
							</tr>
						</tbody>`
				}
			}	
			//Ajout dans le DOM
			document.getElementById(table).innerHTML = tableHeader + tableBody
		}
	
	
	xhr.open('GET', url);

	xhr.addEventListener('readystatechange', function() {

		if (xhr.readyState === 4 && xhr.status === 200) { // Si le fichier est chargé sans erreur

			//Création de la pagination
			
			let paging = ""

			
			if (currentPage > 1) {
				paging += `<a href="#" name="${currentPage}" class="paginglink">Précedent</a>`
			}

			for (let i = 1; i <= nbPage; i++) {
				if (i == currentPage) {
					paging += `<a href="#" name="${i}" id="current" class="paginglink currentpage">${i}</a>`
				} else {
					paging += `<a href="#" name="${i}" class="paginglink">${i}</a>`
				}
			}

			if (currentPage < nbPage) {
				paging += `<a href="#" name="${currentPage}" class="paginglink">Suivant</a>`
			}

			// Et on affiche
			document.getElementById('pagingnavbar').innerHTML = paging

		}
	});
	xhr.send(document)
}

function changePage(e) {

	let link = e.target

	currentPage = link.name

	switch (link.innerText) {
		case "Suivant":
			currentPage++
			break;
			
		case "Précedent":
			currentPage--
			break;
	}

	loadFile()

	e.preventDefault()
}

document.addEventListener('onLoad', loadFile())

pagingNavBar.addEventListener('click', function(e) {
	if (e.target && e.target.className == 'paginglink') {
		changePage(e)
	}
})