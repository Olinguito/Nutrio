mgs = require 'mongoose'
childModel=require './Child'
crypto = require 'crypto'
mongoosePaginate = require 'mongoose-paginate';

TutorSchema = new mgs.Schema
    _id:
      type: Number #cedula

    name: String, required: true
    email:
        type: String
        unique: yes
        required: true

    phone: String, required: false
    children: [ {type : Number,  ref: 'Child'}  ]
    hashPassword:String
    gender:
      type: String
      enum : ['Female','Male']
      required: true
    birthday:
      type: Date
      required: true
    salt: String
    registerDate:
      type: Date
      default: Date.now
    #image: String
    #role: String


TutorSchema
.virtual('password')
.set((password)->
  this._plaintPassword = password
  this.salt = crypto.randomBytes(32).toString('base64');
  this.hashPassword = this.encrypt(password)
)
.get(()-> return this._plaintPassword)

TutorSchema.methods.addChildren = (children)->
    this.children.push(children._id)

TutorSchema.methods.encrypt = (password)->
  return crypto.createHmac('sha1', this.salt).update(password).digest('hex');


TutorSchema.methods.login = (password)->
  return this.encrypt(password) == this.hashPassword


TutorSchema.plugin(mongoosePaginate)


module.exports = mgs.model 'Tutor', TutorSchema