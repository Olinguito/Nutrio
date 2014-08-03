mgs = require 'mongoose'

ContactSchema = new mgs.Schema
    name: String
    phone: Number
    address: String
    relationship: String

module.exports = mgs.model 'Contact', ContactSchema
module.exports.contactSchema=ContactSchema