User.destroy_all

Trait.destroy_all

Trait.create!(name: "Concentration", message: "Eliminate distractions.")

Trait.create!(name: "Consistency", message: "Isolate one goal.")

Trait.create!(name: "Motivation", message: "Review your progress.")

Trait.create!(name: "Organization", message: "Build a to-do list.")

Trait.create!(name: "Rest", message: "Give yourself time to disconnect.")

Trait.create!(name: "Emotional balance", message: "Be aware of your emotions.")

Trait.create!(name: "Material quality", message: "Find your method.")

user = User.create!(email: 'alguem@email.com', password: '123123', name: 'Alguem', type_of_student: 'Folgado')

container1 = Container.create!(card_category: "To be", user: user)
container2 = Container.create!(card_category: "Not to be", user: user)

Card.create!(title: "Coisa 1", description: "lalala", position: 1, container: container1)
Card.create!(title: "Coisa 2", description: "lalala", position: 2, container: container1)
Card.create!(title: "Coisa A", description: "lalala", position: 1, container: container2)
Card.create!(title: "Coisa B", description: "lalala", position: 2, container: container2)
