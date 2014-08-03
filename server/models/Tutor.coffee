mgs = require 'mongoose'
childModel=require './Child'

TutorSchema = new mgs.Schema
    id:
      type: Number #cedula
      unique: true
      index: true
    name: String
    email:
        type: String, unique: yes
    phone: String
    children: [childModel.childSchema]
    # password: String
    # image: String
    # role: String

module.exports = mgs.model 'Tutor', TutorSchema