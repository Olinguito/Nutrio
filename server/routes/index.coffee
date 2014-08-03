module.exports = router = require('express').Router()

router.use '/some-endpoint', require './some-endpoint'
#router.use '/other-name', require './some-endpoint'

router.use '/children', require './children'
router.use '/tutors', require './tutors'