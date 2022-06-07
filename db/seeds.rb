User.destroy_all

Trait.destroy_all

User.create!(email: 'alguem@email.com', password: '123123', name: 'Alguem', type_of_student: 'Folgado')

Trait.create!(name: "espiritualidade", message: "vai rezar")

Trait.create!(name: "saúde", message: "vai ao médico")



Container.create!(card_category: "To be", user_id: 1)
Container.create!(card_category: "Not to be", user_id: 1)

Card.create!(title:"Coisa 1", description:"lalala", position: 1, container_id: 1)
Card.create!(title:"Coisa 2", description:"lalala", position: 2, container_id: 1)
Card.create!(title:"Coisa A", description:"lalala", position: 1, container_id: 2)
Card.create!(title:"Coisa B", description:"lalala", position: 2, container_id: 2)
