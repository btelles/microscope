Template.postsList.helpers
  posts: ->
    App.Posts.find {},
      sort:
        submitted: -1
