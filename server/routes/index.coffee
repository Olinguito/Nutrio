module.exports = router = require('express').Router()



router.use '/children', require './children'
router.use '/tutor', require './tutors'
router.use '/', require './user'