Feature: UI Testing for website

Scenario: Make registration 
    * configure driver = { type: 'chromium', show: true, timeout: 5000, highlight: true }
     Given driver 'https://demo.broadleafcommerce.org/'
    * driver.maximize()
    When click("//*[@id='sectionsNav']/div/div[1]/ul[2]/li[1]/a")
    And input("//*[@id='customer.emailAddress']","happytiwary8@gmail.com")
    And input("//*[@id='customer.firstName']","Happy")
    And input("//*[@id='customer.lastName']","tiwary")
    And input("//*[@id='password']","happy8")
    And input("//*[@id='passwordConfirm']","happy8")
    And click("//*[@id='registrationForm']/button")
    And click("//*[@id='sectionsNav']/div/div[1]/ul[2]/li[1]/a")
    And click("//*[@id='sectionsNav']/div/div[1]/ul[2]/li[1]/ul/li[2]/a")
    
    
    
    

Scenario: login & Find a Best Hot Sauce & Add to cart with checkout
    * configure driver = { type: 'chromium', show: true, timeout: 5000, highlight: true }
    Given driver 'https://demo.broadleafcommerce.org/'
    * driver.maximize()
    When click("//*[@id='sectionsNav']/div/div[1]/ul[2]/li[1]/a")
    And input("//*[@id='username']","happytiwary8@gmail.com")
    And input("//*[@id='password']","happy8")
    And click("//*[@id='login']/form/button")
    When click("//*[@id='left-nav']/ul/li[2]/a/span")
    And click("//*[@id='sort']/div/a/span/span")
    And click("//*[@id='sort']/div/ul/li[3]/a")
    And click("//*[@id='products']/div[2]/div/div[3]/h4/a")
    And click("//*[@id='product-main-button-panel']/div[1]/button/span")
    And click("//*[@id='sectionsNav']/div/div[1]/ul[2]/li[4]/ul/li[3]/a")
    And click("//*[@id='cart']/div[3]/div[1]/div[2]/div[5]/div[1]/a")
    * screenshot()
    Then match driver.url == 'https://demo.broadleafcommerce.org/cart'
