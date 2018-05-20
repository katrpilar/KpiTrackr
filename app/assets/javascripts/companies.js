 $(document).ready(function(){
    $('.tabs').tabs();
    $('.sidenav').sidenav();
    $('.button-collapse').sidenav({
      menuWidth: 300, // Default is 240
      closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
    }
  );
    $('.collapsible').collapsible();
    $('.tooltipped').tooltip();    
  });


