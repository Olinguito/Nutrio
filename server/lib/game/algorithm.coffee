algorithm = (totalLevels, questionsLevel)->
      c = 1
      loop
        max = Math.round(c*(totalLevels*totalLevels))
        if max < questionsLevel
            break
        c -= 0.001

      levelGenerated = []
      for level in [0...totalLevels]
          iLevel = totalLevels - level
          level++

          h = Math.round(c*(level*level)) # hard questions
          e = Math.round(c*((iLevel)*(iLevel))) # easy questions
          m = questionsLevel - (h+e) # medium questions
          levelGenerated.push({e: e, m: m, h: h})

      return levelGenerated

module.exports = algorithm