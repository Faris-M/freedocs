class Specialty < ApplicationRecord
  has_many :doctors, through: :join_table_specialties
  has_many :join_table_specialties
end
