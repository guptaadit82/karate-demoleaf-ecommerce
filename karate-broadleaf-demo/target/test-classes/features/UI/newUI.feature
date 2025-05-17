Feature: Advanced UI Automation Scenarios on Broadleaf Commerce Demo

  Background:
    # Configure the browser once
    * configure driver = { type: 'chromedriver', show: true, timeout: 10000, highlight: true }
    * driver 'https://demo.broadleafcommerce.org/'
    * driver.maximize()

  Scenario: Basic navigation and history
    # Click Hot Sauces, then navigate back and forward, then refresh
    When click("css=nav#sectionsNav ul.main-menu li a[href='/hot-sauces']")
    Then waitForUrl('/hot-sauces')
    And driver.back()
    Then waitForUrl('/') 
    And driver.forward()
    Then waitForUrl('/hot-sauces')
    And driver.refresh()
    Then waitFor("css=div.product-item").exists

  Scenario: Open a product in new tab and switch back
    # Open first product in a new window
    When script(read('classpath:helpers/openNewTab.js'), "css=div.product-item:nth-child(1) a") 
    # Karate helper openNewTab.js uses window.open(...)
    Then driver.switchWindow(1)
    Then match driver.url contains '/product'
    And driver.switchWindow(0)

  Scenario: Interacting with an iframe
    # Navigate to a page with iframe (hypothetical demo)
    Given driver 'https://demo.broadleafcommerce.org/iframe-demo'
    When waitFor("css=iframe#promo-frame").exists
    And driver.switchFrame("promo-frame")
    Then waitFor("css=button#claim-offer").exists
    And click("css=button#claim-offer")
    And driver.switchParent()

  Scenario: Form submission, input-file, clear and cookies
    # Go to profile update page
    Given driver 'https://demo.broadleafcommerce.org/login'
    And input("css=input[name='username']", "demo")
    And input("css=input[name='password']", "Password123!")
    And click("css=button[type='submit']")
    Then waitFor("css=nav#sectionsNav li a[href='/profile']").exists
    And driver.clearCookies()
    And driver.clearCache()
    # Upload avatar
    Given driver 'https://demo.broadleafcommerce.org/profile'
    # When inputFile("css=input[type='file']","classpath:images/avatar.png")
    And click("css=button#uploadAvatar")
    Then waitForText("Avatar uploaded successfully")

  Scenario: waits, retry, delay, exists with position
    # Demonstrate various waiting helpers
    * retry until retry < 5  # pseudo-code: Karate’s retry block
      """
      function() {
        return __driver().locator("css=div.live-count").exists();
      }
      """
    * delay(2000)
    * waitFor("css=div.live-count")
    * waitForText("Live users:")
    * match locator("css=div.live-count").exists(0) == true

  Scenario: Capturing screenshot and PDF
    # On cart page
    Given driver 'https://demo.broadleafcommerce.org/cart'
    When waitFor("css=button#checkout").exists
    * screenshot('target/screenshots/cart-page.png')
    # Generate PDF of page
    * pdf('target/pdfs/cart-page.pdf')

  Scenario: Network intercept and recording
    # Intercept price API and assert modified response
    * configure intercept = true
    * driver.on('request', function(req){ if(req.url().includes('/api/catalog/products')){ req.continue(); } })
    Given driver 'https://demo.broadleafcommerce.org/hot-sauces'
    When click("css=div.product-item:nth-child(1) button[aria-label='Add to Cart']")
    Then match driver.locator("css=span.cart-count").text == '1'
    * recordVideo('target/videos/checkout-flow.mp4')

  Scenario: Final cleanup and close
    * driver.clearCookies()
    * driver.clearCache()
    * driver.close()
  Scenario: Interact with content inside an iframe
    # Navigate to a page containing the target iframe
    Given driver 'https://demo.broadleafcommerce.org/iframe-demo'
    * driver.maximize()

    # Wait for the iframe to be present, then switch context into it
    When waitFor("css=iframe#promo-frame").exists
    And driver.switchFrame("promo-frame")

    # Now you can interact with elements inside the iframe as usual
    Then waitFor("css=button#claim-offer").exists
    When click("css=button#claim-offer")
    Then match driver.locator("css=div.offer-confirmation").text contains 'Offer Claimed'

    # Always switch back to the main page context when done
    And driver.switchParent()
    Then match driver.url contains '/iframe-demo'
