## Moduli
* Databases Modules <!-- .element: class="fragment" -->
    * tra cui PostgreSQL, OracleXE, MongoDB <!-- .element: class="fragment" -->
* Modulo di Docker Compose <!-- .element: class="fragment" -->
* Modulo Mockserver <!-- .element: class="fragment" -->
* E molti altri <!-- .element: class="fragment" -->
Note: Testcontainer ci fornisce diversi moduli attraverso cui è possibile dei creare dei container specifici



## Database modules
```java
@Testcontainers
public class DatabaseTest {

    @Container
    public PostgreSQLContainer postgreSQLContainer = 
            new PostgreSQLContainer("postgres:11.1")
                    .withDatabaseName("integreation-tests-db")
                    .withUsername("sa")
                    .withPassword("sa");

    @Test
    public void testContainer() {
        assertTrue(postgreSQLContainer.isRunning());
    }
}
```



## Docker Compose modules
```java
public static final String SERVICE_NAME = "postgres_1";
public static final int SERVICE_PORT = 5432;

public String pg_url;

@Container
public DockerComposeContainer environment = 
    new DockerComposeContainer(new File("src/test/resources/compose-test.yml"))
        .withExposedService(SERVICE_NAME, SERVICE_PORT,
            Wait.forLogMessage(".*database system is ready to accept connections.*", 2)
                .withStartupTimeout(Duration.ofSeconds(60)));

@BeforeEach
public void setup() {
    pg_url = environment.getServiceHost(SERVICE_NAME, SERVICE_PORT);
    pg_url += ":";
    pg_url += environment.getServicePort(SERVICE_NAME, SERVICE_PORT);
}

@Test
public void testIsRunning() {
    var serviceState = environment.getContainerByServiceName(SERVICE_NAME).get();
    assertTrue(serviceState.isRunning());
}
```
Note: Visto che al nostro test potrebbero servire più di un applicativo attivo in contemporanea, Testcontainers ci fornisce un modo per usare un docker-compose.yml in modo da gestire più di un servizio alla volta in modo facile.




## Mock Server module
```java
@Container
public MockServerContainer mockserver = new MockServerContainer(TestImages.MOCKSERVER_IMAGE);

@Test
public void test() throws IOException {
    MockServerClient client = new MockServerClient(mockserver.getHost(), mockserver.getServerPort());

    String expectedBody = "Hello world!";

    client.when(request().withPath("/hello"))
            .respond(response().withBody(expectedBody));

    assertThat(SimpleHttpClient.responseFromMockserver(mockserver, "/hello")).isEqualTo(expectedBody);
}
```
Note: Mock Server can be used to mock HTTP services by matching requests against user-defined expectations



## Vediamo qualche esempio pratico