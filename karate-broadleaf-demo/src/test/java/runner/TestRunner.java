package runner;

// import org.junit.jupiter.api.BeforeAll;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
    /*@BeforeAll
    static void beforeAll() {
        MockServerRunner.startMock();
    }*/

    @Karate.Test
    Karate testAll() {
         return Karate.run("classpath:features/rest/getProducts.feature");
    }
}
