package com.hun.social.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;

import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
/**
 * 消息转换器，结合spring与fastjson，，
 * 在每个Controller中都有数据返回，，它们最后都被这个消息转换器，转为json。。。不对它会自动匹配返回的类型，然后确定那种类型返回json
 *
 *
 * @author hun
 * @Description: TODO
 * @date 2015年12月6日 下午8:38:59
 */
public class FastJsonHttpMessageConverter extends AbstractHttpMessageConverter<Object>{

	public final static Charset UTF8 = Charset.forName("UTF-8");
	private Charset charset = UTF8;
	private SerializerFeature[] serializerFeature;
	@Override
	protected Object readInternal(Class<? extends Object> arg0,
			HttpInputMessage arg1) throws IOException,
			HttpMessageNotReadableException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		InputStream in = arg1.getBody();
		byte[] buf = new byte[1024];
		for(;;){
			int len = in.read(buf);
			if(len == -1){
				break;
			}
			if(len>0){
				baos.write(buf, 0, len);
			}
		}
		byte[] bytes = baos.toByteArray();
		if(charset == UTF8){
			return JSON.parseObject(bytes, arg0);
		}else{
			return JSON.parseObject(bytes, 0, bytes.length,charset.newDecoder(),arg0);
		}
	}

	@Override
	protected boolean supports(Class<?> arg0) {
		
		return true;
	}

	@Override
	protected void writeInternal(Object obj, HttpOutputMessage outputMessage)
			throws IOException, HttpMessageNotWritableException {
		OutputStream out = outputMessage.getBody();
		byte[] bytes;

		if (charset == UTF8) {
			if (serializerFeature != null) {
				bytes = JSON.toJSONBytes(obj, serializerFeature);
			} else {
				bytes = JSON.toJSONBytes(obj, SerializerFeature.WriteDateUseDateFormat);
			}

		} else {
			String text;
			if (serializerFeature != null) {
				text = JSON.toJSONString(obj, serializerFeature);
			} else {
				text = JSON.toJSONString(obj, SerializerFeature.WriteDateUseDateFormat);
			}
			bytes = text.getBytes(charset);
		}

		out.write(bytes);
		
	}

}
