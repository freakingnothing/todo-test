class Project < ApplicationRecord
  has_many :tasks, as: :taskable
end
