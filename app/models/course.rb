class Course < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    belongs_to :instructor, class_name: 'User', foreign_key: :user_id, optional: true
    has_many :sections
    has_many :enrollments
    
    validates :title, presence: true
    validates :description, presence: true
    validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}

    def free?
     cost.zero?
    end
    
    def premium?
     ! free?
    end
end
