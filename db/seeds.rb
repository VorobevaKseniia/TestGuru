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
# USERS name, status
users = User.create!([
                       {name: 'Ivan', status: :user},
                       {name: 'Elene', status: :admin},
                       {name: 'Kate', status: :user}
                     ])

# TESTS title, level
tests = Test.create!([
                       {title: 'Basics of HTML', level: 1, category_id: categories[0].id, author_id: users[1].id},
                       {title: 'Basics of Ruby', level: 2, category_id: categories[1].id, author_id: users[1].id},
                       {title: 'Basics of SQL', level: 2, category_id: categories[2].id, author_id: users[2].id}
                     ])


# USER_TESTS
us_tes = UserTest.create!(user_id: users[0].id, test_id: tests[0].id)
us_tes2 = UserTest.create!(user_id: users[0].id, test_id: tests[1].id)

# QUESTIONS body
questions = Question.create!([
                               {body: 'What tag is used to move to a new line?', test_id: tests[0].id},
                               {body: 'What does the attribute "href" contain?', test_id: tests[0].id},

                               {body: 'Which method allows to translate a string to lower case?', test_id: tests[1].id},
                               {body: 'What is the name of the most popular Ruby framework for the web?', test_id: tests[1].id},

                               {body: 'What query can be used to retrieve a list of all databases?', test_id: tests[2].id},
                               {body: 'Which keyword is used to cancel a transaction?', test_id: tests[2].id}
                             ])

# ANSWERS body, correct
answers = Answer.create!([
                           {body: '<br/>', question_id: questions[0].id},
                           {body: '<p/>', question_id: questions[0].id},
                           {body: '<a/>', question_id: questions[0].id},
                           {body: 'URL of the page to which the redirection will take place', question_id: questions[1].id},

                           {body: 'downcase()', question_id: questions[2].id},
                           {body: 'Rails', question_id: questions[3].id},

                           {body: 'SHOW DATABASES', question_id: questions[4].id},
                           {body: 'ROLLBACK', question_id: questions[5].id}
                         ])