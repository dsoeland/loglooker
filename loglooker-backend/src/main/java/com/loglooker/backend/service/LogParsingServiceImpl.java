package com.loglooker.backend.service;

import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

@Service
public class LogParsingServiceImpl implements LogParsingService {

    @Override
    public void parseLog(InputStream logStream, String fileName) {
        System.out.println("Parsing " + fileName);

        try (BufferedReader br = new BufferedReader(new InputStreamReader(logStream))) {
            String line;
            int lineNumber = 0;
            while((line = br.readLine()) != null) {
                lineNumber++;
                if(lineNumber <= 5) {
                    System.out.println("Read " + lineNumber + " line");
                }else if(lineNumber == 6) {
                    System.out.println("...(reading remaining lines)");
                }
                System.out.println("finished parsing log file " + fileName);
            }
        } catch (IOException e) {
            System.err.println("Error reading log file " + e.getMessage());
            e.printStackTrace();
        }
    }
}
