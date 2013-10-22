role = Role.where(name: "admin").first_or_create
User.where(email: "admin@example.com")
    .first_or_create(name: "Admin", password: "123456", role_id: role.id)
