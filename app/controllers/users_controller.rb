class UsersController < ApplicationController
before_action :authenticate_user!, only: [:show, :index]
before_action :set_user, only: [:show]
before_action :set_user_type
before_action :verify_user_access, only: [:show, :edit, :update]

	def index
		@users = user_class.all
	end

	def show
	end

	# def new
	# 	@user = user_class.new
	# end

	def edit
		@stringy = "fdfdfdf"
		set_user
	end

	# def create
	# 	@user = User.new(user_params)
	# end

	def update
  if @user.update(user_params)
    redirect_to @user, notice: "#{current_user.first_name} was successfully created."
  else
    render action: 'edit'
  end
	end

	# def destroy
	# end

  def inbox
    if current_user.is_participant?
      @conversations = current_user.mailbox.sentbox
    else
      @conversation = current_user.mailbox.inbox
    end
  end

  def view_message
    @conversation = current_user.mailbox.sentbox.find_by_id(params[:id])
    # right now conversation can only take place between 1 dwelling and 1 participant
    dwellings, participants = @conversation.participants.partition{|p| p.class.to_s == "Dwelling" }
    @dwelling = dwellings.first
    @participant = participants.first
    @receipts = @conversation.receipts_for current_user
  end

private
	def set_user_type
		@user_type = user_type
	end

	def user_type
		User.user_types.include?(params[:type]) ? params[:type] : "User"
	end

	def user_class
		user_type.constantize
	end

	def set_user
		@user = user_class.find(params[:id])
	end

  def verify_user_access
    unless current_user.id === params[:id].to_i
      flash[:notice] = "You may only view your own products."
      redirect_to root_path
    end
  end
	def user_params
		params.require(user_type.underscore.to_sym).permit(:first_name, :last_name, :public_user_id, :password, :email)
	end

end