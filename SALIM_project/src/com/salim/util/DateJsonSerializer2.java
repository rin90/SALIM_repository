package com.salim.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

public class DateJsonSerializer2 extends JsonSerializer<Date> {

	@Override
	//Date -> "yyyy년 MM월 dd일"
	public void serialize(Date date, JsonGenerator gen, SerializerProvider provider)
			throws IOException, JsonProcessingException {
		String dateStr = new SimpleDateFormat("yyyy년 MM월 dd일").format(date);
		gen.writeString(dateStr);
		
	}

	
}
