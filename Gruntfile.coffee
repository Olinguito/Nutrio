module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'

  grunt.initConfig
#    pkg: pkg
#    mocha:

  grunt.registerTask 'test', ['mocha']
  grunt.registerTask 'default', ['express:dev']
