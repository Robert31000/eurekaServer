package com.example.proyectoSW1backend;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class proyectoSW1backend {
    public static void main(String[] args) {
        SpringApplication.run(proyectoSW1backend.class, args);
    }
}
