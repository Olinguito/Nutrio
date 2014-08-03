###
  Server
###
app = do require 'express'
# connect to the database and load models
db = require './db'
# middlewares
app.use do require 'body-parser'


allowCrossDomain = (req, res, next) ->
  res.header 'Access-Control-Allow-Origin', '*'
  res.header 'Access-Control-Allow-Methods', 'GET'
  res.header 'Access-Control-Allow-Headers', 'Content-Type'
  next()
app.use allowCrossDomain

app.use require './routes'
app.use((req, res)->
  res.headers['Access-Control-Allow-Origin']='*'
)


if app.get('env') is 'development'
    app.use do require 'errorhandler'
    app.use require('morgan') 'dev'

# start server if this file is called directly
if require.main is module
    port = process.env.PORT or 3000
    console.log "Server listening on port #{port} ..."
    app.listen port
else
    module.exports = app
