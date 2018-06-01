class Project < ApplicationRecord
  include Models::Taggable

  has_many :tasks, as: :taskable

  def self.tagged_with(name)
    Tag.find_by!(name: name).projects
  end
end
