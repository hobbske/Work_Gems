module UsersHelper
  def profession_icon
    if @user.profile.profession == "Construction"
      "<i class='fa fa-home'></i>".html_safe
    elsif @user.profile.profession == "Photographer"
      "<i class='fa fa-camera'></i>".html_safe
    elsif @user.profile.profession == "Painter"
      "<i class='fa fa-paint-brush'></i>".html_safe
    else
      "<i class='fa fa-star''></i>".html_safe
    end
  end

end