###
  Some end-point
  Tests the API at the HTTP level
###

should = require('chai').should()
app = require '../../server/server'
request = require('supertest')(app)
mongoose = require '../../server/db'

describe 'some end-point test', ->

  before ->
    # clean DB before testing
    mongoose.connection.db.dropDatabase()

  describe 'POST /some-endpoint', ->
    data = name: 'fuu', email: 'bar@baz'
    it 'should create a new resource and return it', (done) ->
      request.post '/some-endpoint'
      .send data
      .type 'json'
      .expect 200
      .end (err, res) ->
        done err if err
        res.body.name.should.equal data.name
        res.body.email.should.equal data.email
        do done
    it 'should fail with a conflic error if the resource already exist', (done) ->
      request.post '/some-endpoint'
      .send org
      .type 'json'
      .expect 409, done

  describe 'GET /some-endpoint(/:id)', ->
    it 'should get a list of resources', (done) ->
      request.get '/some-endpoint'
      .type 'json'
      .expect 200
      .end (err, res) ->
        done err if err
        res.body.should.be.an 'array'
        do done

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

