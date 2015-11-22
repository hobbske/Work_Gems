class ProfilesController < ApplicationController
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company_name, presence: true
  validates :mobile_number, presence: true
  validates :profession, presence: true

  def new
    # form where a user can fill out their own profile.
    @user = User.find(params[:user_id] )
    @profile = @user.build_profile
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
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :company_name, :profession, :specialty, :job_title, :work_number, :mobile_number, :linkedin_url, :facebook_url, :description )
    end
end