class MeetingsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_meeting, only: [:show, :edit, :update]

    def new
      @meeting = Meeting.new
    end
  
    def create
      @meeting = Meeting.create(meeting_params)
      @company = current_user.company
      @meeting.company = @company
      @meeting.save
      respond_to do |format|
        format.html { redirect_to '/companymeetings' }
        format.json { render json: @meeting, status: 201}
      end
    end
  
    def edit
      @company = current_user.company
    end
  
    def update
      @meeting.update(meeting_params)
      respond_to do |format|
        format.html { redirect_to meeting_path(@meeting) }
        format.json { render json: @meeting, status: 201}
      end    end

    def all
      render "all"
    end

    def index 
      @meetings = Meeting.all
      render json: @meetings, status: 200
    end
    
  
    def show
        @comment = Comment.new
        respond_to do |format|
          format.html { render :show }
          format.json { render json: @meeting}
        end
    end

    def destroy
      @meeting = Meeting.find(params[:id])
      @meeting.destroy
      redirect_to "/companymeetings"
    end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:overview, :date, :takeaways, :company_id)
    end
end