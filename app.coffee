require 'coffee-script'

express = require 'express'
mongoose = require 'mongoose'
config = require './config'

app = express()

app.use express.static "#{__dirname}/public"
app.set 'view engine', 'jade'

require('./routes/posts')(app)

app.get '/', (req, res) ->
  res.render 'index',
    title: "Iggy"

mongoose.connect "mongodb://#{config.db.host}/#{config.db.name}"

app.listen 3000
console.log 'app listening on 3000'
