class Upline_Transaction < ApplicationRecord
  has_one :agent, :class_name => "User"
  has_one :upline, :class_name => "User"
end