mgs = require 'mongoose'

ChildSchema = new mgs.Schema
    name: String
# image: String

module.exports = mgs.model 'Child', ChildSchema