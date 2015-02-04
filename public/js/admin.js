// var add = document.querySelectorAll(".add");
// var sub = document.querySelectorAll(".subtract");
// var input = document.querySelectorAll(".invInput");
var groups = document.querySelectorAll(".updateGroup");
// console.log(add);
// console.log(sub);
// console.log(input);
console.log(groups);
var counter= 0;
var bunchArray = [];
for(var i = 0; i < groups.length; i++) {
  console.log(groups[i]);
  bunchArray.push(groups[i]);
  // var add = groups[i].childNodes[1];
  // var subtract = groups[i].childNodes[2];
  // var input = groups[i].childNodes[0];
  // add.addEventListener("click", function() {
  //   counter++
  //   input.value = counter;
  // })
  // console.log(groups[i].childNodes[0]);
}
bunchArray.forEach(function(group) {
  var add = group.childNodes[1];
  var subtract = group.childNodes[2];
  var input = group.childNodes[0];
  add.addEventListener("click", function() {
    counter++
    input.value = counter;
  })
});
