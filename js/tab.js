//隐藏工具提示
function hiddentip() {
    var op = document.getElementsByTagName("p");
    var i;
    if (document.getElementById("check-box").checked) {
        for (i = 0; i < op.length; i++) {
            op[i].style.display = "none";
        }
    } else {
        for (i = 0; i < op.length; i++) {
            op[i].style.display = "block";
        }

    }
}