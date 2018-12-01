class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_meeting, only: [:create]

    def new
      @comment = Comment.new
    #   @comment.meeting = @meeting
    end
  
    def create
      @comment = Comment.create(comment_params)
      @comment.meeting_id = @meeting.id
    #   @company = current_user.company
    #   @meeting.company = @company
      @comment.save
      render json: @comment, status: 201
    #   respond_to do |format|
    #     #   format.html { render :show }
    #       format.json { render json: @comment}
    #       format.any {redirect_to "/meetings/#{@meeting.id}"}
    #     end
    end

    # def show
    #     respond_to do |format|
    #         format.json { render json: @comment}
    #         # format.any {redirect_to "/meetings/#{@meeting.id}"}
    #     end
    # end
    
    def index
        @comments = Comment.where(meeting_id: params[:meeting_id]) 
        respond_to do |format|
            format.json { render json: @comments}
            # format.any {redirect_to "/meetings/#{@meeting.id}"}
        end
    end
  
    def edit
      @comment = Comment.find(params[:id])
    #   @company = current_user.company
    end
  
    def update
      @comment.update(comment_params)
      render json: @comment, status: 202
    end

    # def thread
    #   render "all"
    # end

    # def index 
    #   @meetings = Comment.all
    #   render json: @meetings, status: 200
    #   # respond_to do |format|
    #   #   format.html { render :index }
    #   #   format.json { render json: @meetings}
    #   # end
    # end
    
  
    # def show
    #   @meeting = Comment.find(params[:id])
    #     #BEFORE using a serializer:
    #     # render json: @meeting, status: 200
    #      # AFTER USING OUR SERIALIZER
    #     # render json: @post, status: 200
    #     respond_to do |format|
    #       format.html { render :show }
    #       format.json { render json: @meeting}
    #     end
    # end

    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
    #   render "all"
    end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:meeting_id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:meeting_id, :comment, :name)
    end
end