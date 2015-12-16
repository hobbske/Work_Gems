class SamplesController < ApplicationController
  before_action :authenticate_user!
  before_action :only_current_user

  def new
    @user = User.find(params[:user_id])
    @sample = @user.samples.build
  end

  def create
    @user = User.find(params[:user_id] )
    @sample = @user.samples.build(sample_params)
    if @sample.save
      flash[:success] = "Your Gem Has Been Created!"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
  end

  def edit
  end

  private

  def sample_params
    params.require(:sample).permit(:category, :title, :description, :img_before, :img_after, :marquee )
  end

  def only_current_user
    @user = User.find( params[:user_id] )
    redirect_to(root_url) unless @user == current_user
  end

end