mgs = require 'mongoose'


IMCClassification = 'PMB; PB; RPB; PA; SP; O'.split('; ')

MeasureSchema = new mgs.Schema
    _id :  Number
    date: { type: Date, default: Date.now }
    weight: Number
    size: Number
    classification: {type: String, enum: IMCClassification } # PMB PB RPB #

module.exports = mgs.model 'Measure', MeasureSchema
