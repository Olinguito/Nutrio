mgs = require 'mongoose'

ContactSchema = new mgs.Schema
    name: String
    phone: number
    address: String
    relationship: String

module.exports = mgs.model 'Contact', ContactSchema
