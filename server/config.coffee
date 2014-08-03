config =
    test:
        db: 'mongodb://localhost/undostres#test'
    development:
        db: 'mongodb://localhost/undostres#dev'
    production:
        db: ''

# export configuration depending on the enviroment
env = process.env.NODE_ENV or 'development'
module.exports = config[env]