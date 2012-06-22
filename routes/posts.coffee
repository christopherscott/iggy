require 'coffee-script'
Post = require '../models/Post'

module.exports = (app) ->

  app.get '/posts', (req, res) ->

    Post.find {}, (err, posts) ->
      throw err if err

      res.format
        html: -> res.render 'posts/index', {posts}
        json: -> res.send posts
        
  app.get '/post/:slug', (req, res) ->

    Post.findOne {slug: req.params.slug}, (err, post) ->
      throw err if err

      res.format
        html: -> res.render 'posts/show', {post}
        json: -> res.send post

  app.get '/post/edit/:slug', (req, res) ->

    Post.findOne {slug: req.params.slug}, (err, post) ->
      throw err if err

      res.format
        html: -> res.render 'posts/edit', {post}


  app.get '/posts/new', (req, res) ->
    res.render 'posts/new'
  
  
  app.post '/posts', (req, res) ->
    
    req.params

    new_post = Post.new
    new_post.title = "something"