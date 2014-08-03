###
  Some end-point
  Tests the API at the HTTP level
###

should = require('chai').should()
app = require '../../server/server'
request = require('supertest')(app)
mongoose = require '../../server/db'

describe 'Tutors', ->

  before ->
    # clean DB before testing
    mongoose.connection.db.dropDatabase()

  describe 'GET /children', ->
    it 'should retrieve all children', (done) ->
      request.get '/children'
        .type 'json'
        .expect 200
        .end (err,res) ->
          done err if err
          res.body.should.be.an 'array'
          do done

  describe 'POST /children', ->
    it 'should create a child', (done) ->
      console.log('posting a child')
      newChild={id: 1, name: 'pepito', birthday: '10/12/1995', weight: 40, size: 140}

      request.post '/children'
      .send newChild
      .type 'json'
      .expect 200
      .end (err, res) ->
        done err if err
        console.log(res)
        res.body.name.should.equal newChild.name
        do done

  describe 'GET /children/:id', ->
    it 'should retrieve the child', (done) ->
      request.get '/children/1'
      .type 'json'
      .expect 200
      .end (err,res) ->
        done err if err

    describe 'Getting a resource by id', ->
      it 'should retrieve an existing resource', (done) ->
        request.get '/some-endpoint/1'
        .type 'json'
        .expect 200
        .end (err, res) ->
          done err if err
      it 'should return not found when the id doesn\'t exist', (done) ->
        request.get '/some-endpoint/2'
        .type 'json'
        .expect 404, done

