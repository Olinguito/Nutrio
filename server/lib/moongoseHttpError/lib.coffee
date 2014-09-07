util = require 'util'

###
  Creator: S0c5 (David Barinas)
  team: Olinguito
  github: https://github.com/s0c5/
  Based in: https://github.com/sebabromberg
###




moongoseHttpError = (err)->
    msg =
        status: 0
        message: ""

    switch err.name
        when "ValidationError", "CastError"
          msg.status = 400
        else
          msg.status = 500

    console.log err
    return (msg.message = "Duplicate key"; msg.status = 400 ; msg ) if err.name == 'MongoError' && err.code == 11000

    return (msg.message = err.message; msg ) if msg.status == 500

    return (msg.message = err.path + ": need a " + err.type; msg ) if !err.errors? and err.name == 'CastError'


    messages =
        'custom': '%s: %s'
        'required': "%s: is required.",
        'min': "%s: below minimum.",
        'max': "%s: above maximum.",
        'enum': "%s: not an allowed value."


    errorsFriendly = []



    for field, error of err.errors

        errorsFriendly.push util.format(messages['custom'], error.path, error.type) unless error.type of messages
        errorsFriendly.push util.format(messages[error.type], error.path) if error.type of messages

    return (msg.message = errorsFriendly; msg )


module.exports =  moongoseHttpError

