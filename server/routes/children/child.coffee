childModel=require '../../models/Child'
measureModel=require '../../models/Measure'
#Child=mongoose.model('Child')

exports.list = (req, res) ->
  childModel.find (err, chi) ->
    res.json chi

exports.retrieve = (req, res) ->
  childModel.findOne  id:req.params.id, (err,chi) ->
    res.send(500, { error: err }) if err?
    if chi?
      res.send(chi)
    else
      res.send(404)


exports.create = (req, res) ->
    fields=req.body
    ch=new childModel(fields)
    ch.save (err, child) ->
      res.send(500, { error: err }) if err?
      res.send(child)

exports.update = (req, res) ->
  childModel.findOne  id:req.params.id, (err,chi) ->
    if err?
      res.send(500, { error: err })
    else if chi?
      #res.send(chi)
      childModel.findByIdAndUpdate chi._id, { $set: req.body }, (err, resource) ->
        if err?
          res.send(500, { error: err })
        else res.send(resource)
    else
      res.send(404)

exports.destroy = (req, res) ->
    res.json()

exports.addMeasure =(req,res) ->
  console.log(req)
  newMeasure=new measureModel(req.body)
  childModel.findOne  id:req.params.id, (err,child) ->
    if err?
      res.send(500, { error: err })
    else if child?
      console.log(newMeasure)
      child.measuresHistory.push newMeasure
      console.log(child)
      child.save (err) ->
        if err?
          res.send(500)
        else
          res.send(child)
    else
      res.send(404)