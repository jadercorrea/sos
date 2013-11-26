role = Role.where(name: "Admin").first_or_create
Role.where(name: "Colaborador").first_or_create
Role.where(name: "Cliente").first_or_create
User.where(email: "admin@example.com")
    .first_or_create(name: "Zod", password: "123456", role_id: role.id)
