 $(document).ready(function(){
    $('.tabs').tabs();
    $('.sidenav').sidenav();
    $('.button-collapse').sideNav({
      menuWidth: 300, // Default is 240
      closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
    }
  );
    $('.collapsible').collapsible();
    
  });


