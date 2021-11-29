'use strict';
/*import Basket from './classes/Basket.js'

import * as util from './classes/utilities.js'*/


//Bouton d'affichage d'évalutaion complète
const readMoreReviewLinks = document.querySelectorAll(".readmore")

//Message d'erreur de champs mail
const errorMail = document.querySelector(".error-mail")
//Message d'erreur de champs de mot de passe
const errorPassword = document.querySelector(".error-password")
//Formulaire d'authentification 
const loginForm = document.querySelector(".login")
//Barre de recherche
const searchBar = document.querySelector(".search")

//Bouton d'affichage du formulaire d'authentification
const LoginButton = document.getElementById("login-icon")
//Bouton d'affichage de la barre de recherche
const SearchButton = document.getElementById("search-icon")

const registerButton = document.getElementById('regbtn')
//Bouton reininitialisation de formulaire
const resetButton = document.getElementById("reset-button")
//Bouton d'ajout de jeu
const addButton = document.getElementById("add-button")
//Bouton d'ajout de champs de genre
const addGenreFieldButton = document.getElementById("addgenre")
//Bouton de retrait de champs de genre
const removeGenreFieldButton = document.getElementById("removegenre")
//Bouton d'ajout de champs de platforme
const addPlatformFieldButton = document.getElementById("addplatform")
//Bouton de retrait de champs de plateforme
const removePlatformFieldButton = document.getElementById("removeplatform")


let genreNb = 1
let platformNb = 1


/////////////////////////////////////////////////////////////////////////////////////////
// FONCTIONS                                                                           //
/////////////////////////////////////////////////////////////////////////////////////////


function toggleMobileLogin() {

    loginForm.classList.toggle("hidden")

    if (!searchBar.classList.contains("hidden")) {
        searchBar.classList.add("hidden")
    }

}

function toggleMobileSearchBar() {

    searchBar.classList.toggle("hidden")

    if (!loginForm.classList.contains("hidden")) {
        loginForm.classList.add("hidden")
    }

}

//Activation/Désactivation des bouton submit
function toggleSubmit(value) {
    if (addButton !== null) {
        addButton.disabled = value
    } else if (registerButton !== null) {
        registerButton.disabled = value
    }
}

// Vérification si le champ est vide
function checkEmpty(field) {
    //Si il est vide changement de couleur du champ, ajout du message d'erreur et blocage de l'envoi du formulaire
    if (field.value == "") {  
        field.classList.add('error')
        field.placeholder = "Ce champ doit être rempli"
        toggleSubmit(true)        
    } else {
        //Sinon on retire l'erreur
        field.classList.remove('error')
        toggleSubmit(false) 
    }
}

function checkMail(field) {
    //Le mail correspond t'il au shéma attendu ci-dessous?
    let regex = /^[a-zA-Z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$/
    //Si non affichage de l'erreur et blocage du formulaire
    if (!regex.test(field.value)) {
        field.classList.add('error')
        errorMail.classList.remove('hidden')
        toggleSubmit(true) 
    } else {
    //Si oui on retire l'erreur
        field.classList.remove('error')
        errorMail.classList.add('hidden')
        toggleSubmit(false) 
    }
}

function checkPassword(field) {
    //le mot de passe fait t'il plus que 7 caractères? 
    if (field.value.length < 7) {
        //Si non, erreur
        field.classList.add('error')
        errorPassword.classList.remove('hidden')
        toggleSubmit(true) 
    } else {
        //Si oui, on retire l'erreur
        field.classList.remove('error')
        errorPassword.classList.add('hidden')
        toggleSubmit(false) 
    }
    return field.value
}

function confirmPswrd(field, password) {
    //le champ de confirmation du mot de passe est-il identique au champ précedent?
    //Non? erreur
    if (field.value !== password.value) {
        field.classList.add('error')
        errorPassword.classList.remove('hidden') 
        toggleSubmit(true)        
    } else {
    //Oui? on retire l'erreur
        field.classList.remove('error')
        errorPassword.classList.add('hidden')
        toggleSubmit(false) 
    }
}

//Fonction d'appel de toutes les fonctions de verification des champs de formulaire
function checkForm(field) {
    //On verifie que tous les champs sont remplis
    checkEmpty(field)
    //Si c'est le champ du mail, on appelle la fonction adéquate
    if (field.id === "mail") {
        checkMail(field)
    }// IDEM pour le mdp 
    if (field.id === "password") {
        checkPassword(field)
    }// IDEM pour la confirmation du mdp
    if (field.id === "pswrdconfirm") {
        let password = document.getElementById('password')
        confirmPswrd(field, password)
    }
}

// Fonction d'ajout de champs select de genre du formulaire d'ajout de jeu 
function addGenreSelect() {
    if (genreNb < 3) {
        genreNb++
        let genreSelect = document.getElementById('genre' + genreNb)
        genreSelect.classList.remove('hidden')
    }
    if (genreNb >= 2 ) {
        //Activation du bouton de retrait de champ
        removeGenreFieldButton.classList.remove('disabled')
    }
    if (genreNb == 3) {
        //Désactivation du bouton d'ajout de champ
        addGenreFieldButton.classList.add('disabled')
    }
}
// Fonction de retrait de champs select de genre du formulaire d'ajout de jeu
function removeGenreSelect() {
    if (genreNb >= 2) {
        let genreForm = document.getElementById('genre' + genreNb)
        let genreSelect = document.getElementById('genreselect' + genreNb)
        genreSelect.value = 0
        genreForm.classList.add('hidden')
        genreNb--
    }
    if (genreNb < 2 ) {
        //Désactivation du bouton de retrait de champ
        removeGenreFieldButton.classList.add('disabled')
    }
    if (genreNb < 3) {
        //Activation du bouton d'ajout de champ
        addGenreFieldButton.classList.remove('disabled')
    }
}

// Fonction d'ajout de champs select de plateforme du formulaire d'ajout de jeu 
function addPlatformSelect() {
    if (platformNb < 6) {
        platformNb++
        let platformSelect = document.getElementById('platform' + platformNb)
        platformSelect.classList.remove('hidden');           
    }
    if (platformNb >= 2 ) {
        //Activation du bouton de retrait de champ
       removePlatformFieldButton.classList.remove('disabled')
    }
    if (platformNb == 6) {
        //Désactivation du bouton d'ajout de champ
        addPlatformFieldButton.classList.add('disabled')
    }
}

// Fonction de retrait de champs select de plateforme
function removePlatformSelect() {
    if (platformNb >= 2) {
        let platformForm = document.getElementById('platform' + platformNb)
        let platformSelect = document.getElementById('platformselect' + platformNb)
        platformSelect.value = 0
       platformForm.classList.add('hidden');
        platformNb--
    }
    if (platformNb < 2 ) {
        //Désactivation du bouton de retrait de champ
       removePlatformFieldButton.classList.add('disabled')
    }
    if (platformNb < 6) {
        //Activation du bouton d'ajout de champ
       addPlatformFieldButton.classList.remove('disabled')
    }
}

//Fonction d'affichage d'évaluation complète
function readMoreReview(e) {
    let readMoreReviewLink = e.target
    let insight = document.getElementById("insight" + readMoreReviewLink.id)
    let fullReview = document.getElementById("fullreview" + readMoreReviewLink.id)
    insight.classList.toggle('hidden')
    fullReview.classList.toggle('hidden')
    readMoreReviewLink.classList.toggle('showed')
    //Si l'évaluation complète est cachée  
    if (!readMoreReviewLink.classList.contains("showed")) {
        readMoreReviewLink.innerHTML = 'Voir plus'
    //Si l'évalutaion complète est montrée
    } else if (readMoreReviewLink.classList.contains("showed")) {
        readMoreReviewLink.innerHTML = 'Voir moins'
    }
    e.preventDefault()
}


function imagePreview(e){
    let preview = document.querySelector('.imgpreview')
    preview.src =  URL.createObjectURL(e.target.files[0]) 
}

function resetPreview() {
    let preview = document.querySelector('.imgpreview')
    URL.revokeObjectURL(preview.src)
    preview.src = "public/img/users/defaultimg.jpg"
}

/////////////////////////////////////////////////////////////////////////////////////////
// CODE PRINCIPAL                                                                      //
/////////////////////////////////////////////////////////////////////////////////////////


LoginButton.addEventListener("click", toggleMobileLogin)

SearchButton.addEventListener("click", toggleMobileSearchBar)

if (readMoreReviewLinks) {
    for (let i = 0; i < readMoreReviewLinks.length; i++) {
    readMoreReviewLinks[i].addEventListener('click', readMoreReview)
    }
}

if (addGenreFieldButton) {
    addGenreFieldButton.addEventListener('click', addGenreSelect)
}

if (removeGenreFieldButton) {
    removeGenreFieldButton.addEventListener('click', removeGenreSelect)}

if (addPlatformFieldButton) {
    addPlatformFieldButton.addEventListener('click', addPlatformSelect)
}

if (removePlatformFieldButton) {
    removePlatformFieldButton.addEventListener('click', removePlatformSelect)
}

if (resetButton) {
   resetButton.addEventListener("click", resetPreview)  
}