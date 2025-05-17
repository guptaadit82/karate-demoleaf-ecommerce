# Step 1: Get Token
Given url 'https://api.example.com/login'
And request { username: 'admin', password: 'admin123' }
When method post
Then status 200
* def token = response.token

# Step 2: Use Token
Given url 'https://api.example.com/data'
And header Authorization = 'Bearer ' + token
When method get
Then status 200
