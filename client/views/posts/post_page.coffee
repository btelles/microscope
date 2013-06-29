Template.postPage.helpers
  currentPost: ->
    App.Posts.findOne(Session.get('currentPostId'))
