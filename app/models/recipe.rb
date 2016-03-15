class Recipe < ActiveRecord::Base

  belongs_to :chef # singlular because its ONE part of one-to-many

  validates :chef_id, presence: true # after chef_id/recipe association
  validates :name, presence: true,
      length: { minimum: 5, maximum: 100}
  validates :summary, presence: true,
      length: { minimum: 10, maximum: 150 }
  validates :description, presence: true,
      length: { minimum: 20, maximum:  500 }
end
