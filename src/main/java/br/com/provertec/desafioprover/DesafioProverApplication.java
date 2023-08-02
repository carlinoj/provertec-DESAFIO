package br.com.provertec.desafioprover;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages = "br.com.provertec.desafioprover")
public class DesafioProverApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(DesafioProverApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(DesafioProverApplication.class, args);
	}

}
