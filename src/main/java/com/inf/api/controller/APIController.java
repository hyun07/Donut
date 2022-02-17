package com.inf.api.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/api")
public class APIController {
	
	@GetMapping("/jAPI")
	public String showJAPI() {
		log.info("jAPI 접근 >>>>>>>>> ");
		return "api/jAPI";
	}
	
	@ResponseBody
	@PostMapping("/jAjax")
	public Map<String, Object> showRecruitInfo(){
		Map<String,Object > map = new HashMap<String, Object>();
		
		return null;
	}
	
	/* 성현 */
	@GetMapping("/seoulApi")
	public String info() {
		return "api/seoulApi";
	}
	
	@GetMapping(value="/workInSeoul",produces = "application/text; charset=utf8")
	//public @ResponseBody List<Map<String, Object>> workInSeoul() {
		public @ResponseBody String workInSeoul() {
		List<Map<String, Object>> list = new ArrayList<>();
		BufferedReader reader;
		StringBuilder builder = new StringBuilder();
		String data = "";
		URL url;
		try {
			url = new URL("http://openapi.seoul.go.kr:8088/4b796f566d6b7375393463424c7470/xml/GetJobInfo/1/5/");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			// Request Header 정의
			con.setRequestProperty("Content-Type", "text/xml; charset=UTF-8");
			con.setRequestMethod("GET");
			con.setConnectTimeout(5000);
			con.setReadTimeout(5000);
			con.setDoOutput(false);
			
			if(con.getResponseCode() == HttpURLConnection.HTTP_OK){
				reader = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
				String line;
				while((line = reader.readLine()) != null) {
					builder.append(line).append("\n");
				}
				reader.close();
				data = builder.toString();
				System.out.println("builder.toString() >>>>>>>>>> " + data);
				
//				XmlMapper mapper = new XmlMapper();
//				list = mapper.readValue(data, new TypeReference<List>(){});
//				System.out.println("list >>> " + list);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return list;
		return data;
	}
}
