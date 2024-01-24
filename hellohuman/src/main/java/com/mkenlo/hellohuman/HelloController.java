package com.mkenlo.hellohuman;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
public class HelloController {
    @RequestMapping("/")
    public String index(@RequestParam(value="name", required = false) String firstname, @RequestParam(value="last_name", required = false) String lastname, @RequestParam(required = false) Integer times){
        StringBuilder greeting = new StringBuilder();
        int n = Objects.requireNonNullElse(times, 1);
        for(int i=1; i<=n ;i++) {
            greeting.append("Hello");
            greeting.append(" ");
            greeting.append(Objects.requireNonNullElse(firstname, "Human"));
            greeting.append(" ");
            if (lastname != null) greeting.append(lastname);
        }

        return greeting.toString();
    }
}
