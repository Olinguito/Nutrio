tutorModel=require '../../models/Tutor'
childModel=require '../../models/Child'
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

exports.addChild =(req,res) ->
  newChild=new childModel(req.body)
  #TODO Plan de vacunación
  tutorModel.findOne  id:req.params.id, (err,tut) ->
    if err?
      res.send(500, { error: err })
    else if tut?
      console.log("nuevo ahijado...")
      console.log(newChild)
      tut.children.push newChild
      console.log(tut)
      tut.save (err) ->
        if err?
          res.send(500)
        else
          res.send(tut)
    else
      res.send(404)