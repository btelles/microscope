this.App = {}
App.Posts = new Meteor.Collection('posts')

App.Posts.allow
  insert: (userId, doc) ->
    !!userId

Meteor.methods
  post: (postAttributes) ->
    user = Meteor.user()
    postWithSameLink = App.Posts.findOne url: postAttributes.url

    # ensure the user is logged in
    if !user
      throw new Meteor.Error(401, "you need to login to post new stories")

    # ensure the post has a title
    if !postAttributes.title
      throw new Meteor.Error(422, "Please iff in a headline")

    # check that there are no previous posts with the same link
    if postAttributes.url && postWithSameLink
      throw new Meteor.Error 302,
        'This link has already been posted',
        postWithSameLink._id

    # pick out the whitelisted keys
    post = _.extend _.pick(postAttributes, 'url', 'message'),
      title: postAttributes.title + (if @isSimulation then '(client)' else '(server)')
      userId: user._id
      author: user.username
      submittted: new Date().getTime()

    if ! @isSimulation
      Future = Npm.require 'fibers/future'
      future = new Future()
      Meteor.setTimeout ->
        future.ret()
      , 5 * 1000
      future.wait()

    App.Posts.insert post
