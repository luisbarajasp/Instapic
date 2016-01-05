class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_attached_file :image, styles: { medium: "250x", thumb: "100x100>" }, default_url: "pinterest-pin.png"
     validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)

 validates :avatar, presence: true

  extend FriendlyId
  friendly_id :username, use: :slugged

  has_many :pictures
  has_many :comments
end
