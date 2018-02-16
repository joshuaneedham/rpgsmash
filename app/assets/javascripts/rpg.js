
function charInfo () {
  alert("I have been clicked!");
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


