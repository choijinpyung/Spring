package boot.mvc.jpa3;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"mycar.data"})
@EntityScan("mycar.data") //dto 인식
@EnableJpaRepositories("mycar.data") //dao 인식
public class SpringBootJpa3Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootJpa3Application.class, args);
	}

}
