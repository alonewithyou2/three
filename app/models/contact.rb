class Contact < ActiveRecord::Base
  #contact form validations, check if the boxes are actually filled out or not
  validates :name, presence: true
  validates :email, presence: true
  validates :comments, presence: true
end