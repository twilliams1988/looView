# Loo route
class Loo < ApplicationRecord

  # has_attached_file :picture, :styles => { :large => "1200x1200", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  # validates_attached_content_type :picture, content_type => /\Aimage\\\/.*\z/

  has_many :comments, dependent: :destroy

end
