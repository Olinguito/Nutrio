router = require('express').Router()
user = require './user'
tutor = require '../tutors/tutor'

router.route('/login')
    .post(user.login)

router.route('/register')
    .post(tutor.create)

module.exports = router
