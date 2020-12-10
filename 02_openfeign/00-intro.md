## Overview
* Incremento utilizzo architetture a micro-servizi
* REST <!-- .element: class="fragment" --> 
  * HTTP e Json <!-- .element: class="fragment" --> 
* SOAP <!-- .element: class="fragment" --> 
 * (scusate se esisto ancora...) <!-- .element: class="fragment" -->



## Client HTTP "tradizionali"



### [Java URL class](https://mkyong.com/webservices/jax-rs/restfull-java-client-with-java-net-url/)

Solo GET e POST
```java
URL url = new URL("http://localhost:8080/RESTfulExample/json/product/get");
HttpURLConnection conn = (HttpURLConnection) url.openConnection();
conn.setRequestMethod("GET");
conn.setRequestProperty("Accept", "application/json");

if (conn.getResponseCode() != 200) {
    throw new RuntimeException("Failed : HTTP error code : "
            + conn.getResponseCode());
}

BufferedReader br = new BufferedReader(new InputStreamReader(
    (conn.getInputStream())));

String output;
System.out.println("Output from Server .... \n");
while ((output = br.readLine()) != null) {
    System.out.println(output);
}

conn.disconnect();
```




### Apache HTTP Client

Necessario costruire prima l'oggetto Client<br> come minimo...
```java
private CloseableHttpClient buildHttpClient() {
    PoolingHttpClientConnectionManager connectionManager = new PoolingHttpClientConnectionManager();
    connectionManager.setMaxTotal(config.getMaxConnection() <= 0 ? 30 : config.getMaxConnection());
    connectionManager.setDefaultMaxPerRoute(config.getMaxConnectionPerRoute() <= 0 ? 30 : config.getMaxConnectionPerRoute());

    CacheConfig cacheConfig = CacheConfig.custom()
            .setMaxCacheEntries(1000)
            .setMaxObjectSize(16384)
            .setHeuristicCachingEnabled(false)
            .build();

    return CachingHttpClients.custom()
            .setCacheConfig(cacheConfig)
            .setConnectionManager(connectionManager)
            .setDefaultRequestConfig(requestConfig(currentTimeout()))
            .setDefaultCookieStore(cookieStore)
            .build();
}
```
Ok... sto esagerando 😅 <!-- .element: class="fragment" -->



### Apache HTTP Client

https://hc.apache.org/httpcomponents-client-5.0.x/quickstart.html
```java
try (CloseableHttpClient httpclient = HttpClients.createDefault()) {
    HttpGet httpGet = new HttpGet("http://httpbin.org/get");
    try (CloseableHttpResponse response1 = httpclient.execute(httpGet)) {
        HttpEntity entity1 = response1.getEntity();
        // do something useful with the response body
        // and ensure it is fully consumed
        if (entity != null) {
            String result = EntityUtils.toString(entity);
            System.out.println(result);
        }
    }
```
https://mkyong.com/java/apache-httpclient-examples/



### Spring RestTemplate class

https://www.baeldung.com/rest-template
```java
RestTemplate restTemplate = new RestTemplate();
String fooResourceUrl = "http://localhost:8080/spring-rest/foos";
ResponseEntity<String> response
  = restTemplate.getForEntity(fooResourceUrl + "/1", String.class);
assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
```



### Spring 5 WebClient (the new RestTemplate)

https://www.baeldung.com/spring-5-webclient
```java
WebClient.RequestHeadersSpec<?> requestSpec2 = WebClient
  .create("http://localhost:8080")
  .post()
  .uri(URI.create("/resource"))
  .body(BodyInserters.fromObject("data"));

WebClient.RequestBodySpec uri2 = client3
  .post()
  .uri(URI.create("/resource"));
```



### Java11 HttpClient

```java
HttpRequest request = HttpRequest.newBuilder()
        .GET()
        .uri(URI.create("https://httpbin.org/get"))
        .setHeader("User-Agent", "Java 11 HttpClient Bot")
        .build();

HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

// print response headers
HttpHeaders headers = response.headers();
headers.map().forEach((k, v) -> System.out.println(k + ":" + v));

// print status code
System.out.println(response.statusCode());

// print response body
System.out.println(response.body());
```



### Mentre in javascript...
```js
fetch('http://example.com/movies.json')
  .then(response => response.json())
  .then(data => console.log(data));

fetch('https://api.github.com/gists', {
    method: 'post',
    body: JSON.stringify(opts)
  }).then(function(response) {
    return response.json();
  })
```



Tutto questo induce il 

_povero programmatore java_ 

a questo stato

<img src="urlo-munch.jpg" height="350"> <!-- .element: class="fragment" -->



### Cambiamo approccio....

#### Passiamo al dichiarativo


Siamo ormai bravissimi a creare endpoint in maniera dichiarativa
utilizzando annotations:<!-- .element: class="fragment" -->
* JAX-RS <!-- .element: class="fragment" -->
* Spring MVC <!-- .element: class="fragment" -->

Non neghiamolo: le Servlet<br>ce le siamo dimenticate 😬 <!-- .element: class="fragment" -->  
