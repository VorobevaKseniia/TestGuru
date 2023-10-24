# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# CATEGORIES title
categories = Category.create!([
                                {title: 'HTML'},
                                {title: 'Ruby'},
                                {title: 'SQL'}
                              ])

# TESTS title, level
tests = Test.create!([
                       {title: 'Basics of HTML', level: 1, category_id: categories[0].id},
                       {title: 'Basics of Ruby', level: 2, category_id: categories[1].id},
                       {title: 'Basics of SQL', level: 2, category_id: categories[2].id}
                     ])

# USERS name, status
users = User.create!([
                       {name: 'Ivan', status: :user},
                       {name: 'Elene', status: :admin},
                       {name: 'Kate', status: :user}
                     ])
# USER_TESTS
us_tes = UserTest.create!(user_id: 1, test_id: 1)
us_tes2 = UserTest.create!(user_id: 1, test_id: 2)

# QUESTIONS body
questions = Question.create!([
                               {body: 'What tag is used to move to a new line?', test_id: 1},
                               {body: 'What does the attribute "href" contain?', test_id: 1},

                               {body: 'Which method allows to translate a string to lower case?', test_id: 2},
                               {body: 'What is the name of the most popular Ruby framework for the web?', test_id: 2},

                               {body: 'What query can be used to retrieve a list of all databases?', test_id: 3},
                               {body: 'Which keyword is used to cancel a transaction?', test_id: 3}
                             ])

# ANSWERS body, correct
answers = Answer.create!([
                           {body: '<br/>', question_id: 1},
                           {body: 'URL of the page to which the redirection will take place', question_id: 2},

                           {body: 'downcase()', question_id: 3},
                           {body: 'Rails', question_id: 4},

                           {body: 'SHOW DATABASES', question_id: 5},
                           {body: 'ROLLBACK', question_id: 6}
                         ])