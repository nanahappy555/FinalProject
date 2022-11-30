package kr.or.ddit.controller.prof;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/test")
public class Test {

	
	@GetMapping(value = "/getData",produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<Map<String, String>> getData(){	
		List<Map<String, String>> datas = new ArrayList<Map<String,String>>();
		
		Map<String, String> myMap;
		for (int i = 0; i < 10; i++) {
			myMap = new HashMap<String, String>();
			myMap.put("id", "1004"+i);
			myMap.put("name", "아무개"+i);
			myMap.put("midterm", "6"+i);
			myMap.put("finalexam", "7"+i);
			myMap.put("marks", "8"+i);
			myMap.put("attend", "9"+i);
			myMap.put("total", "5"+i);
			datas.add(myMap);
		}		
		
		return datas;
	}
}
