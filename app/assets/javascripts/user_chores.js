$(function(){
  $("input.toggle").on("change", function(){
    $(this).parents("form").trigger("submit")
  })
});

// var HouseChore = function(json) {
//   this.name = json.chore.name;
// }
//
// HouseChore.prototype.getHTML = function() {
//   return `${this.userName}`
// };

$(function(){
  $("a.load_user_chores").on("click", function(e){
    e.preventDefault();
//     // fire some ajax
//     // $.ajax({
//     //   method: "GET",
//     //   url: this.href,
//     // }).success(function(response){
//     //   $("div.user_chores").html(response)
//       // we'd really want to load that data into the DOM
//     // });
//     // get a response
//     $.get(this.href).success(function(response){
//       $("div.user_chores").html(response)
//     })
//     // load that response into the DOM
  $.get(this.href).success(function(json) {
    var $ol = $("div.user_chores ol")
    $ol.html("")

    json.forEach(function(user_chore) {
      // const houseChore = new HouseChore(user_chore);
      // $ol.append(houseChore.getHTML())

      $ol.append(`<li><h3>${user_chore.user.username} || ${user_chore.house_chore.chore.name} || ${user_chore.due_date} </h3></li>`);
    })
  })

  })
})
