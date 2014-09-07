router = require('express').Router()
menu = require './menu'

router.route('/:id')
    .get(menu.retrieve)



router.route('/')
    .get(menu.list)

module.exports = router
