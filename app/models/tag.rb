class Tag < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :projects, through: :taggings, source: :taggable, source_type: 'Project'
  has_many :tasks, through: :taggings, source: :taggable, source_type: 'Task'
end
