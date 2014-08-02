should = require('chai').should()
mongoose = require '../../server/db'

describe 'Models', ->
    describe 'Users', ->
        User = mongoose.model 'User'
        data = name: 'Juan', email: 'juan@fuu.com', password: 'fuu'

        before (done) ->
            User.remove {}, done

        it 'creates a new user', (done) ->
            user = new User data
            user.save (err, user) ->
                user.should.be.ok
                done err
        it 'fails to create an user with the same email', (done) ->
            user = new User data
            user.save (err) ->
                should.exist err
                do done
