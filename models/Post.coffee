require 'coffee-script'
mongoose = require 'mongoose'
{Schema} = require 'mongoose'

Tag = new Schema
  name: String

Post = new Schema
  title: String
  slug: String
  body: String
  created_at: Date
  modified_at: Date
  tags: [Tag]
  status:
    type: String
    enum: [
      # available statuses for posts
      "Live"
      "Edited"
      "Draft"
      "Hidden"
      "Sticky"
    ]

module.exports = mongoose.model 'Post', Post