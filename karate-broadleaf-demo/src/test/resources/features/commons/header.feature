* def token = 'your-access-token-here'
Given url 'https://api.example.com/user'
And header Authorization = 'Bearer ' + token
When method get
Then status 200
