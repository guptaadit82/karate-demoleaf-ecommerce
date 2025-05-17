Feature: GraphQL API Test

Scenario: Fetch products via GraphQL
  Given url 'https://api.spacex.land/graphql/'
  And header Content-Type = 'application/json'
  And request
    """
    {
      query: "query { launchesPast(limit: 2) { mission_name launch_date_local } }"
    }
    """
  When method post
  Then status 200
  And match response.data.launchesPast[0].mission_name != null
