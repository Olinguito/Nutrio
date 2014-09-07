mgs = require 'mongoose'

VaccineSchema = new mgs.Schema
    _id: {typeof: Number}
    name: String #same type??
    days: Number #desired age in days age
    applied: Boolean


VaccineSchema.generalVaccines =  [
  {name: 'Tuberculosis',days: 1, applied: false},

  {name: 'Hepatitis B',days: 1, applied: false},

  {name: 'Polio primera',days: 60, applied: false},

  {name: 'Pentavalente primera',days: 60, applied: false},

  {name: 'Influenzae Tipo b y Difteria - Tosferina-Tetáno (DPT) primera',days: 60, applied: false},

  {name: 'Rotavirus primera',days: 60, applied: false},

  {name: 'Neumococo primera',days: 60, applied: false},

  {name: 'Polio segunda',days: 120, applied: false},

  {name: 'Pentavalente segunda',days: 120, applied: false},

  {name: 'Influenzae Tipo b y Difteria - Tosferina-Tetáno (DPT) segunda',days: 120, applied: false},

  {name: 'Rotavirus segunda',days: 120, applied: false},

  {name: 'Neumococo segunda',days: 120, applied: false},

  {name: 'Polio tercera',days: 180, applied: false},

  {name: 'Pentavalente tercera',days: 180, applied: false},

  {name: 'Influenzae Tipo b y Difteria - Tosferina-Tetáno (DPT) tercera',days: 180, applied: false},

  {name: 'Influenza primera',days: 120, applied: false},


  {name: 'Influenza segunda',days: 180, applied: false},


  {name: 'Sarampión Rubéola Paperas (SRP)',days: 365, applied: false},

  {name: 'Fiebre Amarilla',days: 365, applied: false},

  {name: 'Neumococo refuerzo',days: 365, applied: false},

  {name: 'Influenza anual',days: 365, applied: false},

  {name: 'Hepatitis A',days: 365, applied: false},


  {name: 'Difteria - Tosferina Tétano (DPT) refuerzo 1',days: 540, applied: false},

  {name: 'Polio refuerzo 1',days: 540, applied: false},


  {name: 'Polio refuerzo 2',days: 1825, applied: false},

  {name: 'Difteria - Tosferina Tétano (DPT) refuerzo 2',days: 1825, applied: false},

  {name: 'Sarampión Rubéola Paperas (SRP) refuerzo',days: 1825, applied: false}
]


VaccineSchema.femaleVaccines = [
  {name: 'VPH',days: 3285, applied: false},

  {name: 'VPH',days: 3465, applied: false},

  {name: 'VPH',days: 5110, applied: false}
]
module.exports= mgs.model 'Vaccine', VaccineSchema