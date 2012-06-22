require 'coffee-script'

express = require 'express'
mongoose = require 'mongoose'
config = require './config'

app = express()

app.use express.static "#{__dirname}/public"
app.set 'view engine', 'jade'
app.use express.logger()

# mount routes
require('./routes/posts')(app)

app.get '/', (req, res) ->
  res.render 'index',
    title: "Iggy"

mongoose.connect "mongodb://#{config.db.host}/#{config.db.name}"

app.listen 3000
console.log "iggy started: application listening on port: #{config.port}"
