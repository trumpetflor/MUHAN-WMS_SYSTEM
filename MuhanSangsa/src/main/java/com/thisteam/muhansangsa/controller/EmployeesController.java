package com.thisteam.muhansangsa.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;


import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.Privilege;

@Controller
public class EmployeesController {
	
	@Autowired
	private EmployeesService service;
	
	

	//---------------------------------------------------인사 관리 (사원 등록)--------------------------
	
	@GetMapping(value = "/employeeRegisterForm")
	public String register() {
		return "employee_registartion_form";
	}
	
	@PostMapping(value = "/employeeRegisterPro")
	public String registerPro(@ModelAttribute EmployeesVO employee, Model model, HttpSession session,
		 @RequestParam("file") MultipartFile file, MultipartRequest request) {
		System.out.println("잘 넘어왔냐 :  " + employee);
		
		
		// ---------------------------------------- 사원 번호 생성 
		// 2. 부서코드(이름) -> 부서코드(코드)
	      String deptCd = "";
	      switch (employee.getDept_Cd()) {
	      case "인사팀": deptCd = "01"; break;
	      case "개발팀": deptCd = "02"; break;
	      case "물류관리팀": deptCd = "03"; break;
	      case "영업팀": deptCd = "04"; break;

	      default: deptCd = "00";
//	            employee.setDept_Cd("미정");
	         break;
	      }
	      
	      // 3. IDX 값 0 일 시 기본값 1로 세팅
	      if(employee.getIdx() == 0) {
	         employee.setIdx(1);
	      }
	      
	      // 4. 캘린더로 받은 date 값 SimpleDateFormat을 이용하여 연도 뒤2자리만 추출하기
	      SimpleDateFormat dateFormat = new SimpleDateFormat("YY");
	      String date = dateFormat.format(employee.getHire_Date());
	      
	      // ---------------------------------------- 사원 번호 생성 (SimpleDateFormat + switch case적용)
	      
//	      int priv_code = 0;
//	      String privCd = "";
//	      String[] arr = employee.getPriv_Cd().split(",");
//	      for(String code : arr) {
//	         
//	         priv_code += Integer.parseInt(code);
//	         System.out.println("권한코드 : " + priv_code);
//	         
//	      }
//	      privCd = String.format("%5s", Integer.toBinaryString(priv_code)).replaceAll(" ", "0");
//	      StringBuffer buffer = new StringBuffer(privCd);
//	      // 리버스된 권한코드 출력하기
//	      System.out.println("권한코드 : " + buffer.reverse());
	      
	   // ---------------------------------------- 권한 코드 생성 (2진수 적용 + reverse)
		
		// 1. 사원 번호를 위한 부서코드 추출
		String departmentCode = service.getDepartmentCode(employee.getDept_Cd());
		System.out.println("부서코드 잘 추출됐냐 : " + departmentCode);
		
		// 2. 사원 번호를 위한 입사년도 추출
		String hireYear = employee.getHire_Date().toString().substring(2, 4);
		System.out.println("입사년도 나오냐? :" + hireYear);
		
		// 3. 사원 번호를 위한 idx 추출 (LPAD 사용 3자리 idx처리)
	 	String idx = service.getidx(employee);
		
		// 4. 최종 사원 번호 = 부서코드(2)+입사년도(2)+인덱스(3)(= 총 7자리), 자동부여
		employee.setEmp_Num(departmentCode+hireYear+idx);
		
		// 파일 업로드를 위한 변수 설정
		String uploadDir = "/resources/upload";
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		
		// 5. 이미지 파일명 추출하기 (파일명이 중복일 경우 발생하는 문제 해결해야함)
		
		String photo = file.getOriginalFilename().toString();
		System.out.println("뭐가 넘어오나 : " + photo);
		employee.setPhoto(photo);
		
		File f = new File(saveDir, photo);
		
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			// 파일 경로가 존재하지 않을 경우 파일 경로 생성
			if(!f.exists()) {
				f.mkdirs();
			}
		
		// 6. 권한 설정
		int priv_code = 0;
		String privCd = "";
		
		String[] arr = employee.getPriv_Cd().split(",");
		for(String code : arr) {
			// 권한 int타입으로 변환하여 계산
			
			// 23/01/30
			// 2진수로 바로 처리해도 됩니다
			priv_code += Integer.parseInt(code, 2);
			System.out.println("권한코드 잘 계산되고 있니 : " + priv_code);
			
			// 권한코드 내의 빈 값을 0으로 채우는 코드 추가
			privCd = String.format("%5s", Integer.toBinaryString(priv_code)).replaceAll(" ", "0");
			
			// 권한 설정
			employee.setPriv_Cd(privCd);
		}
		
		
		// 7. 최종 : 사원 등록 
		int insertCount = service.registerEmployee(employee);
		
		
		if(insertCount > 0) { // 등록 성공 시
			return "redirect:/";
		} else {
			model.addAttribute("msg", "사원 등록 실패!");
			return "fail_back";
		}
		
		
	}
	
	//---------------------------------------------------인사 관리 (사원 등록)--------------------------







	//=============================== 인사관리 : 로그인(세원) =========================================
	// 로그인 페이지
	@GetMapping(value = "/Login")
	public String login() {
		return "member/login"; // login.jsp 로 포워딩
	}
	
	// 로그인 비즈니스 로직 작업
	@PostMapping(value = "/Login")
	public String loginPro(
			@ModelAttribute EmployeesVO employee, 
			Model model, 
			HttpSession session) {
		
		// 비밀번호 암호화 !!DB에 비밀번호 재설정 필요(해싱, 솔팅 다름)!!
		// 파라미터 : 이메일(id 역할)
		BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder(); // 객체 생성
		String pass = service.getPass(employee.getEmp_email()); //email(id) 에 해당하는 암호화 비밀번호 가져오기
		System.out.println(pass);
		
		//암호화 비밀번호 비교
		if(pass == null || passwdEncoder.matches(employee.getEmp_passwd(), pass)) { // 실패(id 에 해당하는 pass 없거나 pass 맞지 X)
			model.addAttribute("msg", "아이디 혹은 비밀번호가 틀렸습니다");
			return "fail_back";
			
		} else { // 성공 시
			session.setAttribute("sId", employee.getEmp_email());//세션 아이디 저장
			System.out.println("sId");
			return "redirect:/"; // 메인페이지로 리다이렉트
		}
		
	}
	//=============================== 인사관리 : 로그아웃(세원) =========================================
	
	@GetMapping(value = "/Logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
		return "redirect:/";
	}
	
	//=============================== 인사관리 : 마이페이지(세원) =========================================
	
	//사원 목록페이지 (테스트용)
	// - 상세정보 페이지 접속차
	@GetMapping(value = "/memberList")
	public String selectMemberList() {
		return "member/list"; // login.jsp 로 포워딩
	}
	
	//마이페이지
	@GetMapping(value = "/Mypage")
	public String insert() {
		return "member/myPage";
	}

	//=============================== 인사관리 : 사원 상세페이지 (세원) =========================================
	
	//사원 상세페이지 리스트
	@GetMapping(value = "/memberListDetail")
	public String memberListDetail() {
		return "member/memberDetail";
	}	

	//사원 상세정보 수정페이지
	@GetMapping(value = "/memberListDetailModify")
	public String memberListDetailModify() {
		return "member/memberModify";
	}	
	

	// ================================= hawon =================================
	//---------------------------------------------------------------------------------------------------------------------
	//-------------------------------------------사원조회/상세정보조회 시작-----------------------------------------------------
	
	@GetMapping(value = "/employees")
	public String emp_view(@RequestParam(defaultValue = "") String searchType,
							@RequestParam(defaultValue = "") String keyword,
							Model model, HttpSession session){
		InetAddress local;
		String ip;
		try {
			local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		session.getAttribute("sId");
		String sId = (String)session.getAttribute("sId");
		
//		sId="admin@muhan.com";
		if(sId != null) { 

			//권한 조회 메서드
			boolean isRightUser = service.getPrivilege(sId,Privilege.사원관리);
			isRightUser = true;//TODO:
			if(isRightUser) {
				
				//권한 있을 시에 조회 수행
				List<Emp_viewVO> empList= service.getMemberList(searchType,keyword);
				model.addAttribute("empList", empList);
			}
		
			System.out.println("sId   : "+sId);
			
		}else {
			model.addAttribute("msg", "권한이 없습니다");
			return "fail_back";
		}
		
		return "emp_List";
	}
	
	@GetMapping(value = "/employees_search")
	public String emp_view_sch( @RequestParam(defaultValue = "") String searchType,
							@RequestParam(defaultValue = "") String keyword,
							Model model, HttpSession session){
	
		String ip;
		try {
			InetAddress local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		
		session.getAttribute("sId");
		String sId = (String)session.getAttribute("sId");

		sId="admin@muhan.com";
		if(sId != null) { 
			//권한 조회 메서드
			boolean isRightUser = service.getPrivilege(sId,Privilege.사원관리);
			isRightUser = true;//TODO:
			if(isRightUser) {
				
				//권한 있을 시에 조회 수행
				List<Emp_viewVO> empList= service.getMemberList(searchType,keyword);
				model.addAttribute("empList", empList);
			}
			}
		
		
		return "emp_List";	
	}
		
	@GetMapping(value = "/employeesUpdate")
	public String emp_update(Model model, HttpSession session){
		
		session.getAttribute("sId");
		
		String sId = (String)session.getAttribute("sId");
		sId="admin@muhan.com";
		if(sId != null) {
		
		}
		
		return "";
	}
	

	
	@PostMapping(value = "/employeesUpdate")
	public String emp_updatePro(Model model, HttpSession session, EmployeesVO employees){
		
		session.getAttribute("sId");
		
		String sId = (String)session.getAttribute("sId");
		if(sId != null) {
			
			
			//1.수정
				 
			int updateCount  = service.updateMember(employees);
			return "";
			
			 
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
	
	}
	
	//상세조회
	@GetMapping(value = "/employeesDetail")
	public String emp_detail(Model model, HttpSession session){
		
		String ip;
		
		try {
			InetAddress local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		//접속자 아이디
		String emp_email = (String)model.getAttribute("emp_email");
		
		//세션아이디
		String sId = (String)session.getAttribute("sId");
		
//		sId="admin@muhan.com";
		System.out.println("sId   : "+sId);
		
		if(sId != null) {
			
				//1.권한 조회 
				boolean isRightUser = service.getPrivilege(sId,Privilege.사원관리);
				isRightUser = true;//TODO:
				if(isRightUser) {
					
					//2. 권한 있을 시에 조회 수행
					Emp_viewVO emp= service.getEmployee(emp_email);
					model.addAttribute("emp", emp);
					return "emp_detail";
				}else {
					model.addAttribute("msg", "잘못된 접근입니다");
					return "fail_back";
				
				}
					
					
			}else {
				model.addAttribute("msg", "잘못된 접근입니다");
				return "fail_back";
			}
			
		
		
	}
	
	//-------------------------------------------사원조회/상세정보조회 끝------------------------------------------------
	//---------------------------------------------------------------------------------------------------------------------
}//end of MemberController













