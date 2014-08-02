router = require('express').Router()

fuu = require './fuu'
router.route '/'
.get fuu.list
.post fuu.create
.all (req, res) ->
    res.send 405
    
router.route '/fuu/:id'
.get fuu.retrieve
.put fuu.update
.delete fuu.delete

module.exports = router
