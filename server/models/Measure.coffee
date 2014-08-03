mgs = require 'mongoose'

MeasureSchema = new mgs.Schema
    date: Date
    weight: Number
    size: Number

module.exports = mgs.model 'Measure', MeasureSchema
module.exports.measureSchema=MeasureSchema
