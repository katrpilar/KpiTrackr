 $(document).ready(function(){
    $('.tabs').tabs();
    $('.fixed-action-btn').floatingActionButton();
    $('select').formSelect();
    $('.fixed-action-btn').floatingActionButton();
    $('.sidenav').sidenav();
  });


document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.fixed-action-btn');
    var instances = M.FloatingActionButton.init(elems, {
      direction: 'left',
      hoverEnabled: false
    });
  });

