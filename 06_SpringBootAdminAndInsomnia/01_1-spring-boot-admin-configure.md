<img src="https://raw.githubusercontent.com/codecentric/spring-boot-admin/master/images/logo-spring-boot-admin.png" height="100">

## Interactive Section

<div class="section-details">
<details>
<summary>How to configure SBA server ?</summary>
<p>
        
```
    <dependency>
        <groupId>de.codecentric</groupId>
        <artifactId>spring-boot-admin-starter-server</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
```

Add dependency and `@EnableAdminServer` annotation.
</p>
</details>

<details>
<summary>How to register Spring-boot application as client ?</summary>
<p>

We need to add SBA client dependency and a few application properties.
```
</dependency>
    <groupId>de.codecentric</groupId>
    <artifactId>spring-boot-admin-starter-client</artifactId>
</dependency>
```
```
spring.boot.admin.client.url=http://localhost:8081
management.endpoints.web.exposure.include=* #Attention in prod
```

</p>
</details>

<details>
<summary>Security methods ?</summary>
<p>

It can be implemented using Spring Security (e.g. Basic Auth, JWT, session based etc...).</br>
SBA provides easy injection for custom HTTP headers by adding *HttpHeadersProvider* bean.

</p>
</details>

<details>
<summary>How to register log file ?</summary>
<p>

By default, the logfile is not accessible via actuator endpoints and therefore not visible in Spring Boot Admin.
We need to configure `logging.file.path` or `logging.file.name` in properties.

</p>
</details>

<details>
<summary>How to add Java Management Extension (JMX) Bean Management ?</summary>
<p>

To interact with JMX-beans in the admin UI you have to include *Jolokia* in your application. <br/>
*Jolokia* is remote JMX with JSON over HTTP.
```
<dependency>
  <groupId>org.jolokia</groupId>
  <artifactId>jolokia-core</artifactId>
</dependency>
```
</p>
</details>

<details>
<summary>How to set Mail Notification ?</summary>
<p>

Mail notifications will be delivered as HTML emails rendered using [Thymeleaf](https://www.thymeleaf.org/) templates. To enable Mail notifications, configure a *JavaMailSender* using `spring-boot-starter-mail` and set a recipient.
```
#Gmail example
spring.mail.host=smtp.gmail.com
spring.mail.port=587
spring.mail.username=edemircan.inbox@gmail.com
spring.mail.password=*****
spring.mail.properties.mail.smtp.auth=true
spring.mail.properties.mail.smtp.starttls.enable=true
spring.mail.properties.mail.debug=true
spring.boot.admin.notify.mail.to=emre.demircan@manydesigns.com
spring.boot.admin.notify.mail.template=classpath:/templates/status-changed.html
```
</p>
</details>

<details>
<summary>How to set Slack Notification ?</summary>
<p>

We need to add an incoming Webhook under custom integrations on your [Slack](https://slack.com/) account
```
spring.boot.admin.notify.slack.enabled=true
spring.boot.admin.notify.slack.webhook-url=https://hooks.slack.com/services/....
```
</p>
</details>

<details>
<summary>Custom Notifiers ?</summary>
<p>

We can add our own Notifiers by adding Spring Beans which implement the `Notifier` interface.

</p>
</details>

<details>
<summary>How to enable Clustering with Hazelcast ?</summary>
<p>

It is automatically enabled when a HazelcastConfig- or HazelcastInstance-Bean is present. 
```
<dependency>
    <groupId>com.hazelcast</groupId>
    <artifactId>hazelcast-spring</artifactId>
</dependency>
```

```java
@Bean
public Config hazelcastConfig() {
    MapConfig mapConfig = new MapConfig("spring-boot-admin-event-store").setInMemoryFormat(InMemoryFormat.OBJECT)
            .setBackupCount(1);
    mapConfig.getEvictionConfig().setEvictionPolicy(EvictionPolicy.NONE);
    return new Config().setProperty("hazelcast.jmx", "true").addMapConfig(mapConfig);
}
```
</p>
</details>

<details>
<summary>How to extend SBA UI ?</summary>
<p>

* It is possible to add custom views to the ui. The views must be implemented as [Vue.js](https://vuejs.org/) components.
* SBA supports custom endpoint calls via axios. 

More info can be found in [documentation](https://codecentric.github.io/spring-boot-admin/2.5.1/#customizing-custom-views)

</p>
</details>

</div>


