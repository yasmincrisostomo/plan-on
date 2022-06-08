User.destroy_all

Trait.destroy_all

Trait.create!(name: "Concentração", message: "Fique longe de distrações!")

Trait.create!(name: "Constância", message: "Melhore!")

Trait.create!(name: "Motivação", message: "Melhore!")

Trait.create!(name: "Organização", message: "Melhore!")

Trait.create!(name: "Descanso", message: "Melhore!")

Trait.create!(name: "Equilíbrio emocional", message: "Melhore!")

Trait.create!(name: "Qualidade do material", message: "Melhore!")

User.create!(email: 'alguem@email.com', password: '123123', name: 'Alguem', type_of_student: 'Folgado')

Container.create!(card_category: "To be", user_id: 1)
Container.create!(card_category: "Not to be", user_id: 1)

Card.create!(title: "Coisa 1", description: "lalala", position: 1, container_id: 1)
Card.create!(title: "Coisa 2", description: "lalala", position: 2, container_id: 1)
Card.create!(title: "Coisa A", description: "lalala", position: 1, container_id: 2)
Card.create!(title: "Coisa B", description: "lalala", position: 2, container_id: 2)
