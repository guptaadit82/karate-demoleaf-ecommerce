Feature: Image Comparison with Karate

Scenario: Compare product image with base image 
  * configure driver = { type: 'chromium', headless: false ,show: true}

  Given driver 'https://demo.broadleafcommerce.org/'
  * delay(2000)
  
  # Take a screenshot of the logo and compare it with a baseline image
  * def logo = locate("//*[@id='sectionsNav']/div/div[2]/a/img")
  * screenshot(logo, 'target/logo-current.png')

  # Compare screenshot with baseline
   * def result = karate.imageCompare('classpath:baseline/logo.png', 'target/logo-current.png', 'target/logo-diff.png')
  * match result.pass == true
  # run -- mvn test -Dtest=ImageComparison
