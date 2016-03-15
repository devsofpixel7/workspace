class Chef < ActiveRecord::Base

  has_many :recipes # plural because its MANY part of one-to-many

  # callback before saving model to db
  before_save { self.email = email.downcase }
  # equvelent is: self.email = self.email.downcase

  validates :chefname,
      presence: true,
      length: { minimum: 3, maximum: 40}

  # regular expression format for valid email address
  # we're validating against this regex
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # cannot use: uniqueness: true # will check uniqueness for uppercase only
  validates :email,
      presence: true,
      length: { maximum: 105},
      uniqueness: { case_sensitive: false }, #check uniqueness uppercase & downcase
      format: { with: VALID_EMAIL_REGEX }

end
