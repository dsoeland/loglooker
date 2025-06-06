package com.loglooker.backend.controller;

import com.loglooker.backend.service.LogParsingService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;

@RestController
@RequestMapping("/api/logs")
public class LogUploadController {

    private final LogParsingService logParsingService;

    public LogUploadController(LogParsingService logParsingService) {
        this.logParsingService = logParsingService;
    }

    @PostMapping("/upload")
    public ResponseEntity upload(@RequestParam("file") MultipartFile file) {
        if(file.isEmpty()) {
            return ResponseEntity.badRequest().body("Please select a file");
        }
        try{
            String fileName = file.getOriginalFilename();
            InputStream inputStream = file.getInputStream();
            System.out.println("Received file: " + fileName);
            System.out.println("File size: " + file.getSize() + " bytes");
            System.out.println("Content Type: " + file.getContentType());
            return ResponseEntity.ok("File uploaded successfully" + fileName);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.internalServerError().body("File upload failed: " + e.getMessage());
        }
    }

}
