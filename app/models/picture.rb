class Picture < ActiveRecord::Base

    has_attached_file :image, styles: {medium: "600x", thumb: "100x100>" }, default_url: "pinterest-pin.png"
		validates_attachment_content_type :image, content_type: %w(image/jpeg image/jpg image/png)

    validates :image, presence: true

    include SimpleHashtag::Hashtaggable
    hashtaggable_attribute :description

    belongs_to :user
    has_many :comments, dependent: :destroy

    acts_as_votable
end
