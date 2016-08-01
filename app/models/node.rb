class Node < ApplicationRecord
  belongs_to :user

  validates_presence_of :identifier, :name, :data
end
