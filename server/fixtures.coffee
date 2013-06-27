if App.Posts.find().count() is 0
  App.Posts.insert
    title: "Introducing Telescope"
    author: "Sacha Greif"
    url: "http://www.google.com"

  App.Posts.insert
    title: "Meteor"
    author: "Tom Coleman"
    url: "http://meteor.com"

  App.Posts.insert
    title: "The Meteor Book"
    author: "Tom Coleman"
    url: "http://themeteorbook.com"

