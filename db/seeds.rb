User.destroy_all

Trait.destroy_all

Trait.create!(name: "Concentração", message: "Fique longe de distrações!")

Trait.create!(name: "Constância", message: "Melhore!")

Trait.create!(name: "Motivação", message: "Melhore!")

Trait.create!(name: "Organização", message: "Melhore!")

Trait.create!(name: "Descanso", message: "Melhore!")

Trait.create!(name: "Equilíbrio emocional", message: "Melhore!")

Trait.create!(name: "Qualidade do material", message: "Melhore!")

user = User.create!(email: 'alguem@email.com', password: '123123', name: 'Alguem', type_of_student: 'Folgado')

container1 = Container.create!(card_category: "To be", user: user)
container2 = Container.create!(card_category: "Not to be", user: user)

Card.create!(title: "Coisa 1", description: "lalala", position: 1, container: container1)
Card.create!(title: "Coisa 2", description: "lalala", position: 2, container: container1)
Card.create!(title: "Coisa A", description: "lalala", position: 1, container: container2)
Card.create!(title: "Coisa B", description: "lalala", position: 2, container: container2)
