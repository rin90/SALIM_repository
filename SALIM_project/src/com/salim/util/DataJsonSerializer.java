package com.salim.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

public class DataJsonSerializer extends JsonSerializer<Date> {

	@Override
	public void serialize(Date date, JsonGenerator gen, SerializerProvider provider)
			throws IOException, JsonProcessingException {
		// 영어의 a~z까지의 문자(대소문자 모두 해당)는 패턴문자로 인식하기 때문에 사용할 때 ''으로 감싸야 한다.
		String dateStr = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm").format(date);	
		gen.writeString(dateStr);
	}
	
}
