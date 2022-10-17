var app = angular.module('app', []);

app.controller('mainController', ['$scope', 'httpService', function($scope, httpService) {
var mockusers = [{
"id" : "1",
"username" : "游客",
"avatar" : "images/TouristAvatar.png"

}, {
"id" : "2",
"username" : "222",
"avatar" : "images/mario.jpg"
}, {
"id" : "3",
"username" : "?图片有问题",
"avatar" : "images/timelessmemory.jpg"
}, {
"id" : "4",
"username" : "smile",
"avatar" : "images/smile.jpg"
},]

var currentUserIndex = 2;


$scope.setcommentUser=function(){
//alert("him");

var token = localStorage.getItem("token");
//alert(isLogin);
if(isLogin){ //登陆了
//window.localStorage.setItem("id", mockusers[1].id);
window.localStorage.setItem("username", userNameForComment);

$.ajax({
type: "get",
url: "/user/userInfo",
data: {},
dataType: "json",
success: function (data) {
if (data.code == 200) {

window.localStorage.setItem("avatar", data.data.userPhoto);




}  else {
window.localStorage.setItem("avatar", mockusers[2].avatar);

}

},
error: function () {
window.localStorage.setItem("avatar", mockusers[2].avatar);

}
})



}else{
//window.localStorage.setItem("id", mockusers[0].id);
window.localStorage.setItem("username", mockusers[0].username);
window.localStorage.setItem("avatar", mockusers[0].avatar);
}

}
$scope.isShowComment = false;

$scope.cmt = {
fstlvlcmt : ""
}

var sayingID, flcId, slcId;

//current user information
$scope.user = {
id : window.localStorage.getItem("id"),
username : window.localStorage.getItem("username"),
avatar : window.localStorage.getItem("avatar")
}

//
$scope.setcommentUser2= function(){
alert("setcommentUser2");
}
$scope.showshuyouquanCommentWithId2= function(){
alert("showshuyouquanCommentWithId2");

}

//根据行号等信息显示评论
//ng-click="showCommentWithLine()"
$scope.showSameHobbyCWL= function(){
var bookId1=document.getElementById("bookId").value;
//alert("尝试出内容"); //有内容显示
var lineId1=document.getElementById("nowLineId").value;
//httpService.get("http://localhost:8090/saying/get/comment/1/4/1548291115931836416/1", {}, function(data) {

httpService.get("http://localhost:8090/saying/get/SameHobbycomment/1/"+bookId1+"/"+lineId1+"/", {}, function(data) {
//alert("start  get");  //刷新的时候出现了
//alert("空");

if(data==null ||data==""){//如果查询不到行数

$scope.saying = data;

}else{
$scope.saying = data;
//alert($scope.saying);
//console.log(data);

//                var commentThumsJson=data.flcs;
var commentThumsJson=JSON.parse(localStorage.getItem('commentThumpStore'));
//alert(data.flcs.length);

for(var i = 0; i < data.flcs.length; i++) {
flc_id=data.flcs[i].id;
if(commentThumsJson["flc_id"+flc_id]==null){
commentThumsJson["flc_id"+flc_id]="0";

if(data.flcs[i].slcs.length!=0){
for(var slci = 0; slci < data.flcs[i].slcs.length; slci++) {
//alert(data.flcs[i].slcs[slci].id);
slc_id=data.flcs[i].slcs[slci].id;
if(commentThumsJson["slc_id"+slc_id]==null){
commentThumsJson["slc_id"+slc_id]="0";
}
}
}

}

}
localStorage.setItem('commentThumpStore',JSON.stringify(commentThumsJson));




$scope.saying.likes = $scope.saying.likes.split(",")[0] == "" ? [] : $scope.saying.likes.split(",");
$scope.isShowLike = $scope.saying.likes.contains($scope.user.id);
}
}, function(error) {
console.log(error)
})
}
//根据行号等信息显示评论
//ng-click="showCommentWithLine()"
$scope.showCommentWithLine= function(){
var bookId1=document.getElementById("bookId").value;
//alert("尝试出内容"); //有内容显示
var pageId1=document.getElementById("preContentId").value;
var lineId1=document.getElementById("nowLineId").value;
//httpService.get("http://localhost:8090/saying/get/comment/1/4/1548291115931836416/1", {}, function(data) {

httpService.get("http://localhost:8090/saying/get/comment/1/"+bookId1+"/"+pageId1+"/"+lineId1+"/", {}, function(data) {
//alert("start  get");  //刷新的时候出现了
//alert("空");

if(data==null ||data==""){//如果查询不到行数

$scope.saying = data;

}else{
$scope.saying = data;
//alert($scope.saying);
//console.log(data);

//                var commentThumsJson=data.flcs;
var commentThumsJson=JSON.parse(localStorage.getItem('commentThumpStore'));
//alert(data.flcs.length);

for(var i = 0; i < data.flcs.length; i++) {
flc_id=data.flcs[i].id;
if(commentThumsJson["flc_id"+flc_id]==null){
commentThumsJson["flc_id"+flc_id]="0";

if(data.flcs[i].slcs.length!=0){
for(var slci = 0; slci < data.flcs[i].slcs.length; slci++) {
//alert(data.flcs[i].slcs[slci].id);
slc_id=data.flcs[i].slcs[slci].id;
if(commentThumsJson["slc_id"+slc_id]==null){
commentThumsJson["slc_id"+slc_id]="0";
}
}
}

}

}
localStorage.setItem('commentThumpStore',JSON.stringify(commentThumsJson));




$scope.saying.likes = $scope.saying.likes.split(",")[0] == "" ? [] : $scope.saying.likes.split(",");
$scope.isShowLike = $scope.saying.likes.contains($scope.user.id);
}
}, function(error) {
console.log(error)
})
}
//alert("Before httpService.get"); //没找到执行这一行的方法

//现在是在提交按钮里调用的
$scope.getAlert=function(){
alert("时候"); //点击提交出现了

}
$scope.like = function(sayingId) {
if ($scope.saying.likes.contains($scope.user.id)) {
$scope.saying.likes.splice($scope.saying.likes.indexOf($scope.user.id), 1);
} else {
$scope.saying.likes.push($scope.user.id)
}

var tmpLikes = $scope.saying.likes;
tmpLikes = tmpLikes.join(",");

var data = {
id : sayingId,
thumpsup:0,
likes : tmpLikes
};

httpService.post("http://localhost:8090/saying/likes", data, function(data) {
$scope.isShowLike = $scope.saying.likes.contains($scope.user.id);
}, function(error) {
console.log(error)
})
}

$scope.showComment = function() {
$scope.isShowComment = ! $scope.isShowComment;
}
$scope.firstCommentbefore=function(sayingId){
var bookId=document.getElementById("bookId").value;
var pageId=document.getElementById("preContentId").value;
var lineId=document.getElementById("nowLineId").value;
$scope.firstComment(sayingId,bookId,pageId,lineId);
}
//这个是书友圈的评论功能
$scope.firstCommentbeforeShuyou=function(sayingId){
//        var bookId=document.getElementById("bookId").value;
var bookId=$("#bookId").val();

//        var pageId=document.getElementById("preContentId").value;
var lineId=document.getElementById("nowLineId").value;
$scope.firstCommentShuyou(sayingId,bookId,lineId);
}
$scope.firstCommentShuyou = function(sayingId,bookId,lineId) {
//sayingId=12; //可
//bookId=12; //不可
if ($scope.cmt.fstlvlcmt == "") {
$('#hintDiv').fadeIn(300);

setTimeout(function() {
$('#hintDiv').fadeOut(300);
}, 800);

return;
}
var data = {
sayingId : sayingId,
thumpsup:0,
bookId: bookId,
lineId:  lineId,
commenter : $scope.user.username,
avatar : $scope.user.avatar,
commentContent : $scope.cmt.fstlvlcmt,

}
//alert(bookId);  //能够成功显示id
//alert(data.bookId);  //能够成功显示id
httpService.post("http://localhost:8090/samehobby/add/first", data, function(result) {

data.id = result.id;
//alert(result.bookId); //是空的
data.commentTime = result.commentTime;
if($scope.saying!=null){
$scope.saying.flcs.push(data);

}
$scope.cmt.fstlvlcmt = "";
$scope.isShowComment = false;

window.location.reload();
//alert("12");
//var v1 = document.getElementById("right-content1");
//v1.style.display = "block";


}, function(error) {
console.log(error)
})
}
$scope.firstComment = function(sayingId,bookId,pageId,lineId) {
//sayingId=12; //可
//bookId=12; //不可
if ($scope.cmt.fstlvlcmt == "") {
$('#hintDiv').fadeIn(300);

setTimeout(function() {
$('#hintDiv').fadeOut(300);
}, 800);

return;
}
var data = {
sayingId : sayingId,
thumpsup:0,
bookId: bookId,
pageId:  pageId,
lineId:  lineId,
commenter : $scope.user.username,
avatar : $scope.user.avatar,
commentContent : $scope.cmt.fstlvlcmt,

}
//alert(bookId);  //能够成功显示id
//alert(data.bookId);  //能够成功显示id
httpService.post("http://localhost:8090/comment/add/first", data, function(result) {

data.id = result.id;
//alert(result.bookId); //是空的
data.commentTime = result.commentTime;
if($scope.saying!=null){
$scope.saying.flcs.push(data);

}
$scope.cmt.fstlvlcmt = "";
$scope.isShowComment = false;

window.location.reload();
//alert("12");
//var v1 = document.getElementById("right-content1");
//v1.style.display = "block";


}, function(error) {
console.log(error)
})
}

$scope.showSecondComment = function(comment, toWho) {
if (!comment.isShowChildComment) {
comment.scndlvlcmt = "@" + toWho + " ";
comment.tmptoWho = toWho;
comment.isShowChildComment = true;
} else {
if (toWho == comment.tmptoWho) {
comment.isShowChildComment = false;
comment.tmptoWho = "";
comment.scndlvlcmt = "";
} else {
comment.scndlvlcmt = "@" + toWho + " ";
comment.tmptoWho = toWho;
}
}
}

$scope.hideSecondComment = function(comment) {
comment.isShowChildComment = false;
comment.tmptoWho = "";
comment.scndlvlcmt = "";
}

$scope.samehobbyreply = function(sayingId, comment) {
var scndlvlcmt = comment.scndlvlcmt;
var str = "@" + comment.tmptoWho;

if (scndlvlcmt == "" || $.trim(scndlvlcmt) == str) {
$('#hintDiv').fadeIn(300);

setTimeout(function() {
$('#hintDiv').fadeOut(300);
}, 800);

return;
}

var cmt = "";

if (scndlvlcmt.indexOf(str) >= 0) {
cmt = scndlvlcmt.substr(scndlvlcmt.indexOf(str) + str.length)
} else {
cmt = scndlvlcmt;
}
var bookId=$("#bookId").val();
var lineId=document.getElementById("nowLineId").value;
var data = {
sayingId : sayingId,
thumpsup:0,
bookId: bookId,
lineId:  lineId,
flcId : comment.id,
replier : $scope.user.username,
toCommenter : comment.tmptoWho,
replyContent :  cmt
}

httpService.post("http://localhost:8090/samehobby/add/second", data, function(result) {
comment.isShowChildComment = false;
comment.scndlvlcmt = "";
data.id = result.id;
data.replyTime = result.replyTime;

angular.forEach($scope.saying.flcs, function(item) {
if (item.id == comment.id) {
item.slcs.push(data);
}
})
}, function(error) {
console.log(error)
})
}
$scope.reply = function(sayingId, comment) {
var scndlvlcmt = comment.scndlvlcmt;
var str = "@" + comment.tmptoWho;

if (scndlvlcmt == "" || $.trim(scndlvlcmt) == str) {
$('#hintDiv').fadeIn(300);

setTimeout(function() {
$('#hintDiv').fadeOut(300);
}, 800);

return;
}

var cmt = "";

if (scndlvlcmt.indexOf(str) >= 0) {
cmt = scndlvlcmt.substr(scndlvlcmt.indexOf(str) + str.length)
} else {
cmt = scndlvlcmt;
}
var bookId=document.getElementById("bookId").value;
var pageId=document.getElementById("preContentId").value;
var lineId=document.getElementById("nowLineId").value;
var data = {
sayingId : sayingId,
thumpsup:0,
bookId: bookId,
pageId:  pageId,
lineId:  lineId,
flcId : comment.id,
replier : $scope.user.username,
toCommenter : comment.tmptoWho,
replyContent :  cmt
}

httpService.post("http://localhost:8090/comment/add/second", data, function(result) {
comment.isShowChildComment = false;
comment.scndlvlcmt = "";
data.id = result.id;
data.replyTime = result.replyTime;

angular.forEach($scope.saying.flcs, function(item) {
if (item.id == comment.id) {
item.slcs.push(data);
}
})
}, function(error) {
console.log(error)
})
}
$scope.deletefslcmt = function(sayingId, firstlvlId) {
$('#commentModal').modal("show");
sayingID = sayingId;
flcId = firstlvlId;
}

$scope.confirm = function() {
$('#commentModal').modal("hide");

var url = "http://localhost:8090/comment/delete/first/" + sayingID + "/" + flcId;

httpService.get(url, {}, function(data) {
//local delete comment
angular.forEach($scope.saying.flcs, function(item, index) {
if (item.id == flcId) {
$scope.saying.flcs.splice(index, 1);
}
})
sayingID = "";
flcId = "";
}, function(error) {
console.log(error)
})
}

$scope.deletescndcmt = function(sayingId, firstlvlId, secondlvlId) {
$('#slcModal').modal("show");
sayingID = sayingId;
flcId = firstlvlId;
slcId = secondlvlId;
}

$scope.confirmSlc = function() {
$('#slcModal').modal("hide");

var url = "http://localhost:8090/comment/delete/second/" + sayingID + "/" + slcId;

httpService.get(url, {}, function(data) {
//local delete second level comment
angular.forEach($scope.saying.flcs, function(item) {
if (item.id == flcId) {
angular.forEach(item.slcs, function(slc, index) {
if (slc.id == slcId) {
item.slcs.splice(index, 1);
}
})
}
})
sayingID = "";
flcId = "";
slcId = "";
}, function(error) {
console.log(error)
})
}

}]);

app.factory('httpService', ['$http', function($http) {
return {
get : function(url, params, successCallback, errorCallback) {
$http({
url : url + "?" + $.param(params),
method : 'get',
headers : { 'Content-Type': 'application/x-www-form-urlencoded' },
responseType : 'json'
})
.success(successCallback)
.error(errorCallback);
},
post : function(url, params, successCallback, errorCallback) {
$http({
url : url,
method : 'post',
data : $.param(params),
headers : { 'Content-Type': 'application/x-www-form-urlencoded' },
responseType : 'json'
})
.success(successCallback)
.error(errorCallback);
}
}
}]);

Array.prototype.contains = function(obj) {
var i = this.length;

while (i--) {
if (this[i] === obj) {
return true;
}
}
return false;
}
