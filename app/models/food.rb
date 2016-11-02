class Food < ActiveRecord::Base
 belongs_to :category
 has_many :reviews
 has_many :inputs
 accepts_nested_attributes_for :inputs,
                                reject_if: proc {|attributes| attributes['ingredients'].blank?},
                                allow_destroy:true
 has_attached_file :food_img, :styles => {:food_index =>"250x350",:food_show =>
"325x475"},:default_url => "/images/"
validates_attachment_content_type :food_img,:content_type => /\Aimage\/.*\Z/
validates :name,:description,:food_img,presence: true
end


