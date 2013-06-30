Template.postSubmit.events
  'submit form': (e) ->
    e.preventDefault()

    form = $(e.target)
    post = 
      url: form.find('[name=url]').val()
      title: form.find('[name=title]').val()
      message: form.find('[name=message]').val()

    Meteor.call 'post', post, (error, id) ->
      if error
        return alert alert error.reason
    Meteor.Router.to('postsList')
