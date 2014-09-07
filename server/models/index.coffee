###
  Exports all models when requiring this directory
###

fs = require 'fs'
path = require 'path'

# require all .js and .coffee files in the current directory excluding this file
dir = fs.readdirSync __dirname

dir.map (file) ->
    path.join __dirname, file
.filter (file) ->
    fs.statSync(file).isFile() and file isnt __filename and (path.extname(file) is '.js' or path.extname(file) is '.coffee')
.forEach (file) ->
    # export required files as module's properties in a capitalized form
    name = path.basename file, path.extname file
    capitalName = name[0].toUpperCase() + name[1..]
    exports[capitalName] = require "./#{name}"
