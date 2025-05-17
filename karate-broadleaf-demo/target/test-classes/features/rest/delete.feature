Feature: Delete operations for cart and customer data

  Background:
    * url baseUrl
    * def cartId = '12345'
    * def paymentId = '501'
    * def addressName = 'Home'
    * def orderItemId = '901'

  Scenario: Delete customer address using address name
    Given path 'customer/address', addressName
    When method delete
    Then status 200

  Scenario: Delete order attributes using cartId
    Given path 'cart', cartId, 'attributes'
    When method delete
    Then status 200

  Scenario: Remove item from order using cartId and orderItemId
    Given path 'cart', cartId, 'items', orderItemId
    When method delete
    Then status 200

  Scenario: Remove all offer codes from order
    Given path 'cart', cartId, 'offercode'
    When method delete
    Then status 200

  Scenario: Remove payment from order using cartId and paymentId
    Given path 'cart', cartId, 'payment', paymentId
    When method delete
    Then status 200
