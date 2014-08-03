router = require('express').Router()
child = require './tutor'

router.route('/:id')
    .get(tutor.retrieve)
    .put(tutor.update)
    .delete(tutor.destroy)

router.route('/')
    .get(tutor.list)
    .post(tutor.create)

module.exports = router
