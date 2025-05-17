Feature: Data-Driven from CSV

Scenario Outline: Test login
  * def users = karate.read('classpath:data/users.csv')
  * def user = users[__row]
  Given url 'https://api.example.com/login'
  And request { username: '#(user.user)', password: '#(user.pass)' }
  When method post
  Then status 200

Examples:
  | __row |
  | 0     |
  | 1     |
