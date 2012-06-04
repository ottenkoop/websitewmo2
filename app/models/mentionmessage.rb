class Mentionmessage

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :category, :subject, :body

  #validates_inclusion_of :category, in: %w(Openbaar vervoer Regelingen Bestrating Openbare voorzieningen Overige)
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end