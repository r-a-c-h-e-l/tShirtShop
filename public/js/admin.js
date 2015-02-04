var groups = document.querySelectorAll(".updateGroup");

var counter= 0;

var bunchArray = [];
for(var i = 0; i < groups.length; i++) {
  bunchArray.push(groups[i]);
}

bunchArray.forEach(function(group) {
  var add = group.childNodes[1];
  var subtract = group.childNodes[2];
  var input = group.childNodes[0];
  add.addEventListener("click", function() {
    // counter++
    // input.value = counter;
    // send ajax to increase qty
  })
  sub.addEventListener("click", function() {
    // send ajax to reduce qty
  })
});
