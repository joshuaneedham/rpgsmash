$(document).ready(function(){
   attachEventListeners()
})

var charButtonID;

const attachEventListeners = function() {
   $('.char-more').click(function () {
   	charButtonID = this.id
   	charInfo();
   })
   $('.univTraits').click(function () {
   	traitsInfo();
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

function traitsInfo () {
	$.get("/universes/1/traits.json", function(data) {
		var traits = data;
		var traitsList = "";
		traits.forEach(function(trait) {
			traitsList += '<h3>' + trait["name"] + '</h3>'
		})
		$('#universeTraits').html(traitsList);
	})
} 
