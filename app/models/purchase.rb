class Purchase < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :token


  belongs_to :user
  belongs_to :item
  has_one    :order
end
