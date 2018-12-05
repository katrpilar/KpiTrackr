$(window).load( () =>{
  if(window.location.pathname.includes("/meetings/")){
    let meetingIdList = []; //The Ids of all existing meetings
    let firstMeeting = parseInt(window.location.pathname.slice(-1)); //The starting show page id
    let currentPosition; //the user's current location in the meetingIdList  
  
  //Set the total number of meetings
  $( () => {
    var retrieve = $.getJSON("/meetings.json", (data) => {
      $.each(data, (index, value) => {
        meetingIdList.push(value["id"]); //adds each meeting id to array
      });
    });
    retrieve.done( (data) => {
      meetingIdList.sort(); //sort the meeting list by id
      currentPosition = meetingIdList.indexOf(firstMeeting); //detemines current position in meetingIdList
      changeArrows(); //set the initial nav arrows depending on meeting shown
      resetComments(firstMeeting)
    });
  });
  
  
  //Control hiding and showing the previous button
  $( () => {
    $(".js-next").on("click", (event) => {
      event.preventDefault();
      var nextId = meetingIdList[currentPosition + 1]
      currentPosition++;
      $.getJSON("/meetings/" + nextId + ".json", (data) => {
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
  
  //Control showing the next meeting show page
  $(() => {
    $(".js-previous").on("click", (event) => {
      event.preventDefault();
      var nextId = meetingIdList[currentPosition - 1]
      currentPosition--;
      $.getJSON("/meetings/" + nextId + ".json", (data) => {
        $(".meetingDate").text(data["date"]);
        $(".meetingOverview").text(data["overview"]);
        $(".meetingTakeaways").text(data["takeaways"]);
        // re-set the id to current on the link
        $(".js-previous").attr("data-id", data["id"]);        
        changeArrows(); //updates nav arrows
        history.pushState(null, '', `/meetings/${data["id"]}`); //changes page url
        resetComments(nextId); //resets the comments list for the new show page
      });
    });
  });
  
  //Turn comments into class format    
  //Resets the listed comments as the user clicks through the nav arrows on meeting show page  
  let resetComments = (id) =>{
    $('.all-comments').empty();
    $.getJSON(window.location.pathname + `/comments.json`, (data) => {

        //creates a comment object model
        class Comment {
            constructor(name, comment){
                this.name = name;
                this.comment = comment;
            }            
            //truncates the comment instance            
            truncate (){
                return this.comment.split(" ").slice(0,15).join(" ") + "&#8230";
            }
        }
        $.each(data, (index, value) => {
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
  }
  
  //Submits the comment form on the meetings show views via ajax
  $( () => {
    $('#commentform').submit(function(event){
        event.preventDefault();
        var values = $(this).serialize();
        var posting = $.post(`/meetings/${meetingIdList[currentPosition]}` + '/comments.json', values);
        posting.done( (data) => {
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
  
  //Controls hiding and showing the meeting nav arrows depending on current show view
  let changeArrows = () => {
      //ensures the proper form is submitting after having changed history.pushstate upon nav arrow click
      $('#commentform').attr("action", `/meetings/${meetingIdList[currentPosition]}` + '/comments');

      //hide or show previous arrow
      if(currentPosition === 0){
        $('.js-previous').hide();    
      }else{
        $('.js-previous').show();
      }

      //hide or show next arrow
      if(meetingIdList[currentPosition] === meetingIdList.slice(-1)[0]){
        $('.js-next').hide();    
      }else{
        $('.js-next').show();
      }
    };
  }
  
    //Controls retrieving all meetings to show on the /companymeetings page
    $('.all').ready( () => {
        $.getJSON("/meetings.json", (data) => {
            class Meeting {
                constructor(date, overview, takeaways){
                    this.date = date;
                    this.overview = overview;
                    this.takeaways = takeaways;
                }            
                //truncates the meeting text from a provided instance            
                truncate (text){
                    return text.split(" ").slice(0,10).join(" ") + "&#8230";
                }
            }

          $.each(data, (index, value) => {
            let meet = new Meeting(value["date"], value["overview"], value["takeaways"]);
            $(".all-meetings").append(`<tr>
              <td>${meet.date}</td>
              <td>${meet.truncate(meet.overview)}</td>
              <td>${meet.truncate(meet.takeaways)}</td>
              <td><a href=${"meetings/" + value["id"]}>Show</a>
                <a href=${"meetings/" + value["id"] + "/edit"}>Edit</a>
                <a href=${"meetings/" + value["id"]} data-method="delete" rel="nofollow">Delete</a>
              </td>
            </tr>`);
          });
        });
    });
  
  });
  
 