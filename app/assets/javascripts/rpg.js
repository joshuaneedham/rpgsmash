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
 	$("#character-" + charButtonID).html(biographyText);
    var characterTraits = character["character_traits"];
    var charTraitList = "";
    characterTraits.forEach(function(charTrait) {
      charTraitList += '<li class="js-chartrait" data-id="' + charTrait["id"] + '">' + charTrait["trait_id"] + ' - ' 
      + charTrait["stat"] + '</li>';
    });
    $("#character-" + charButtonID + "-characterTraits").html(charTraitList);
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


