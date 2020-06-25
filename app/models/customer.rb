class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shippings, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,:address,:phone,presence: true
  validates :postal_code,presence: true, length: { is: 7 }
  enum is_status: {有効: true, 退会済: false}

  def self.search(search)
    return Customer.all unless search
    Customer.find_by_sql(["select * from Customers where family_name_kanji || first_name_kanji LIKE ?", "%#{search}%"])
  end
end