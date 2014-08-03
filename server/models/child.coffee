mgs = require 'mongoose'
contactModel=require './Contact'
measureModel=require './Measure'
vaccineModel=require './Vaccine'

ChildSchema = new mgs.Schema
    id: Number #Tarjeta de identidad
    name: String
    birthday: Date
    sex: String #TODO enum??
    weight: Number #in Kg
    size: Number #in cm
    contact: contactModel
    measuresHistory: [measureModel]
    vaccinesHistory: [vaccineModel]
# image: String

module.exports = mgs.model 'Child', ChildSchema