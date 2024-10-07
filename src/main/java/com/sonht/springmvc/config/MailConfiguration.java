package com.sonht.springmvc.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfiguration {
	
	@Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername("sonhtfx17102@funix.edu.vn");
        mailSender.setPassword("Hts&30091992");

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        
        props.put("mail.smtp.starttls.enable", "true");
        //props.put("mail.debug", "true");
        props.put("mail.smtp.ssl.trust", "*");
        return mailSender;
    }

}
