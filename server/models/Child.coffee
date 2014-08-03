mgs = require 'mongoose'
contactModel=require './Contact'
measureModel=require './Measure'
vaccineModel=require './Vaccine'

sexOpt = 'Male Female'.split(' ')
IMCClassification = 'Peso muy bajo;Peso Bajo;Riesgo de peso bajo;Peso adecuado;Sobrepeso;Obesidad'.split(';')

ChildSchema = new mgs.Schema
    id:
      type: Number #Tarjeta de identidad
      unique: true
      index: true
    name: String
    birthday: Date
    sex: { type: String, enum: sexOpt }

    weight: Number #current weight in Kg
    size: Number #in cm
    classification: {type: String, enum: IMCClassification}
    contacts: [contactModel.contactSchema]
    measuresHistory: [measureModel.measureSchema]
    vaccinesHistory: [vaccineModel.vaccineSchema]
# image: String

module.exports = mgs.model 'Child', ChildSchema
module.exports.childSchema=ChildSchema
module.exports.classifications=IMCClassification