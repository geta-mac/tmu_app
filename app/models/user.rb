# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :club
end
