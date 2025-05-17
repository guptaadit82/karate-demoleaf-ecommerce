Feature: Using Mock Server

Background:
  * url 'http://localhost:8081'

Scenario: Call mock GET /api/products
  Given path '/api/products'
  When method get
  Then status 200
  And match response[0].name == 'Hot Sauce'
