package com.salim.util;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

/*
 * MappingJackson2HttpMessageConverter(<mvc:annotation-driven/>이 등록해주는 bean>
 * -> VO -> JO(자바스크립트 객체 형태 - ({ })), List/배열 - Javascript배열형태([ ])
 * 
 * JsonSerializer - 특정 property(instance변수)의 값을 JSON변환시 원하는 형태의 문자열로 변환처리하는 Bean.(Jackson API에서 제공)
 * 	ex) 기본 - java.util.Date -> 밀리초
 * 			 Date - yyyy-MM-dd : 이런 형태로 바꾸고 싶으면 이런 형태로 변환하는 JsonSerializer클래스를 구현.
 * 
 * Date -> 밀리초, 정수 -> 정수 등 이런 형태가 싫으면 너가 원하는 형태대로 만들어서 쓰거라. 이 작업을 해주는 것이 JsonSerializer임. property와 관련. 
 * 
 * 1. JsonSerializer<T> 상속. T : 변환할 타입 지정. serialize() 메소드 재정의(오버라이딩)
 * 
 * 2. Instance 변수에 @JsonSerializer 어노테이션 추가. 속성을 이용해 이 클래스를 변환기로 등록.
 */
public class DateJsonSerializer extends JsonSerializer<Date>{//아작스 사용시 자바스크립트 객체 형태로 바꿀 때 원하는 형태로 출력하기 위해서 json에서 제공.
	/*
	 * 매개변수
	 * 1. 변환할 Data - 처리할 데이터를 JsonGenerator를 이요해서 변환처리 해줌.
	 * 2. 변환된 Data를 출력해 주는 메소드 제공 객체.
	 * 3. 기존 변환처리 객체가 있는 경우 제공받는 변수. - 거의 쓸 일이 없음.
	 */
	public void serialize(Date date, JsonGenerator gen, SerializerProvider Provider) throws IOException, JsonProcessingException{
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
		String dateStr = sdf.format(date);
		
		gen.writeString(dateStr);//내가 원하는 형태로 변환된 값을 출력해줌.
	}
	
}
