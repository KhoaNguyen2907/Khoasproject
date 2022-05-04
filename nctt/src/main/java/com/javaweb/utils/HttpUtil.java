package com.javaweb.utils;

import java.io.BufferedReader;
import java.io.IOException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class HttpUtil {
	String value;
public HttpUtil (String value) {
	this.value = value;
}
public static HttpUtil of(BufferedReader br) throws IOException {
	StringBuilder sb = new StringBuilder();
	String line = br.readLine();
	while ( line != null) {
	sb.append(line);
	line = br.readLine();
	} 
	return new HttpUtil(sb.toString());
}

public  <T> T toModel (Class<T> classT) {
	try {
		return new ObjectMapper().readValue(value,classT);
	} catch (JsonParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (JsonMappingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} return null;
}
}
