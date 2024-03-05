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
                       {email: 'ivan@gmail.com', password: 'ivan11'},    # name: 'Ivan',
                       {email: 'elena@gmail.com', password: 'elena1'},  # name: 'Elene',
                       {email: 'kate@gmail.com', password: 'kate11'}     # name: 'Kate',
                     ])

# TESTS title, level
tests = Test.create!([
                       {title: 'Basics of HTML', level: 1, category_id: categories[0].id, author_id: users[1].id},
                       {title: 'Basics of Ruby', level: 2, category_id: categories[1].id, author_id: users[1].id},
                       {title: 'Basics of SQL', level: 2, category_id: categories[2].id, author_id: users[2].id}
                     ])


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
                           {body: '<br/>', correct: true,question_id: questions[0].id},
                           {body: '<p/>', question_id: questions[0].id},
                           {body: '<a/>', question_id: questions[0].id},
                           {body: 'URL of the page to which the redirection will take place', correct: true, question_id: questions[1].id},

                           {body: 'downcase()', correct: true, question_id: questions[2].id},
                           {body: 'Rails', correct: true, question_id: questions[3].id},

                           {body: 'SHOW DATABASES', correct: true, question_id: questions[4].id},
                           {body: 'ROLLBACK', correct: true, question_id: questions[5].id}
                         ])