config =
    test:
        db: 'mongodb://localhost/Nutrio#test'
        security:
          tokenLife : 3600
        debug : true
        info:
          apiName: 'Nutrio'
          version : 'v0.1'
        pagination:
          page: 1
          rows: 20
        game :
            levels: 10
            questionsLevel: 13

    development:
        db: 'mongodb://localhost/Nutrio#dev'
        security:
          tokenLife : 3600
        debug : true
        info:
          apiName: 'Nutrio'
          version : 'v0.1'
        pagination:
          page: 1
          rows: 20
        game :
          levels: 10
          questionsLevel: 13
    production:
        db: 'mongodb://localhost/Nutrio#prod'
        security:
          tokenLife : 3600
        debug: false
        info:
          apiName: 'Nutrio'
          version : 'v0.1'
        pagination:
          page: 1
          rows: 20
        game :
          levels: 10
          questionsLevel: 13

# export configuration depending on the enviroment
env = process.env.NODE_ENV or 'development'
module.exports = config[env]