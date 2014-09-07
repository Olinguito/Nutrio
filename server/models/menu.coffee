mgs = require 'mongoose'

MenuSchema = new mgs.Schema
    _id: typeof : Number
    category:
      type: String
    name: String
    ingredients: String


module.exports = mgs.model 'Menu', MenuSchema
