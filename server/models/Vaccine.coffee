mgs = require 'mongoose'

VaccineSchema = new mgs.Schema
    name: String #same type??
    age: Number #desired age in days
    applied: Boolean


module.exports= mgs.model 'Vaccine', VaccineSchema
