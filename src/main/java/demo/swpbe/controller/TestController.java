package demo.swpbe.controller;

import demo.swpbe.dto.Response;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/")
    public ResponseEntity get(){
        Response response = new Response();
        response.setName("SWP");
        return ResponseEntity.ok(response);
    }
}
