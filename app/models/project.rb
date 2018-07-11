class Project < ApplicationRecord
  include Models::Taggable

  belongs_to :user
  has_many :tasks, as: :taskable

  def self.tagged_with(name)
    Tag.find_by!(name: name).projects
  end
end
