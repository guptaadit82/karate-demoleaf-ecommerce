# 🧼 What is SOAP?
# SOAP (Simple Object Access Protocol) is a protocol used for accessing web services. It:

# Uses XML for request and response formats

# Relies on WSDL (Web Services Description Language) to describe the service

# Works over HTTP/HTTPS

# Is more strict/formal than REST 
# ✅ Step-by-Step Guide to Start SOAP API Testing in Karate
# 1. Understand the WSDL File
# WSDL is like a contract that tells what services/methods are available.

# Usually accessible at a URL like:
# https://<host>/service?wsdl

# Broadleaf Commerce primarily offers RESTful APIs for its microservices architecture. However, it does provide SOAP-based integrations for specific services, notably the CyberSource Tax Module. This module utilizes SOAP APIs to calculate taxes during the checkout process.

Feature: CyberSource Tax SOAP API Testing

  Scenario: Calculate Tax for Order

    # Define SOAP envelope as XML string
    * def requestBody = 
    """
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" 
                      xmlns:cyb="http://service.tax.module.cybersource.broadleafcommerce.org/">
       <soapenv:Header/>
       <soapenv:Body>
          <cyb:calculateTax>
             <!-- Add your order request here -->
             <orderRequest>
                <orderId>12345</orderId>
                <amount>99.99</amount>
                <!-- add any other fields depending on WSDL -->
             </orderRequest>
          </cyb:calculateTax>
       </soapenv:Body>
    </soapenv:Envelope>
    """

    Given url 'https://demo.broadleafcommerce.org/soap/services/cybersourcetax'
    And header Content-Type = 'text/xml;charset=UTF-8'
    And request requestBody
    When method post
    Then status 200
    And print response
    And match response contains '<return>'
    And match response == karate.contains('TaxResponse')
    