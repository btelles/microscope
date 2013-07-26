if Posts.find().count() is 0

  now = new Date().getTime()

  tomId = Meteor.users.insert profile: name: 'Tom Coleman'
  tom = Meteor.users.findOne tomId

  sachaId = Meteor.users.insert profile: name: 'Sacha Gglief'
  sacha = Meteor.users.findOne sachaId

  telescopeId =  Posts.insert
    title: "Introducing Telescope"
    author: "Sacha Greif"
    url: "http://www.google.com"
    submitted: now - 7 * 3600 * 1000

  Comments.insert
    postId: telescopeId
    userId: tom._id
    author: tom.profile.name
    submitted: now - 5 * 3600 * 1000

  Comments.insert
    postId: telescopeId
    userId: sacha._id
    author: sacha.profile.name
    submitted: now - 3 * 3600 * 1000

  Posts.insert
    title: "Meteor"
    author: "Tom Coleman"
    url: "http://meteor.com"
    submitted: now - 10 * 3600 * 1000

  Posts.insert
    title: "The Meteor Book"
    author: "Tom Coleman"
    url: "http://themeteorbook.com"
    submitted: now - 12 * 3600 * 1000

