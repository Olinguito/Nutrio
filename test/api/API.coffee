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
          console.log err
          done()
        )
      );


    it 'POST /register', (done) ->
      request.post '/register'
        .send User
        .type 'json'
        .expect 200
        .end (err,res) ->
          done err if err
        
          res.body.name.should.be.equal User.name
          res.body.email.should.be.equal User.email
          do done



