express = require 'express'
app = express()


app.use express.static "#{__dirname}/public"
app.set 'view engine', 'jade'

app.get '/', (req, res) ->
  res.render 'index',
    title: "Iggy"


app.listen 3000