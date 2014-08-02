###
  Sample mongoose model
###

mgs = require 'mongoose'

UserSchema = new mgs.Schema
    name: String
    email:
        type: String, unique: yes
    # password: String
    # image: String
    # role: String

module.exports = mgs.model 'User', UserSchema
