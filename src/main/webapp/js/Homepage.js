/**
 * Created by liaos on 2016/11/6.
 */
function jumpToRegister(){debugger
     document.location.href="homepage/toRegister";
    //window.open('homepage/toRegister');
}

$(document).ready(function() {debugger
     $("#idInput").blur(function () {debugger
          checkId($("#idInput").val());
     });
});

function checkId(id) {debugger
     alert("id:"+id);
}

