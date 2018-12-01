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
      render json: @meeting, status: 201
    end
  
    def edit
      # @meeting = Meeting.find(params[:id])
      @company = current_user.company
    end
  
    def update
      @meeting.update(meeting_params)
      render json: @meeting, status: 202
    end

    def all
      render "all"
    end

    def index 
      @meetings = Meeting.all
      render json: @meetings, status: 200
      # respond_to do |format|
      #   format.html { render :index }
      #   format.json { render json: @meetings}
      # end
    end
    
  
    def show
      # @meeting = Meeting.find(params[:id])
        #BEFORE using a serializer:
        # render json: @meeting, status: 200
         # AFTER USING OUR SERIALIZER
        # render json: @post, status: 200
        respond_to do |format|
          format.html { render :show }
          format.json { render json: @meeting}
        end
    end

    def destroy
      @meeting = Meeting.find(params[:id])
      @meeting.destroy
      render "all"
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