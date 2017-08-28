class SamplesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user
  
  def new
    @user = User.find(params[:user_id])
    @sample = @user.samples.build
  end

  def create
    @user = User.find(params[:user_id])
    @sample = @user.samples.build(sample_params)
    if @sample.save
      flash[:success] = "Your Gem Has Been Created!"
      redirect_to user_samples_path( params[:user_id] )
    else
      render action: :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @sample = @user.samples.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @sample = @user.samples.find(params[:id])
    if @sample.update_attributes(sample_params)
      flash[:success] = "Gem Updated Successfully!"
      redirect_to user_samples_path
    else
      flash[:danger] = "Error. Please Resubmit. If you are not successful, please send feedback using the Feedback link in the navbar."
      render action: :edit
    end
  end

  def show
    @user = User.find(params[:user_id])
    @sample = @user.samples.find(params[:id])
  end

  def index
    @user = User.find(params[:user_id])
    @samples = @user.samples
  end

  def destroy
    @user = User.find(params[:user_id])
    @sample = @user.samples.find(params[:id])
    @sample.destroy
    redirect_to user_samples_path
  end

  private

  def sample_params
    params.require(:sample).permit(:id, :category, :title, :description, :img_before, :img_after, :marquee)
  end

  def only_current_user
    @user = User.find( params[:user_id] )
    redirect_to(root_url) unless @user == current_user
  end

end