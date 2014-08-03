tutorModel=require '../../models/Tutor'
childModel=require '../../models/Child'
vaccuneModel=require '../../models/Vaccine'
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

  vac=new vaccuneModel({name: 'Tuberculosis',age: 1, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Hepatitis B',age: 1, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Polio primera',age: 60, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Pentavalente primera',age: 60, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Influenzae Tipo b y Difteria - Tosferina-Tetáno (DPT) primera',age: 60, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Rotavirus primera',age: 60, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Neumococo primera',age: 60, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Polio segunda',age: 120, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Pentavalente segunda',age: 120, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Influenzae Tipo b y Difteria - Tosferina-Tetáno (DPT) segunda',age: 120, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Rotavirus segunda',age: 120, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Neumococo segunda',age: 120, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Polio tercera',age: 180, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Pentavalente tercera',age: 180, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Influenzae Tipo b y Difteria - Tosferina-Tetáno (DPT) tercera',age: 180, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Influenza primera',age: 120, applied: false})#age in days
  newChild.vaccinesHistory.push vac

  vac=new vaccuneModel({name: 'Influenza segunda',age: 180, applied: false})#age in days
  newChild.vaccinesHistory.push vac

  vac=new vaccuneModel({name: 'Sarampión Rubéola Paperas (SRP)',age: 365, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Fiebre Amarilla',age: 365, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Neumococo refuerzo',age: 365, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Influenza anual',age: 365, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Hepatitis A',age: 365, applied: false})#age in days
  newChild.vaccinesHistory.push vac

  vac=new vaccuneModel({name: 'Difteria - Tosferina Tétano (DPT) refuerzo 1',age: 540, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Polio refuerzo 1',age: 540, applied: false})#age in days
  newChild.vaccinesHistory.push vac

  vac=new vaccuneModel({name: 'Polio refuerzo 2',age: 1825, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Difteria - Tosferina Tétano (DPT) refuerzo 2',age: 1825, applied: false})#age in days
  newChild.vaccinesHistory.push vac
  vac=new vaccuneModel({name: 'Sarampión Rubéola Paperas (SRP) refuerzo',age: 1825, applied: false})#age in days
  newChild.vaccinesHistory.push vac

  if newChild.sex.equal 'Female'
    vac=new vaccuneModel({name: 'VPH',age: 3285, applied: false})#age in days
    newChild.vaccinesHistory.push vac
    vac=new vaccuneModel({name: 'VPH',age: 3465, applied: false})#age in days
    newChild.vaccinesHistory.push vac
    vac=new vaccuneModel({name: 'VPH',age: 5110, applied: false})#age in days
    newChild.vaccinesHistory.push vac

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