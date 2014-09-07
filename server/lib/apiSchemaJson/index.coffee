config = require '../../config'



multiple = (results, itemCount, totalPages, page) ->

    schema =
        apiName: config.info.apiName
        apiVersion : config.info.version
        currentDate : Date.now()
        itemCount : itemCount
        totalPages : totalPages
        currentPage: page
        results : results

    return schema

one = (results) ->

  schema =
    apiName: config.info.apiName
    apiVersion : config.info.version
    currentDate : Date.now()
    result : results

  return schema


module.exports.multiple = multiple
module.exports.one = one

