# ✅ 3. Retry Assertion (Simple)
Given url 'https://api.example.com/status'
And retry until response.status == 'completed'
When method get
Then status 200
#✅ 2. Retry Block with Delay
* def result = null
* def maxRetries = 5
* def count = 0
* def delayMs = 2000

* def fetchUntil = 
  """
  function() {
    while (count < maxRetries) {
      var res = karate.call('get-status.feature');
      if (res.response.status == 'ready') return res;
      java.lang.Thread.sleep(delayMs);
      count++;
    }
    return null;
  }
  """
* def result = fetchUntil()
* match result != null
# ✅ 1. Retry Until a Condition
Scenario: Retry until product status is ACTIVE
  * def getStatus = 
    """
    function() {
      var res = karate.call('get-product-status.feature');
      return res.response.status == 'ACTIVE';
    }
    """
  * retry until getStatus()
  * print 'Product is now ACTIVE!'

