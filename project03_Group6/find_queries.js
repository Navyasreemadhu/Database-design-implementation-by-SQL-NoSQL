Switch to the healthcare database

use healthcare

db.patient.find()


1. Find patients who live in downtown area of the city, and mention their first name, last name, email and address

db.patient.find({"address":{$regex:"downtown$"}},{"first_name":1,"last_name":1,"email":1,"address":1})


2. Find patients with at least one diagnosis of 'Angina' and mention their first name, last name, gender and date of birth

db.patient.find({"diagnoses":{$elemMatch:{"name":"Angina"}}},{"first_name":1,"last_name":1,"gender":1,"dob":1,"diagnoses":1})



3. Find patients who had an appointment with a doctor specialized in 'Opthalmologist', and also mention doctors's name, phone number and qualification

db.patient.find({"appointments.doctor.specialization":"Opthalmologist"},
{"first_name":1,"last_name":1,"appointments.doctor.first_name":1,"appointments.doctor.last_name":1,
"appointments.doctor.qualification":1,"appointments.doctor.phone":1,"appointments.doctor.specialization":1})



4. Find patient whose appointment was cancelled and mention the appointment details

db.patient.find({"appointments.status":"Cancelled"},
{"first_name":1,"appointments":{$elemMatch:{"status":"Cancelled"}}})


5. Find patients who are female and born before 2000

db.patient.find({$nor:[{"gender":"Male"},{"dob":{$gt:ISODate("2000-01-01T00:00:00Z")}}]},
{"first_name":1,"last_name":1,"gender":1,"dob":1})


6. Find patients who have more than one appointment, mention patient first name, last name and appointment details

db.patient.find({"appointments.1":{$exists:true}},{"first_name":1,"last_name":1,"appointments":1})


7. Find patients prescribed the medicine ‘Vaxnoc’

db.patient.find({"medicines.name":"Vaxnoc"},{"first_name":1,"last_name":1,"medicines":1})


8. Find patients who had appointments with doctors having ‘MD’ qualification

db.patient.find({"appointments.doctor.qualification":"MD"},
{"first_name":1,"last_name":1,"appointments.doctor.first_name":1,"appointments.doctor.last_name":1,
"appointments.doctor.specialization":1,"appointments.doctor.qualification":1})