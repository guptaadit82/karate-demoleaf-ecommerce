Feature: Add Customer API

Background:
  * url 'https://demo.broadleafcommerce.org/api/v1'

Scenario: Add a new customer using CustomerWrapper
  * def customerXml =
  """
  <CustomerWrapper>
    <customerAttributes>
      <customerId>1</customerId>
      <id>1</id>
      <name>string</name>
      <value>string</value>
    </customerAttributes>
    <emailAddress>string</emailAddress>
    <firstName>string</firstName>
    <id>1</id>
    <lastName>string</lastName>
    <registered>true</registered>
  </CustomerWrapper>
  """

  Given path '/customer'
  And request customerXml
  And header Content-Type = 'application/xml'
  When method post
  Then status 400

  # Validate specific fields in the response if the response is XML
  And print response
  And match response.messages[0].messageKey == 'queryParameterNotReadable'

  Scenario: Change customer password using ChangePasswordForm
  * def passwordXml =
  """
  <ChangePasswordForm>
    <currentPassword>string</currentPassword>
    <newPassword>string</newPassword>
    <newPasswordConfirm>string</newPasswordConfirm>
  </ChangePasswordForm>
  """

  Given path '/customer/password'
  And request passwordXml
  And header Content-Type = 'application/xml'
  When method post
  Then status 400

  # Assert or log to ensure the response indicates success
  And print response
  And match response.messages[0].messageKey == 'invalidCustomerForPayment'

  Scenario: Create a new cart for a customer
  * def customerId = 1

  Given path '/cart'
  And param customerId = customerId
  And header Content-Type = 'application/json'
  When method post
  Then status 405

  # Assert the cart is created and customerId is linked
  And print response
  And match response.customerId == customerId
  And match response.active == true


  Scenario: Add order item to cart with cartId and customerId
  * def cartId = 1001
  * def customerId = 2001

  * def orderItemWrapper =
    """
    {
      "productId": 1,
      "skuId": 1,
      "quantity": 2,
      "orderId": 1,
      "name": "Sample Item",
      "retailPrice": {
        "amount": 10.0,
        "currency": "USD",
        "zero": false
      },
      "salePrice": {
        "amount": 8.5,
        "currency": "USD",
        "zero": false
      }
    }
    """

  Given path '/cart/{cartId}/items'
  And param cartId = cartId
  And param customerId = customerId
  And header Content-Type = 'application/json'
  And request orderItemWrapper
  When method post
  Then status 400

  # Assertions
  And print response
  And match response.orderItems[*].productId contains 1

  Scenario: Cart checkout 
  Given path '/checkout'
  And param cartId ='125630'
  When method post 
  Then status 404
  And match response.messages[0].messageKey =='cartNotFound'

  Scenario: Cart checkout 
     * def orderItemWrapper2 =
  """
  <?xml version="1.0" encoding="UTF-8"?>
  <OrderPaymentWrapper>
    <active>true</active>
    <amount>1.1</amount>
    <billingAddress>
      <addressLine1>string</addressLine1>
      <addressLine2>string</addressLine2>
      <addressLine3>string</addressLine3>
      <city>string</city>
      <companyName>string</companyName>
      <country>
        <abbreviation>string</abbreviation>
        <name>string</name>
      </country>
      <firstName>string</firstName>
      <id>1</id>
      <isBusiness>true</isBusiness>
      <isDefault>true</isDefault>
      <isoCountryAlpha2>
        <alpha2>string</alpha2>
        <name>string</name>
      </isoCountryAlpha2>
      <isoCountrySubdivision>string</isoCountrySubdivision>
      <lastName>string</lastName>
      <phoneFax>
        <id>1</id>
        <isActive>true</isActive>
        <isDefault>true</isDefault>
        <phoneNumber>string</phoneNumber>
      </phoneFax>
      <phonePrimary>
        <id>1</id>
        <isActive>true</isActive>
        <isDefault>true</isDefault>
        <phoneNumber>string</phoneNumber>
      </phonePrimary>
      <phoneSecondary>
        <id>1</id>
        <isActive>true</isActive>
        <isDefault>true</isDefault>
        <phoneNumber>string</phoneNumber>
      </phoneSecondary>
      <postalCode>string</postalCode>
      <state>
        <abbreviation>string</abbreviation>
        <name>string</name>
      </state>
      <stateProvinceRegion>string</stateProvinceRegion>
    </billingAddress>
    <currency>string</currency>
    <gatewayType>string</gatewayType>
    <id>1</id>
    <orderId>1</orderId>
    <referenceNumber>string</referenceNumber>
    <transactions>
      <additionalFields>
        <key>string</key>
        <value>string</value>
      </additionalFields>
      <amount>1.1</amount>
      <currency>string</currency>
      <customerIpAddress>string</customerIpAddress>
      <id>1</id>
      <orderPaymentId>1</orderPaymentId>
      <parentTransactionId>1</parentTransactionId>
      <rawResponse>string</rawResponse>
      <success>true</success>
      <type>string</type>
    </transactions>
    <type>string</type>
  </OrderPaymentWrapper>
  """
  Given path 'cart/checkout/payment'
  And param cartId ='125630'
  And header Content-Type = 'application/json'
  And request orderItemWrapper2 And header Content-Type = 'application/json'
  And request orderItemWrapper2
  When method post 
  Then status 404
  And match response.messages[0].messageKey == 'queryParameterNotReadable'
