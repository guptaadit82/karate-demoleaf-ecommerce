function fn() {
  var config = {
    baseUrl: 'https://demo.broadleafcommerce.org/api',
    browser:'chromium',
    show: true
  };

  // Example of setting a token dynamically (placeholder for future use)
  // var token = karate.callSingle('classpath:features/reusable/login.feature').token;
  // config.authToken = token;

  return config;
}
