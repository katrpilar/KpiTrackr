class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_meeting, only: [:new, :create]

    def new
      @comment = Comment.new
    end
  
    def create
      @comment = Comment.create(comment_params)
      @comment.meeting_id = @meeting.id
      @comment.save
      render json: @comment, status: 201
    end
    
    def index
        @comments = Comment.where(meeting_id: params[:meeting_id]) 
        respond_to do |format|
            format.json { render json: @comments}
        end
    end
  
    def edit
      @comment = Comment.find(params[:id])
    end
  
    def update
      @comment.update(comment_params)
      render json: @comment, status: 202
    end

    def destroy
      @comment = Comment.find(params[:id])
      @meeting = @comment.meeting_id
      @comment.destroy
      redirect_to meeting_path(@meeting)
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