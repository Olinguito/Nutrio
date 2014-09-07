mgs = require 'mongoose'
libs = require '../lib/bmi'
bmiCalc = libs.Bmi
Q = require 'q'
mongoosePaginate = require('mongoose-paginate');
models = require './index'

Vaccine = models.Vaccine





IMCClassification = 'PMB; PB; RPB; PA; SP; O'.split('; ')
IMCClassificationP = ''


ChildSchema = new mgs.Schema
    _id:
      type: Number #Tarjeta de identidad
      index: true

    name:
      type: String
      required: true

    birthday:
      type: Date
      required: true

    gender: { type: String, enum:['Male', 'Female'] , required: true}

    weight:
      type: Number #current weight in Kg
      required: true

    size:
      type: Number #in cm
      required: true

    classification: {type: String, enum: IMCClassification } # PMB PB RPB #

    contacts: [{type : Number, ref: 'Contact'}]

    measuresHistory: [{type: Number, ref: 'Measure'}]

    vaccinesHistory: [{type : Number, ref: 'Vaccine'}]

    #image: String
ChildSchema.methods.addContacts = (contact)->
  this.contacts.push(contact._id)

ChildSchema.methods.addMeasure = (measure)->
  this.measuresHistory.push(measure._id)

ChildSchema.methods.addVaccine = (vaccine)->
  this.vaccinesHistory.push(vaccine._id)

ChildSchema.methods.setClassification = (weight, size)->
  this.size = size
  this.weight = weight
  this.classification = bmiCalc(this.gender, this.age, this.size, this.weight)

ChildSchema.methods.vaccines= ()->
  deferred = Q.defer();
  gvs = Vaccine.generalVaccines.length
  fvs = vaccine.femaleVaccines.length
  self = this

  for vaccineData, i  in Vaccine.generalVaccines

    vaccine = new Vaccine(vaccineData)

    vaccine.save((err)->

      deferred.reject(err) if err

      self.addVaccine(vaccine)

      if i == gvs - 1 && this.gender != 'Female'
        deferred.resolve(gvs)
        return

      if i == gvs -1 && this.gender == 'Female'
        for vaccineData, j in vaccine.femaleVaccines

          vaccine = new Vaccine(vaccineData)

          vaccine.save((err)->

            deferred.reject(err) if err

            self.addVaccine(vaccine)

            if j == fvs - 1 && this.gender != 'Female'

              deferred.resolve(fvs)
          )
    )

  return deferred.promise

ChildSchema.virtual 'age'
.get ()->
  ageDifMs = Date.now() - this.birthday.getTime();
  ageDate = new Date(ageDifMs); # miliseconds from epoch
  return Math.abs(ageDate.getUTCFullYear() - 1970);


ChildSchema.plugin(mongoosePaginate)

module.exports = mgs.model 'Child', ChildSchema