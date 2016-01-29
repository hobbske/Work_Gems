class PagesController < ApplicationController
  def home
    @basic_plan  = Plan.find(1).to_i
    @pro_plan    = Plan.find(2).to_i
  end
  
  def about
  end
end
