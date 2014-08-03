module.exports = (grunt) ->
    pkg = grunt.file.readJSON 'package.json'

    grunt.initConfig
#    pkg: pkg
        express:
            dev:
                options:
                    server: 'server/server.coffee'
                    port: 3000
                    serverreload: yes
        mochaTest:
            test:
                options:
                    reporter: 'spec'
                    require: 'coffee-script/register'
                src: ['test/api/**/*.coffee']

    grunt.loadNpmTasks 'grunt-express'
    grunt.loadNpmTasks 'grunt-mocha-test'

    grunt.registerTask 'test', ['mochaTest']
    grunt.registerTask 'default', ['express:dev']
