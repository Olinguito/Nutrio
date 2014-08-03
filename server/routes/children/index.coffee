router = require('express').Router()

fuu = require './fuu'
child = require './child'
router.route('/')
    .get(fuu.list)
    .post(fuu.create)
    .all (req, res) ->
        res.send 405

router.route('/fuu/:id')
    .get(fuu.retrieve)
    .put(fuu.update)
    .delete(fuu.destroy)

router.route('/children/:id')
    .get(child.retrieve)
    .put(child.update)
    .delete(child.destroy)

router.route('/children')
    .get(child.list)

module.exports = router
