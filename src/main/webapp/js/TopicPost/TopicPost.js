/**
 * Created by liaos on 2017/3/29.
 */
$(document).ready(function () {
    loadPage();
});

function loadPage() {
    showAllPost();
    showTopPage();
}

function askForLogin() {
    layer.tips("请先登录", '#addPostButton', {tips: 1});
}

function addPost() {

}