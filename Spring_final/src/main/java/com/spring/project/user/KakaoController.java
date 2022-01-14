package com.spring.project.user;


import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.model.Activity.ActivityDAO;
import com.spring.model.Activity.ActivityDTO;
import com.spring.model.Member.MemberDAO;
import com.spring.model.Member.MemberDTO;
import com.spring.model.OAuth.KakaoProfile;
import com.spring.model.OAuth.OAuthToken;
import com.spring.model.Place.PageDTO;
import com.spring.model.Place.PlaceDAO;
import com.spring.model.Place.PlaceDTO;

@RestController
public class KakaoController {
	
	@Autowired
	private MemberDAO mDAO;	
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private ActivityDAO adao;
	
	@Autowired
	private PlaceDAO pdao;
	
	private final int rowsize = 8;      
	private int totalRecord = 0; 
	private int page = 1;
	PageDTO dto = new PageDTO(page, rowsize, totalRecord);
	
	@GetMapping("kakao_login_ok.do")
	public ModelAndView kakaoCallback(String code) { //Data를 리턴해주는 컨트롤러 메서드
		//POST방식으로 key=value 데이터를 요청 (카카오쪽으로)
		RestTemplate rt = new RestTemplate();
		
		//HttpHeader 객체 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpBody 객체 생성	
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "b11fa6774e0285e50b5a9dfa4047b19f");
		params.add("redirect_uri", "http://localhost:8080/project/kakao_login_ok.do");
		params.add("code", code);
		
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest =
				new HttpEntity<>(params, headers);
		
		//Http 요청하기 -Post방식으로- 또한 response 변수의 응답을 받음
 		ResponseEntity<String> response = rt.exchange(
				"https://kauth.kakao.com/oauth/token", 
				HttpMethod.POST, 
				kakaoTokenRequest, 
				String.class		
		);
 		
 		//JSON 데이터 객체에 담기 Gson, Json Simple, ObjectMapper 등의 라이브러리 있음.
 		ObjectMapper objectMapper = new ObjectMapper();
 		
 		OAuthToken oauthToken =null; 		
 		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
 		
 		System.out.println("카카오 액세스 토큰: " + oauthToken.getAccess_token());
 		
 		//POST방식으로 key=value 데이터를 요청 (카카오쪽으로)
		RestTemplate rt2 = new RestTemplate();
		
		//HttpHeader 객체 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpHeader와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 =
				new HttpEntity<>(headers2);
		
		//Http 요청하기 -Post방식으로- 또한 response 변수의 응답을 받음
 		ResponseEntity<String> response2 = rt2.exchange(
				"https://kapi.kakao.com/v2/user/me", 
				HttpMethod.POST, 
				kakaoProfileRequest2, 
				String.class		
		);

 		//JSON 데이터 객체에 담기 Gson, Json Simple, ObjectMapper 등의 라이브러리 사용 가능.
 		ObjectMapper objectMapper2 = new ObjectMapper();
 		
 		KakaoProfile kakaoProfile =null; 		
 		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
 		System.out.println(response2.getBody());
		
 		//MemberDTO: U_id, U_name, U_email, U_image 
 		System.out.println("kakao id: " + kakaoProfile.getId());
 		System.out.println("kakao email: " + kakaoProfile.getKakao_account().getEmail());
 		UUID tempPwd = UUID.randomUUID();
 		System.out.println("kakao tempPwd: " + tempPwd);
 		System.out.println("kakao nickname: " + kakaoProfile.getProperties().getNickname() + "_" +"카카오");
 		System.out.println("kakao thumnail: " + kakaoProfile.getProperties().getThumbnail_image());
 		
 		String kakao_U_id = kakaoProfile.getKakao_account().getEmail();
 		String kakao_U_email = kakaoProfile.getKakao_account().getEmail();
 		String kakao_U_name = kakaoProfile.getProperties().getNickname() + "_" +"카카오";
 		String kakao_U_image = kakaoProfile.getProperties().getThumbnail_image();
 		String temp_pwd = tempPwd.toString(); 		
 		
 		MemberDTO dto = new MemberDTO();
 		dto.setU_id(kakao_U_id);
 		dto.setU_email(kakao_U_email);
 		dto.setU_pwd(temp_pwd);
 		dto.setU_name(kakao_U_name);
 		dto.setU_img(kakao_U_image);
 		dto.setU_phone("추후 입력");
 		dto.setU_oauth("kakao");
 		
 		ModelAndView mav = new ModelAndView();
 		mav.setViewName("main");
 		mav.addObject("kdto", dto); 		
 		String rest_api_key = "b11fa6774e0285e50b5a9dfa4047b19f";
 		mav.addObject("api_key", rest_api_key);
 		
 		session.setAttribute("kdto", dto);
 		session.setAttribute("api_key", rest_api_key);
 		 		
 		// 가입자 여부 확인
 		if(mDAO.checkMember(kakao_U_id) == 1) { //이미 존재하는 ID
 			//회원가입하지 않고 로그인 실행
 			System.out.println("기존 회원 자동 로그인"); 			
 			return mav;
 			
 		}else { //없으면 회원가입 실행
 			mDAO.insertMember(dto);
 			System.out.println("신규 카카오 회원 가입 완료");
 			return mav;
 		}	
 		
	}
	
	@RequestMapping("logout.do")
	public ModelAndView kakaoLogout(ModelAndView mav, Model model) {
		session.invalidate();
		mav.setViewName("main");
		
		List<ActivityDTO> aList = this.adao.getActivityList(dto);
		List<PlaceDTO> pList = this.pdao.getPlaceList(dto);
		
		model.addAttribute("aList", aList); 
		model.addAttribute("pList", pList);
		return mav;
		
	}
}
