###
  DataBase initialization
  In separate file for easier testing
###
mongoose = require 'mongoose'

# Connect to a different database depending on the enviroment
mongoose.connect require('./config').db
# Load models and schemas from the start
require './models'

module.exports = mongoose