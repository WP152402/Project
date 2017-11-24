/**
 * 
 */
package project.dimiog.user;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * <pre>
 * org.dimigo.openapi
 *   |_ NaverSearch
 * 
 * 1. 개요 :
 * 2. 작성일 : 2017. 6. 19.
 * </pre>
 * 
 * @author : teacher
 * @version : 1.0
 */
public class Weather {

	public List<String> getAPI() {
		List<String> list = new ArrayList<>();
		try {
			String json = search("http://apis.skplanetx.com/weather/current/minutely?lon=127.1238460&village=&county=&stnid=&lat=37.4851330&city=&version=1");
			String json2 = search("http://apis.skplanetx.com/weather/dust?lon=127.1238460&lat=37.4851330&version=1");
			String json3 = search(" http://apis.skplanetx.com/weather/windex/uvindex?lon=127.1238460&lat=37.4851330&version=1");
			String gson = search("http://apis.skplanetx.com/weather/current/minutely?lon=126.8254170&village=&county=&stnid=&lat=37.3401220&city=&version=1");
			String gson2 = search("http://apis.skplanetx.com/weather/dust?lon=126.8254170&lat=37.3401220&version=1");
			String gson3 = search(" http://apis.skplanetx.com/weather/windex/uvindex?lon=126.8254170&lat=37.3401220&version=1");
			json = parseJson(json);
			json2 = parseJson2(json2);
			json3 = parseJson3(json3);
			gson = parseJson(gson);
			gson2 = parseJson2(gson2);
			gson3 = parseJson3(gson3);
			
			list.add(json);
			list.add(json2);
			list.add(json3);
			
			list.add(gson);
			list.add(gson2);
			list.add(gson3);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return list;
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private static String parseJson2(String json) throws Exception { //미세먼지 가져오는 메소드
		Map<String, Object> map = new ObjectMapper().readValue(json, Map.class);
		
		Map<String, List> weather = (Map<String, List>) map.get("weather");
		List<Map<String, Object>> dust = weather.get("dust");
		
		Map<String, Object> info = dust.get(0);
		Map<String, String> pm10 = (Map<String, String>) info.get("pm10");
		String a = pm10.get("grade") + "( " + pm10.get("value") + " )";
		System.out.printf("%s %s \n", pm10.get("grade"), pm10.get("value"));
		
		return a;
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private static String parseJson3(String json) throws Exception { //자외선 지수 가져오는 메소드
		Map<String, Object> map = new ObjectMapper().readValue(json, Map.class);
		
		Map<String, Map> weather = (Map<String, Map>) map.get("weather");
		Map<String, Object> wIndex = (Map<String, Object>) weather.get("wIndex");
		List<Map> uvIndex = (List<Map>) wIndex.get("uvindex");
		Map<String, Map> grid = (Map<String, Map>) uvIndex.get(0);
		Map<String, String> day00 = (Map<String, String>) grid.get("day02");
		
		String a = day00.get("comment");
		System.out.println(a);
		
		return a;
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private static String parseJson(String json) throws Exception {
		Map<String, Object> map = new ObjectMapper().readValue(json, Map.class);
		
		Map<String, List> weather = (Map<String, List>) map.get("weather");
		List<Map<String, Object>> minutely = weather.get("minutely");
		
		Map<String, Object> info = minutely.get(0);
		Map<String, String> grid = (Map<String, String>) info.get("station");
		
		System.out.printf("%s \n", grid.get("name"));
		
		Map<String, String> sky = (Map<String, String>) info.get("sky");
		Map<String, String> temp = (Map<String, String>) info.get("temperature");
		
		System.out.printf("%s\n", sky.get("name"));
		System.out.printf("%s\n", temp.get("tc"));
		String a = sky.get("name") + "( " + temp.get("tc") + "도 )";
		
		return a;
	}

	private static String search(String Url) throws Exception {
		try {
            String apiURL = Url;
           
            URL url = new URL(apiURL);
            
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
           
            
            con.setRequestMethod("GET");
            con.setRequestProperty("appKey", "f27479e0-00a2-3e4e-aa4f-091e3196d6d2");
            
            int responseCode = con.getResponseCode();
            BufferedReader br;
            BufferedReader br2;
            
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
               
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
                
            }
            
            String inputLine;
       
            StringBuffer response = new StringBuffer();
       
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            
            
            br.close();
           
            System.out.println(response.toString());
      
            
            
            return response.toString();
            
        } catch (Exception e) {
            //System.out.println(e);
        	throw e;
        }
	}

	
	
}
