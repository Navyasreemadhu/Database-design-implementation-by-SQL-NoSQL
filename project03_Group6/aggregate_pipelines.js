
Switch to the healthcare database

use healthcare


1. Unwind appointments and project patient and appointment details

db.patient.aggregate([
  {"$unwind":"$appointments"},
  {"$project":{"first_name":1,"last_name":1,
               "appointment_id":"$appointments.appointment_id",
	       "time":"$appointments.time",
               "date":"$appointments.date",
               "status":"$appointments.status",
               "doctor_name":"$appointments.doctor.first_name"}}])


2. Group by appointment status and count total number of appointments per status

db.patient.aggregate([
  {"$unwind":"$appointments"},
  {"$group":{"_id":"$appointments.status","total":{"$sum":1}}}
])


3. Group by patient and collect all appointment IDs using $push

db.patient.aggregate([
  {"$unwind":"$appointments"},
  {"$group":{"_id":"$_id","name":{"$first":"$first_name"},
             "appointments":{"$push":"$appointments.appointment_id"}}}
])


4. Project only scheduled appointments using $filter

db.patient.aggregate([{"$match":{"appointments.status":"Scheduled"}},
{"$project":{"first_name": 1,"last_name": 1,"scheduled_appointments": 
{"$filter":{"input":"$appointments","as":"app",
"cond":{"$eq":["$$app.status","Scheduled"]}}}}}])


5. Project full name, email, and gender by reshaping the document

db.patient.aggregate([{"$project":{"_id":0,"full_name":{"$concat":["$first_name"," ","$last_name"]},
"email":1,"gender":1}}])


6. Unwind diagnoses and group by diagnosis name, collecting patient names using $push

db.patient.aggregate([{"$unwind":"$diagnoses"},
{"$group":{"_id":"$diagnoses.name","patients":{"$push":{"$concat":["$first_name"," ","$last_name"]}}}}])