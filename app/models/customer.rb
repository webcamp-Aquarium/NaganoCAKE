class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shippings, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  enum is_status: {有効: true, 退会済: false}

  def active_for_authentication?
    super && (self.is_status == true)
  end

  def inactive_message
    self.is_status == true ? super : :customer_status_is_not_valid
  end
end
