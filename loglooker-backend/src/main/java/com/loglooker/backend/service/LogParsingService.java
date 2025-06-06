package com.loglooker.backend.service;

import java.io.InputStream;

public interface LogParsingService {
    void parseLog(InputStream logStream, String fileName);
}
