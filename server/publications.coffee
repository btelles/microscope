Meteor.publish 'posts', ->
  App.Posts.find {},
    fields:
      author: false
