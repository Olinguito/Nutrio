config =
    test:
        db: 'mongodb://localhost/coolorder#test'
    development:
        db: 'mongodb://localhost/coolorder#dev'
    production:
        db: ''

# export configuration depending on the enviroment
env = process.env.NODE_ENV or 'development'
module.exports = config[env]