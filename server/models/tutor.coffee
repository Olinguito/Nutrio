mgs = require 'mongoose'

TutorSchema = new mgs.Schema
    id: Number
    name: String
    email:
        type: String, unique: yes
    # password: String
    # image: String
    # role: String

module.exports = mgs.model 'Tutor', TutorSchema
