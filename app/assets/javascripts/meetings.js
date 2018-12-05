$(window).load(function(){
    $('.js-previous').hide();
    let meetingCount;
    let meetingIdList = [];
    let firstMeeting = parseInt(window.location.pathname.slice(-1));
    let currentPosition;  
    console.log("Window has loaded");
    var isSubmitting = false;
  
  //Set the total number of meetings
  $(function () {
    var retrieve = $.getJSON("/meetings.json", function(data) {
      $.each(data, function(index, value){
        console.log(value["id"]);
        meetingIdList.push(value["id"]);
      });
      console.log("Set meeting count request sent");
    });
    retrieve.done(function(data){
      meetingIdList.sort();
      currentPosition = meetingIdList.indexOf(firstMeeting);
      meetingCount = meetingIdList.length;
      console.log("meetingIdList: " + meetingIdList);
      console.log("meetingCount: " + meetingCount);
      console.log("firstMeeting: " + firstMeeting);
      console.log("currentPosition: " + currentPosition);
      changeArrows();
    });
  });
  
  
  //Control hiding and showing the previous button
  $(function () {
    $(".js-next").on("click", function(e) {
      e.preventDefault();
      var nextId = meetingIdList[currentPosition + 1]
      currentPosition++;
      $.getJSON("/meetings/" + nextId + ".json", function(data) {
        $(".meetingDate").text(data["date"]);
        $(".meetingOverview").text(data["overview"]);
        $(".meetingTakeaways").text(data["takeaways"]);
        // re-set the id to current on the link
        $(".js-next").attr("data-id", data["id"]);
        history.pushState(null, '', `/meetings/${data["id"]}`);
        changeArrows();
        resetComments(nextId);
      });
    });
  });
  
  //Control hiding and showing the next button
  $(function () {
    $(".js-previous").on("click", function(e) {
      e.preventDefault();
      var nextId = meetingIdList[currentPosition - 1]
      currentPosition--;
      $.getJSON("/meetings/" + nextId + ".json", function(data) {
        $(".meetingDate").text(data["date"]);
        $(".meetingOverview").text(data["overview"]);
        $(".meetingTakeaways").text(data["takeaways"]);
        // re-set the id to current on the link
        $(".js-previous").attr("data-id", data["id"]);
        changeArrows();
        history.pushState(null, '', `/meetings/${data["id"]}`);
        resetComments(nextId);
      });
    });
  });
  
  //Turn comments into class format
  $(function (){ 
    $.getJSON(window.location.pathname + `/comments.json`, function(data) {
      console.log(data);
        class Comment {
            constructor(name, comment){
                this.name = name;
                this.comment = comment;
            }            
            truncate (){
                return this.comment.split(" ").slice(0,15).join(" ") + "&#8230";
            }
        }
          $.each(data, function(index, value){
            //console.log(value);
            let com = new Comment(value["name"], value["comment"]);
            $(".all-comments").append(`<tr>
              <td>${com.name}</td>
              <td>${com.truncate()}</td>
              <td>
                <a href=${"/comments/" + value["id"]} data-method="delete" rel="nofollow">Delete</a>
              </td>
            </tr>`);        
          });
        });
      
    });
    


  /*Fetch and display all of the comments for a meeting
  $(function (){ 
  $.getJSON(window.location.pathname + `/comments.json`, function(data) {
    console.log(data);
        $.each(data, function(index, value){
          //console.log(value);
          $(".all-comments").append(`<tr>
            <td>${value["name"]}</td>
            <td>${value["comment"].split(" ").slice(0,15).join(" ") + "&#8230"}</td>
            <td>
              <a href=${"/comments/" + value["id"]} data-method="delete" rel="nofollow">Delete</a>
            </td>
          </tr>`);        
        });
      });
    
  }); */
  
  function resetComments(id){
    $('.all-comments').empty();
      $.getJSON(`/meetings/${id}/comments.json`, function(data) {
          $.each(data, function(index, value){
            // console.log(value);
            $(".all-comments").append(`<tr>
              <td>${value["name"]}</td>
              <td>${value["comment"].split(" ").slice(0,15).join(" ") + "&#8230"}</td>
              <td>
                <a href=${"/comments/" + value["id"]} data-method="delete" rel="nofollow">Delete</a>
              </td>
            </tr>`);        
          });
        });
  }
  
  
  $(function(){
    $('form').submit(function(event){
        event.preventDefault();
        if (isSubmitting) { return; }
        console.log(this);
        isSubmitting = true;
        var values = $(this).serialize();
        console.log(values);
        var posting = $.post(`/meetings/${meetingIdList[currentPosition]}` + '/comments.json', values);
        posting.done(function(data){
            isSubmitting = false;
            console.log(data);
            $(".all-comments").append(`<tr>
              <td>${data["name"]}</td>
              <td>${data["comment"].split(" ").slice(0,15).join(" ") + "&#8230"}</td>
              <td>
                <a href=${"/comments/" + data["id"]} data-method="delete" rel="nofollow">Delete</a>
              </td>
            </tr>`); 
        });
    });
  });
  
  function changeArrows(){
      console.log("body changed");
      console.log("meetingIdList: " + meetingIdList);
      console.log("meetingCount: " + meetingCount);
      console.log("firstMeeting: " + firstMeeting);
      console.log("currentPosition: " + currentPosition);
      $('form').attr("action", `/meetings/${meetingIdList[currentPosition]}` + '/comments');
      if(currentPosition === 0){
        $('.js-previous').hide();    
      }else{
        $('.js-previous').show();
      }
      if(meetingIdList[currentPosition] === meetingIdList.slice(-1)[0]){
        $('.js-next').hide();    
      }else{
        $('.js-next').show();
      }
    };
  
    $('.all').ready(function () {
        $.getJSON("/meetings.json", function(data) {
          $.each(data, function(index, value){
            console.log(value);
            $(".all-meetings").append(`<tr>
              <td>${value["date"]}</td>
              <td>${value["overview"].split(" ").slice(0,10).join(" ") + "&#8230"}</td>
              <td>${value["takeaways"].split(" ").slice(0,10).join(" ") + "&#8230"}</td>
              <td><a href=${"meetings/" + value["id"]}>Show</a>
                <a href=${"meetings/" + value["id"] + "/edit"}>Edit</a>
                <a href=${"meetings/" + value["id"]} data-method="delete" rel="nofollow">Delete</a>
              </td>
            </tr>`);
          });
        });
    });
  
  });
  
 