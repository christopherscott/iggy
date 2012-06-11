require 'coffee-script'
Post = require '../models/Post'

module.exports = (app) ->

  app.get '/posts', (req, res) ->
    Post.find {}, (err, posts) ->
      throw err if err
      res.format
        html: () ->
          res.render 'posts/index', {posts}
        json: () ->
          res.send posts
        
  app.get '/post/:slug', (req, res) ->
    slug = req.params.slug
    Post.findOne {slug}, (err, post) ->
      throw err if err
      res.format
        html: () ->
          res.render 'posts/show', {post}
        json: () ->
          res.send post

  app.post '/posts', (req, res) ->
    