methods = require('../../../node_modules/express/node_modules/methods')

class ClaraDoc
  @Router = require('./router')

  @rexToPath =  (rex, keys)->

    arrayPaths = rex.toString().split('\\/')
    subPath = ""
    i = j = 0;


    completePath = "/"

    while (i < arrayPaths.length)
      subPath = arrayPaths[i]

      if i == 0 || i >= arrayPaths.length - 2
        i++
        continue

      if subPath[0] == '('

        completePath += ':' + keys[j].name + "/"
        i++ ; j++;

      else

        completePath += subPath + "/"

      i++

    completePath[completePath.length]=''

    return completePath

  @document = (router) ->
    paths = []
    console.log(router)
    for route  in router
      if route.route?
        endpoint =
          path: route.route.path
          method: []

        methods = Object.keys(route.route.methods)


        for m in methods
          metadata = route.route["_meta_"+m]

          unless metadata
            endpoint.method.push(
              method : m
              doc: null
            )
            continue

          endpoint.method.push(
            method: m
            doc:
              in: metadata.in
              out: metadata.out
              info: metadata.info
          )

        paths.push( endpoint)
        continue

      if route.name == 'router'
        rootPath = this.rexToPath(route.regexp, route.keys)
        pathsT = this.document(route.handle.stack)

        for path in pathsT
          realPath = (rootPath+path.path).replace('//','/')
          paths.push({path: realPath , method: path.method})

    return paths

  @generate = (app)->
    router = app._router.stack
    return this.document(router)




module.exports = ClaraDoc
