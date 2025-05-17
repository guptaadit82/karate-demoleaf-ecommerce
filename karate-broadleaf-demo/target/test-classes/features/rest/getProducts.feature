Feature: Get All Products

  Background:
    * url 'https://demo.broadleafcommerce.org'

  Scenario: Get All Products from catalog
    * def endpoint = 'api/v1/catalog/categories'
    Given path endpoint
    When method get
    Then status 200
    And match responseType =='json'
    And match response.categories[0].id ==2001
    And match response.categories[0].Products[0].name =="#notpresent"

  Scenario: Get Customer details via email as param
    * def endpoint2 = 'api/v1/customer'
    Given path endpoint2
    And param email = 'happytiwary8@gmail.com'
    When method get
    Then status 200
    And match responseType =='json'
    # And match response.messages[0].messageKey == 'customerEmailNotFound'

    Scenario: Get catalog details by productId
      Given path 'api', 'v1', 'catalog', 'product', '1250'
      When method get
      Then status 404
      And match responseType == 'json'
      And match response.messages[0].messageKey == 'productNotFound'

    Scenario: Get search results by Query
      Given path 'api', 'v1', 'catalog', 'search'
      When param q = 'mobile'
      When method get
      Then status 200
      And match responseType == 'json'
      And match response.page == 1




