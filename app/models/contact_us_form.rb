class ContactUsForm
  include ActiveModel::Model

  attr_accessor :full_name, :email, :phone_number, :text

  validates :full_name, :email, :text, presence: true
  validates :email, format: { with: /\A[^@]+@[^@]+\z/ }
  validates :phone_number, format: { with: /\d{10}/ }, allow_blank: true
  validates :full_name, length: { maximum: 50 }
end
