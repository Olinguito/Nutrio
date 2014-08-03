mgs = require 'mongoose'
childModel=require './Child'

TutorSchema = new mgs.Schema
    id: Number #cedula
    name: String
    email:
        type: String, unique: yes
    phone: String
    children: [childModel]
    # password: String
    # image: String
    # role: String

module.exports = mgs.model 'Tutor', TutorSchema