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
    rtype: "website",
    image: "https://www.tutorialspoint.com/ruby/images/ruby-mini-logo.jpg",
    text: "Ruby is a general purpose language that is still popular and in high demand in the marketplace, as it's more commonly used in Rails applications.",
    theme: "CS"
  }
  ])

Profile.create([
  { id: 1,
    posts: ["Learn Ruby", "Learn Javascript"]
  }
  ])
