###
  Some end-point
  Tests the API at the HTTP level
###

should = require('chai').should()
app = require '../../server/server'
request = require('supertest')(app)
mongoose = require '../../server/db'
User = {}

describe 'Tutors', ->

  before (done)->
    User =
      _id: 4211349
      name: "Test"
      email: "test@test.com"
      phone: "311111111"
      password: "123456789"
      gender: "Male"
      birthday: Date.now()
    done()
  describe 'Process register and login', ->
    it 'Drop database', (done)->
      # clean DB before testing
      mongoose.connection.on('open',(ref) ->
        mongoose.connection.db.dropDatabase((err)->
          done()
        )
      );


    it 'POST /register should be Register a new User', (done) ->
      request.post '/register'
        .send User
        .type 'json'
        .expect 200
        .end (err,res) ->
          done err if err

          res.body.result.name.should.be.equal User.name
          res.body.result.email.should.be.equal User.email
          do done

    it 'POST /login should be reject because i have a invalid credentials ', (done) ->

      login = {email : User.email, pwd: "badpassword"}
      request.post '/login'
      .send login
      .type 'json'
      .expect 401
      .end (err, res) ->
        return done err if err
        do done

    it 'POST /login should be accept ', (done)->
      login = {email : User.email, pwd: "123456789"}
      request.post '/login'
      .send login
      .type 'json'
      .expect 200
      .end (err, res) ->
        return done err if err
        res.body.name.should.be.equal User.name
        User = res.body
        do done

  describe 'Add Children to Tutor',  ->
    it 'POST /USER/' + User._id + "/children add new Children ", (done)->

      children =

      request.get '/login'
      .send login
      .type 'json'
      .expect 200
      .end (err, res) ->
        return done err if err
        res.body.name.should.be.equal User.name
        User = res.body
        do done

