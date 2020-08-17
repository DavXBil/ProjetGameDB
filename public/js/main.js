'use strict';
/*import Basket from './classes/Basket.js'

import * as util from './classes/utilities.js'*/

/*let addForm = document.getElementById("addproduct")
let addBtn = document.getElementById("addbtn")*/

//Bouton d'enregistrement d'utilisateur
const regBtn = document.getElementById('regbtn')
//Bouton reininitialisation de formulaire
const resetBtn = document.getElementById("resetbtn")
//Bouton d'ajout de jeu
const addBtn = document.getElementById("addBtn")
//Message d'erreur de champs mail
const errorMail = document.querySelector(".errormail")
//Message d'erreur de champs de mot de passe
const errorPswrd = document.querySelector(".errorpswrd")
//Bouton d'ajout de champs de genre
const addGenreFieldBtn = document.getElementById("addgenre")
//Bouton de retrait de champs de genre
const removeGenreFieldBtn = document.getElementById("removegenre")
//Bouton d'ajout de champs de platforme
const addPlatformFieldBtn = document.getElementById("addplatform")
//Bouton de retrait de champs de plateforme
const removePlatformFieldBtn = document.getElementById("removeplatform")
//Bouton d'affichage d'évalutaion complète
const readMoreReviewLinks = document.querySelectorAll(".readmore")

let genreNb = 1
let platformNb = 1


/////////////////////////////////////////////////////////////////////////////////////////
// FONCTIONS                                                                           //
/////////////////////////////////////////////////////////////////////////////////////////

//Activation/Désactivation des bouton submit
function toggleSubmit(value) {
    if (addBtn !== null) {
        addBtn.disabled = value
    } else if (regBtn !== null) {
        regBtn.disabled = value
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
        errorPswrd.classList.remove('hidden')
        toggleSubmit(true) 
    } else {
        //Si oui, on retire l'erreur
        field.classList.remove('error')
        errorPswrd.classList.add('hidden')
        toggleSubmit(false) 
    }
    return field.value
}

function confirmPswrd(field, password) {
    //le champ de confirmation du mot de passe est-il identique au champ précedent?
    //Non? erreur
    if (field.value !== password.value) {
        field.classList.add('error')
        errorPswrd.classList.remove('hidden') 
        toggleSubmit(true)        
    } else {
    //Oui? on retire l'erreur
        field.classList.remove('error')
        errorPswrd.classList.add('hidden')
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
        removeGenreFieldBtn.classList.remove('disabled')
    }
    if (genreNb == 3) {
        //Désactivation du bouton d'ajout de champ
        addGenreFieldBtn.classList.add('disabled')
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
        removeGenreFieldBtn.classList.add('disabled')
    }
    if (genreNb < 3) {
        //Activation du bouton d'ajout de champ
        addGenreFieldBtn.classList.remove('disabled')
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
       removePlatformFieldBtn.classList.remove('disabled')
    }
    if (platformNb == 6) {
        //Désactivation du bouton d'ajout de champ
        addPlatformFieldBtn.classList.add('disabled')
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
       removePlatformFieldBtn.classList.add('disabled')
    }
    if (platformNb < 6) {
        //Activation du bouton d'ajout de champ
       addPlatformFieldBtn.classList.remove('disabled')
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


if (readMoreReviewLinks) {
    for (let i = 0; i < readMoreReviewLinks.length; i++) {
    readMoreReviewLinks[i].addEventListener('click', readMoreReview)
    }
}

if (addGenreFieldBtn) {
    addGenreFieldBtn.addEventListener('click', addGenreSelect)
}

if (removeGenreFieldBtn) {
    removeGenreFieldBtn.addEventListener('click', removeGenreSelect)}

if (addPlatformFieldBtn) {
    addPlatformFieldBtn.addEventListener('click', addPlatformSelect)
}

if (removePlatformFieldBtn) {
    removePlatformFieldBtn.addEventListener('click', removePlatformSelect)
}

if (resetBtn) {
   resetBtn.addEventListener("click", resetPreview)  
}