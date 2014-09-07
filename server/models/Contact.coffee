mgs = require 'mongoose'

ContactSchema = new mgs.Schema
    _id :  Number
    name: String
    phone: Number
    address: String
    relationship:  String

module.exports = mgs.model 'Contact', ContactSchema
