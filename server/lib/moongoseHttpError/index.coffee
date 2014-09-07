moongoseHttpError = require('./lib')
config = require '../../config'


middleWare  = (req, res, next)->
    return next() unless req.mgsError?
    errorHandled = moongoseHttpError(req.mgsError)
    res.status(errorHandled.status)

    res.json({msg: errorHandled.message}) if config.debug
    res.json({msg: "Unknown Error"}) unless config.debug


module.exports = middleWare