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
   $('form').submit(function (event) {
   	event.preventDefault();
   	var values = $(this).serialize();
   	var posting = $.post('/universes/1/characters', values);
   	posting.done(function(data) {
   		var character = data;
   		$("#charName").text(character["name"]);
   		$("#charBio").text(character["biography"]);
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

function traitsInfo () {
	$.get("/universes/1/traits.json", function(data) {
		var traits = data;
		var traitsList = "";
		traits.forEach(function(trait) {
			traitsList += '<h4>' + trait["name"] + '</h4>' + '<p>' + trait["description"] + '</p>' +
			'<p>' + "Datatype: " + trait["datatype"] + '</p>'
		})
		$('#universeTraits').html(traitsList);
	})
} 
