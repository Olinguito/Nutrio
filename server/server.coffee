###
  Server
###
app = do require 'express'
# connect to the database and load models
db = require './db'
# middlewares
app.use do require 'body-parser'
app.use require './routes'

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
