User.destroy_all

Trait.destroy_all

Trait.create!(name: "Concentration", message: "Fique longe de distrações!")

Trait.create!(name: "Constancy", message: "Melhore!")

Trait.create!(name: "Motivation", message: "Melhore!")

Trait.create!(name: "Organization", message: "Melhore!")

Trait.create!(name: "Rest", message: "Melhore!")

Trait.create!(name: "Emotional balance", message: "Melhore!")


Trait.create!(name: "Material quality", message: "Melhore!")

user = User.create!(email: 'alguem@email.com', password: '123123', name: 'Alguem', type_of_student: 'Folgado')

container1 = Container.create!(card_category: "To be", user: user)
container2 = Container.create!(card_category: "Not to be", user: user)

Card.create!(title: "Coisa 1", description: "lalala", position: 1, container: container1)
Card.create!(title: "Coisa 2", description: "lalala", position: 2, container: container1)
Card.create!(title: "Coisa A", description: "lalala", position: 1, container: container2)
Card.create!(title: "Coisa B", description: "lalala", position: 2, container: container2)
