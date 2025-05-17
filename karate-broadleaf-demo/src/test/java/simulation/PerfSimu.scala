package simulations

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

class PerformanceSimulation extends Simulation {

  // Define protocol
  val protocol = karateProtocol(
    "/api/v1/catalog/categories" -> Nil
  )

  // Define scenario using your feature
  val getProducts = scenario("Performance - Get All Products")
    .exec(karateFeature("classpath:performance/get-all-products.feature"))

  // Setup load injection profile
  setUp(
    getProducts.inject(
      rampUsers(10).during(10),         // ramp up 10 users over 10 seconds
      constantUsersPerSec(5).during(30) // then 5 users/sec for 30 seconds
    ).protocols(protocol)
  )
}
