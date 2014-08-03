mgs = require 'mongoose'

AlertSchema = new mgs.Schema
    date: Date
    type: Number # 1 to 5. 5 is Excellent
    message: String

module.exports = mgs.model 'Alert', AlertSchema
