tutorModel=require '../../models/Tutor'
#Child=mongoose.model('Child')

exports.list = (req, res) ->
  tutorModel.find (err, tut) ->
    res.json tut

exports.retrieve = (req, res) ->
  tutorModel.findOne  id:req.params.id, (err,tut) ->
    res.send(500, { error: err }) if err?
    if tut?
      res.send(tut)
    else
      res.send(404)


exports.create = (req, res) ->
  fields=req.body
  ch=new tutorModel(fields)
  ch.save (err, tut) ->
    res.send(500, { error: err }) if err?
    res.send(tut)

exports.update = (req, res) ->
  tutorModel.findOne  id:req.params.id, (err,tut) ->
    if err?
      res.send(500, { error: err })
    else if tut?
      tutorModel.findByIdAndUpdate tut._id, { $set: req.body }, (err, resource) ->
        if err?
          res.send(500, { error: err })
        else res.send(resource)
    else
      res.send(404)

exports.destroy = (req, res) ->
  res.json()