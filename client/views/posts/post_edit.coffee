Template.postEdit.helpers
  post: ->
    App.Posts.findOne Session.get('currentPostId')

Template.postEdit.events
  'submit form': (e) ->
    e.preventDefault()

    currentPostId = Session.get 'currentPostId'

    form = $(e.target)

    postProperties =
      url: form.find('[name=url]').val()
      title: form.find('[name=title]').val()

    App.Posts.update currentPostId, $set: postProperties, (error) ->
      if error
        #display the error to the user
        alert error.reason
      else
        Meteor.Router.to 'postPage', currentPostId

  'click .delete': (e) ->
    e.preventDefault()

    if confirm 'Delete this post?'
      currentPostId = Session.get 'currentPostId'
      App.Posts.remove currentPostId
      Meteor.Router.to 'postsList'
