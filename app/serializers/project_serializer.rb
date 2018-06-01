class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :tag_list
  has_many :tasks
  has_many :tags
end
