$(document).ready(function(){
   attachEventListeners()
})

var charButtonID;

const attachEventListeners = function() {
   $('.char-more').click(function () { //req 2
   	charButtonID = this.id
   	charInfo();
   })
   $('.univTraits').click(function () {
   	traitsInfo(); //req 1
   })
   // requirement 4: creates new character without a page refresh
   $('#new_character').submit(function (event) {
   	event.preventDefault();
   	var values = $(this).serialize();
   	var posting = $.post('/universes/1/characters', values);
   	posting.done(function(data) {
   		var character = data;
   		$("#charName").text(`Name: ${character["name"]}`);
   		$("#charBio").text(`Biography: ${character["biography"]}`);
   	})
   })
}

function charInfo () {
  $.get("/universes/1" + "/characters/" + charButtonID + ".json", function(data) {
  	var character = data;
  	var biographyText = "<p>" + character["biography"] + "</p>"
  	$("#character-" + charButtonID).html(biographyText);
  	var charTraits = character["traits"]
    var characterTraits = character["character_traits"];
    var charTraitList = "";
    for (let i = 0; i < charTraits.length; i++) {
    	charTraitList += '<li class="js-chartrait" data-id="' + charTraits[i]["id"] + '">' + charTraits[i]["name"] + ' - ' + 
    	characterTraits[i]["stat"] + '</li>';
    }
    $("#character-" + charButtonID + "-stats").html(charTraitList);
  })
}

//requirement 1: renders index page of traits via JQuery and serialization
const traitsInfo = () => {
	fetch(`/universes/1/traits.json`)
	.then(result => result.json())
	.then(traits => {
		$('#universeTraits').html('')
		traits.forEach(trait => {
			let newTrait = new Trait(trait)

			let traitHtml = newTrait.formatIndex()

			$('#universeTraits').append(traitHtml)
		})
	})
}

//requirement 5: translate JSON response into JavaScript Model Objects. 

function Trait(trait) { 
	this.id = trait.id
	this.name = trait.name
	this.description = trait.description
	this.datatype = trait.datatype
}

Trait.prototype.formatIndex = function () {
	  let traitHtml = `
    <a href="/universes/1/traits/${this.id}" data-id="${this.id}" class="show_link"><h1>${this.name}</h1></a>
    <p> Description: ${this.description} </p>
    <p> Datatype: ${this.datatype} </p>
  `
  return traitHtml
}