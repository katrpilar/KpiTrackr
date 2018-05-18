 $(document).ready(function(){
    $('.tabs').tabs();
    $('.sidenav').sidenav();
    $('.button-collapse').sideNav({
      menuWidth: 300, // Default is 240
      closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
    }
  );
    $('.collapsible').collapsible();

    $('#slide-out-<%=kpi.id%>').hide();
    $('#slide-trigger-<%=kpi.id%>').click(function() {
    	$("#slide-out-<%=kpi.id%>").show();
    });
    $('.sidenav-overlay').click(function() {
    	$("#slide-out-<%=kpi.id%>").hide();
    });
    
  });


