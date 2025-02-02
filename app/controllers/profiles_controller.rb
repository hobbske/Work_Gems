class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user

  def new
    @user = User.find(params[:user_id] )
    @profile = Profile.new
  end
  
  def create
    @user = User.find(params[:user_id] )
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Your Profile Has Been Created!"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
  end
  
  def edit
    @user = User.find(params[:user_id] )
    @profile = @user.profile
  end
 
  def update
    @user = User.find(params[:user_id])
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile Updated Successfully!"
      redirect_to user_path( params[:user_id] )
    else
      flash[:danger] = "Error. Please Resubmit. If you are not successful, please send feedback using the Feedback link in the navbar."
      render action: :edit
    end
  end

  def show
    @user = User.find(params[:user_id])
    @sample = @user.profile
  end

  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :company_name, :profession, :specialty, :job_title, :work_number, :mobile_number, :linkedin_url, :facebook_url, :description, :contact_email)
    end

    def only_current_user
      @user = User.find( params[:user_id] )
      redirect_to(root_url) unless @user == current_user
    end
end