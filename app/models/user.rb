class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_one :profile, dependent: :destroy
  has_many :samples, dependent: :destroy

  attr_accessor :stripe_card_token

  def save_with_payment
    if valid?
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end

  # from_omniAuth method - Railscasts 241 - Ryan Bates
  # def self.from_omniauth(auth)
  #   # where(auth.slice(:provider, :uid)).first_or_create do |user|
  #   #   user.provider = auth.provider
  #   #   user.uid = auth.uid
  #   #   user.username = auth.info.nickname
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #   end
  # end

  # def self.new_with_session(params, session)
  #   if session["devise.user_attributes"]
  #     new(session["devise.user_attributes"], without_protection: true) do |user|
  #       user.attributes = params
  #       user.valid?
  #     end
  #   else
  #     super
  #   end
  # end

  # def password_required?
  #   super && provider.blank?
  # end

  




  private

  def params
    params.require(:user).permit(:name, :email, :provider, :uid)
  end


end
