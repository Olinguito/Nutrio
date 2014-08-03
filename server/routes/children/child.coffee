childModel=require '../../models/Child'
#Child=mongoose.model('Child')

exports.list = (req, res) ->
  childModel.find (err, chi) ->
    res.json chi

exports.retrieve = (req, res) ->
    res.json {}

exports.create = (req, res) ->
    res.json {}

exports.update = (req, res) ->
    res.json {}

exports.destroy = (req, res) ->
    res.json()

