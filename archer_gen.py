import random

# List of first names
first_names = ['John', 'Emily', 'Michael', 'Sarah', 'David', 'Olivia', 'Daniel', 'Emma', 'William', 'Sophia',
               'James', 'Ava', 'Benjamin', 'Isabella', 'Matthew', 'Mia', 'Andrew', 'Abigail', 'Joseph', 'Elizabeth',
               'Christopher', 'Avery', 'Joshua', 'Ella', 'Alexander', 'Natalie', 'Nicholas', 'Grace', 'Tyler', 'Chloe',
               'Brandon', 'Aubrey', 'Jacob', 'Lillian', 'Ryan', 'Zoey', 'Adam', 'Hannah', 'Dylan', 'Amelia',
               'Samuel', 'Addison', 'Isaac', 'Harper', 'Nathan', 'Lila', 'Ethan', 'Evelyn', 'Anthony', 'Aria']

# List of last names
last_names = ['Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Moore', 'Taylor',
              'Anderson', 'Thomas', 'Jackson', 'White', 'Harris', 'Martin', 'Thompson', 'Garcia', 'Martinez', 'Robinson',
              'Clark', 'Rodriguez', 'Lewis', 'Lee', 'Walker', 'Hall', 'Allen', 'Young', 'Hernandez', 'King',
              'Wright', 'Lopez', 'Hill', 'Scott', 'Green', 'Adams', 'Baker', 'Gonzalez', 'Nelson', 'Carter',
              'Mitchell', 'Perez', 'Roberts', 'Turner', 'Phillips', 'Campbell', 'Parker', 'Evans', 'Edwards', 'Collins']

# List of genders
genders = ['Male', 'Female']

# Open the file for writing
with open('archerdata.txt', 'w') as file:
    for i in range(100, 600):
        first_name = random.choice(first_names).capitalize()
        last_name = random.choice(last_names).capitalize()
        age = random.randint(18, 65)
        gender = random.choice(genders)

        sql_command = f"INSERT INTO archer VALUES ('{i}', '{first_name}', '{last_name}', {age}, '{gender}');"
        file.write(sql_command + '\n')

print("SQL commands generated and saved to 'archerdata.txt'")