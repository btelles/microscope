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
        throwError error.reason

        if error.error == 302
          Meteor.Router.to 'postPage', error.details
        else
          Meteor.Router.to('postsList')
