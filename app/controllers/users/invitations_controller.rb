class Users::InvitationsController < Devise::InvitationsController


  # def update
  #   # binding.pry
  #   user = User.find_by_invitation_token(params[:user][:invitation_token], true)
  #   user.password = params[:user][:password]
  #   user.username = params[:user][:username]
  #   user.save
  #   binding.pry
  #   # User.accept_invitation!(:invitation_token => params[:invitation_token], :password => params[:user][:password], :username => params[:user][:username])
  #   # user.username = params[:user][:username]
  #   # if user.save
  #   #   redirect_to root_path
  #   # end
  #   # raise user
  #   # @user = User.find_by(invitation_token: params[raw_invitation_token])
  #   # if some_condition
  #   #   redirect_to root_path
  #   # else
  #   #   super
  #   # end
  #   redirect_to root_path

  # end

  private

  # this is called when creating invitation
  # should return an instance of resource class
  # def invite_resource
  #   ## skip sending emails on invite
  #   super do |u|
  #     u.skip_invitation = true
  #   end
  # end

  # this is called when accepting invitation
  # should return an instance of resource class
  def accept_resource
    resource = resource_class.accept_invitation!(update_resource_params)
    ## Report accepting invitation to analytics
    Analytics.report('invite.accept', resource.id)
    resource
  end
end