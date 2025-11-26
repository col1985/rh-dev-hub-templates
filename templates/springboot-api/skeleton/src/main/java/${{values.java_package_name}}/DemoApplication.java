package ${{ values.group_id }}.${{ values.artifact_id }};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

@RestController
@SpringBootApplication
public class DemoApplication {

    // A simple class to represent the JSON object
    static class MyResponse {
        private String message;
        private int code;

        public MyResponse(String message, int code) {
            this.message = message;
            this.code = code;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public int getCode() {
            return code;
        }

        public void setCode(int code) {
            this.code = code;
        }
    }

    @GetMapping("/hello")
    public MyResponse getJson() {
				String msg = "Hello World!!";
        return new MyResponse(msg, 200);
    }

    @PostMapping("/hello")
    public MyResponse postJson(@RequestBody String payload) {
        return new MyResponse(payload, 201);
    }

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
}