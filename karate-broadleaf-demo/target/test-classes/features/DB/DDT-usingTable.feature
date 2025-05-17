Feature: Login Tests

Scenario Outline: Test login with multiple users
  Given url 'https://api.example.com/login'
  And request { username: '<user>', password: '<pass>' }
  When method post
  Then status 200

Examples:
  | user   | pass     |
  | admin  | admin123 |
  | test   | test123  |
