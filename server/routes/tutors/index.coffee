router = require('express').Router()
child = require './child'

router.route('/:id')
    .get(child.retrieve)
    .put(child.update)
    .delete(child.destroy)

router.route('/')
    .get(child.list)
    .post(child.create)

module.exports = router
