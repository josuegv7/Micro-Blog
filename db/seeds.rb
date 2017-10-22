User.create([
  { id: 1,
    first: "Josue",
    last: "Guzman",
    email: "joseugv7@gmail.com",
    username: "josuegv7",
    password: "ruby1",
    profilepic: "http://media1.santabanta.com/full1/Outdoors/Landscapes/landscapes-342a.jpg"
  }
])

Source.create([
  { id: 1,
    title: "Learn Ruby",
    link: "https://www.codecademy.com/learn/learn-ruby",
    image: "https://www.tutorialspoint.com/ruby/images/ruby-mini-logo.jpg",
    text: "Ruby is a general purpose language that is still popular and in high demand in the marketplace, as it's more commonly used in Rails applications.",
    theme: "CS"
  },
  { id: 2,
    title: "Learn Javascript",
    link: "https://www.javascript.com/",
    image: "https://cdn-images-1.medium.com/max/1600/1*ot7tWiPCYC01pV0kGmK3qQ.png",
    text: "Learn JavaScript and stay connected with the latest news created and curated by the JavaScript community.",
    theme: "CS"
  },
  { id: 3,
    title: "Learn 3",
    link: "http://designhooks.com/wp-content/uploads/2016/04/html5-and-css3.png",
    image: "http://designhooks.com/wp-content/uploads/2016/04/html5-and-css3.png",
    text: "Learn how to create websites by structuring and styling your pages with HTML and CSS.",
    theme: "CS"
  }
  ])

Comment.create([
  {id: 1, comment: "GREAT"},
  {id: 2, comment: "Thanks"}
  ])
