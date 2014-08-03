mgs = require 'mongoose'

MenuSchema = new mgs.Schema
    name: String
    ingredients: String


module.exports = mgs.model 'Menu', MenuSchema
