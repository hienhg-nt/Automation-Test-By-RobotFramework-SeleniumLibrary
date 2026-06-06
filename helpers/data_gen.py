from faker import Faker

faker = Faker()

def generate_user():
    return {
        "first": faker.first_name(),
        "last": faker.last_name(),
        "email": faker.email(),
        "password": faker.password(length=8)
    }