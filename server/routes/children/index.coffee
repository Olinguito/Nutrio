router = require('express').Router()
child = require './child'
Tutor = require '../tutors/tutor'


router.route('/:id')
    .get(child.retrieve)
    .put(child.update)
    .post(child.addMeasure)#Agrega una medida al historial

router.route('/:id/vaccinate')
    .put(child.vaccinate)

router.route('/')
    .get(child.list)
    .post(Tutor.addChild)

module.exports = router
