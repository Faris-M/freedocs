# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
Specialty.destroy_all
JoinTableSpecialty.destroy_all

specialty = Specialty.create(name: "Chirurgien")

50.times do
  specialty.id
  city = City.create!(name: Faker::Address.city)
  doctor = Doctor.create!(first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  zip_code: Faker::Address.zip_code,
  city_id: city.id)
  patient = Patient.create!(first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  city_id: city.id)
  appointment = Appointment.create!(date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 50), 
  doctor_id: doctor.id, 
  patient_id: patient.id,
  city_id: city.id)
  join_table_specialty = JoinTableSpecialty.create(doctor_id: doctor.id,
  specialty_id: specialty.id)
end