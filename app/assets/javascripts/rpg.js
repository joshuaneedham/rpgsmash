$(document).ready(function(){
   attachEventListeners()
})

var charButtonID;

const attachEventListeners = function() {
   $('.char-more').click(function () {
   	charButtonID = this.id
   	charInfo();
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

//function charInfo () {
//      var id = $(this).data("id");
//    $.get("/characters/" + id + ".json", function(data) {
//      var character = data;
//
//      var biographyText = "<p>" + character["biography"] + "</p>"
//      $("#character-" + id).html(biographyText);
//      var characterTraits = character["character_traits"];
//      var charTraitList = "";
//      characterTraits.forEach(function(charTrait) {
//        charTraitList += '<li class="js-chartrait" data-id="' + charTrait["id"] + '">' + charTrait["trait_id"] + ' - ' 
//        + charTrait["stat"] + '</li>';
//      });
//      $("#character-" + id + "-characterTraits").html(charTraitList);
//    });
//}


