Feature: Update order attributes using XML payload

  Background:
    * url 'https://demo.broadleafcommerce.org/api/v1'
    

  Scenario: Update order attributes for a cart using XML
    * def cartId = '125630'
    * def customerId = '789'
    * def orderAttributeXml =
    """
    <?xml version="1.0"?>
    <OrderAttributeWrapper>
      <id>1</id>
      <name>giftMessage</name>
      <orderId>1</orderId>
      <value>Happy Birthday!</value>
    </OrderAttributeWrapper>
    """
    
    Given path 'cart', cartId, 'attributes'
    And param cartId = cartId
    And param customerId = customerId
    And header Content-Type = 'application/xml'
    And request orderAttributeXml
    When method post
    Then status 405
    And match response.messages[0].messageKey == 'methodNotSupported'

    Scenario: Update quantity for a cart item
        * def cartId = '125630'
        * def itemId = '1010'
        * def quantity = '2'
        * def customerId = '789'
        Given path 'cart', cartId, 'items', itemId
        And param cartId = cartId
        And param itemId = itemId
        And param quantity = quantity
        And param customerId = customerId
        And header Content-Type = 'application/json'
        When method put
        Then status 404
        And match response.messages[0].messageKey == 'cartNotFound'

        

  Scenario: Update customer address by addressId
    * def addressId = '101'
    * def customerAddressWrapper =
    """
    <?xml version="1.0"?>
    <CustomerAddressWrapper>
      <address>
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
      </address>
      <addressName>string</addressName>
    </CustomerAddressWrapper>
    """
    Given path 'customer/address', addressId
    And header Content-Type = 'application/xml'
    And request customerAddressWrapper
    When method put
    Then status 200
    And match response contains '<message>Address updated successfully</message>'

   

  Scenario: Update customer payment by ID and customerId
    * def paymentId = '201'
    * def customerId = '301'
    * def customerPaymentWrapper =
    """
    <?xml version="1.0"?>
    <CustomerPaymentWrapper>
      <additionalFields>
        <key>string</key>
        <value>string</value>
      </additionalFields>
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
      <cardName>string</cardName>
      <cardType>string</cardType>
      <customer>
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
      </customer>
      <expirationDate>1970-01-01T00:00:00.001Z</expirationDate>
      <id>1</id>
      <isDefault>true</isDefault>
      <lastFour>string</lastFour>
      <paymentGatewayType>string</paymentGatewayType>
      <paymentToken>string</paymentToken>
      <paymentType>string</paymentType>
    </CustomerPaymentWrapper>
    """
    Given path 'customer/payment', paymentId
    And param customerId = customerId
    And header Content-Type = 'application/xml'
    And request customerPaymentWrapper
    When method put
    Then status 200
    And match response contains '<message>Payment updated successfully</message>'
