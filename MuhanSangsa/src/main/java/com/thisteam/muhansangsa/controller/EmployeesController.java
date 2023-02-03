package com.thisteam.muhansangsa.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.URISyntaxException;
import java.net.UnknownHostException;
import java.net.http.HttpResponse;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;o
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import org.springframework.web.servlet.ModelAndView;

import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.service.MailService;

import com.thisteam.muhansangsa.vo.DepartmentVO;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.Privilege;
import com.thisteam.muhansangsa.vo.WorksVO;

@Controller
public class EmployeesController {
	
	@Autowired
	private EmployeesService service;
	@Autowired
	private MailService mailService;
	
	@Autowired
	private MailService mailService;

	//---------------------------------------------------인사 관리 (사원 등록)--------------------------
	
	@GetMapping(value = "/employeeRegisterForm")
	public String register() {
		return "employee_registration_form";
	}
	
	@PostMapping(value = "/employeeRegisterPro")
	public String registerPro(@ModelAttribute EmployeesVO employee, Model model, HttpSession session,
		 @RequestParam("file") MultipartFile file, MultipartRequest request) {
		System.out.println("잘 넘어왔냐 :  " + employee);
		
		
		// ---------------------------------------- 사원 번호 생성 
		// 2. 부서코드(이름) -> 부서코드(코드)
//	      String deptCd = "";
//	      switch (employee.getDept_cd()) {
//	      case "인사팀": deptCd = "01"; break;
//	      case "개발팀": deptCd = "02"; break;
//	      case "물류관리팀": deptCd = "03"; break;
//	      case "영업팀": deptCd = "04"; break;
//
//	      default: deptCd = "00";
//	            employee.setDept_Cd("미정");
//	         break;
//	      }
	      
	      // 3. IDX 값 0 일 시 기본값 1로 세팅
//	      if(employee.getIdx() == 0) {
//	         employee.setIdx(1);
//	      }
	      
	      // 4. 캘린더로 받은 date 값 SimpleDateFormat을 이용하여 연도 뒤2자리만 추출하기
//	      SimpleDateFormat dateFormat = new SimpleDateFormat("YY");
//	      String date = dateFormat.format(employee.getHire_date());
	      
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
//		String departmentCode = service.getDepartmentCode(employee.getDept_cd());
	    String departmentCode = employee.getDept_cd();
		System.out.println("부서코드 잘 추출됐냐 : " + departmentCode);
		
		// 2. 사원 번호를 위한 입사년도 추출
		String hireYear = employee.getHire_date().toString().substring(2, 4);
		System.out.println("입사년도 나오냐? :" + hireYear);
		
		// 3. 사원 번호를 위한 idx 추출 (LPAD 사용 3자리 idx처리)
	 	String idx = service.getidx(employee);
		
		// 4. 최종 사원 번호 = 부서코드(2)+입사년도(2)+인덱스(3)(= 총 7자리), 자동부여
		employee.setEmp_num(departmentCode+hireYear+idx);
		
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
		
		String[] arr = employee.getPriv_cd().split(",");
		for(String code : arr) {
			// 권한 int타입으로 변환하여 계산

			// 23/01/30
			// 2진수로 바로 처리해도 됩니다
			priv_code += Integer.parseInt(code, 2);
			System.out.println("권한코드 잘 계산되고 있니 : " + priv_code);

			// 권한코드 내의 빈 값을 0으로 채우는 코드 추가
			privCd = String.format("%5s", Integer.toBinaryString(priv_code)).replaceAll(" ", "0");

			// 권한 설정
			employee.setPriv_cd(privCd);
		}
		

		//-----------------------------완료 
		
		// 23/01/31 이메일 인증을 이용하여 임시비밀번호 전송 및 비밀번호 세팅
//		String passwd = mailService.sendPasswdToEmail(employee.getEmp_email());
		

		String passwd = UUID.randomUUID().toString().substring(1, 8);
		System.out.println("이메일 인증에 사용된 비밀번호 : " + passwd);
		employee.setEmp_passwd(passwd);
		
		// 이메일을 보내봅니다...

		
		// 7. 최종 : 사원 등록 
		int insertCount = service.registerEmployee(employee);
		
		
		if(insertCount > 0) { // 등록 성공 시
			String employeeEmail = employee.getEmp_email();
			String addr = "miju.kim.kr@gmail.com";
			String subject = "무한상사 임시 비밀번호 전송 이메일";
			String body = "나옵니까"+passwd;
			
			System.out.println("이메일 보내지는게 나옵니까" + employeeEmail + addr + subject + body);
			try {
				mailService.sendSimpleMessage(employeeEmail);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//				mailService.sendEmail(employeeEmail, addr, subject, body);
//			mailService.sendEmail(employeeEmail, addr, subject, body);

			return "redirect:/";
		} else {
			model.addAttribute("msg", "사원 등록 실패!");
			return "fail_back";
		}
		
		
	} // registerPro
	
//	@RequestMapping("/emailConfirm")
//	public ModelAndView sendEmail( String email) throws Exception {
//		
//		
//		return "";
//		
//	} // sendEmail
	
	@PostMapping("/email")
	public String sendEmail() {
		
//		mailService.sendSimpleMessage(null);
		
		return "redirect:/";
	}
	
	
	
	//---------------------------------------------------인사 관리 (사원 등록)--------------------------

	//=============================== 인사관리 : 로그인(세원) =========================================
	// 로그인 페이지
	@GetMapping(value = "/Login")
	public String login() {
		return "employees/login"; // login.jsp 로 포워딩
	}
	
	// 로그인 비즈니스 로직 작업
	@PostMapping(value = "/Login")
	public String loginPro(
			@ModelAttribute EmployeesVO employees, 
			Model model, 
			HttpSession session) {
		
		// 파라미터 : 이메일(id 역할)
		String pass = service.getPass(employees.getEmp_email()); //email(id) 에 해당하는 비밀번호 가져오기
		System.out.println("1==="+pass);
		
		// 비밀번호 비교
		if(pass == null || !pass.equals(employees.getEmp_passwd())) { // 실패(id 에 해당하는 pass 없거나 pass 맞지 X)			
			model.addAttribute("msg", "아이디 혹은 비밀번호가 틀렸습니다");
//			System.out.println("1======="+pass);
//			System.out.println("1======="+employees.getEmp_email());
			return "fail_back";
			
		} else { // 성공 시
			session.setAttribute("sId", employees.getEmp_email());//세션 아이디 저장
			System.out.println("sId");
			return "redirect:/employees"; // 사원목록페이지(메인)으로 리다이렉트
		}
		
	}
	
	//로그아웃
	@GetMapping(value = "/Logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
		return "redirect:/Login"; //리다이렉트 로그인페이지
	}
	
	//=============================== 인사관리 : 마이페이지(세원) =========================================
	
	//마이페이지 리스트
	@GetMapping(value = "/Mypage")
	public String emp_myPage(
			Model model,
			HttpSession session) {
		
		//로그인 id 는 sId = emp_email  
		String id = (String)session.getAttribute("sId");
		
		// 세션 아이디 
		if(id == null || id.equals("")) { //실패 시
			model.addAttribute("msg", "로그인이 필요한 페이지입니다");
			return "fail_back";
		} else { //성공시
			EmployeesVO employees = service.getMypageInfo(id);
			model.addAttribute("employees", employees);
			
			return "employees/myPage";
		}
	}
	
	//마이페이지 업데이트(수정)
	@PostMapping(value = "/MypageUpdate")
	public String mypage_updatePro(
			@ModelAttribute EmployeesVO employees, 
			Model model, 
			HttpSession session){
		
		String sId = (String)session.getAttribute("sId");
		System.out.print("employees.getEmp_email()::"+employees.getEmp_email());
		
		if(!employees.getEmp_passwd().equals(employees.getEmp_comfirmPasswd())) {
			model.addAttribute("msg", "비밀번호가 일치하지않습니다.");
			return "fail_back";
		}
		
		//패스워드 값이 있을경우 암호화
		if(employees.getEmp_passwd() != null && ! "".equals(employees.getEmp_passwd())) {
			BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder();
			employees.setEmp_passwd(passwdEncoder.encode(employees.getEmp_passwd()));
		}

		if(sId != null) {
			//수정
			int updateCount  = service.updateMypageMember(employees);
			return "redirect:/Mypage";
			
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
	
	}

	
	
	
	//=============================== 인사관리 : 사원 상세페이지 (세원) =========================================
	
	//사원 상세페이지 리스트
	@GetMapping(value = "/empListDetail")
	public String memberListDetail(
			@RequestParam(defaultValue = "") String id,
			Model model) {
		EmployeesVO employees = service.getMypageInfo(id);
		model.addAttribute("employees", employees);
		
		return "employees/emp_ListDetail";
	}	

	//사원 상세정보 수정페이지
	@GetMapping(value = "/empListDetailUpdate")
	public String memberListDetailUpdate(
			@RequestParam(defaultValue = "") String id,
			Model model) {
		EmployeesVO employees = service.getMypageInfo(id);
		model.addAttribute("employees", employees);
		
		return "employees/emp_ListDetailUpdate";
	}	
	
	//사원 상세정보 수정 진행 (update)
	@PostMapping(value = "/empListDetailUpdatePro")
	public String memberListDetailUpdatePro(
			@ModelAttribute EmployeesVO employees, 
			Model model, 
			HttpSession session){
		
		String sId = (String)session.getAttribute("sId");

		if(sId != null) {
			//수정
			int updateCount  = service.updateDetailEmp(employees);
			return "redirect:employees/emp_ListDetailUpdate?id="+employees.getEmp_email();
			
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
	
	}
	
	
	// ================================= hawon =================================
	//---------------------------------------------------------------------------------------------------------------------
	//-------------------------------------------사원조회/상세정보조회 시작-----------------------------------------------------
	
	@GetMapping(value = "/employees")
	public String emp_view(@RequestParam(defaultValue = "") String searchType,
							@RequestParam(defaultValue = "") String keyword,
							@RequestParam(defaultValue = "1") int pageNum,
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
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		session.getAttribute("sId");
		String sId = (String)session.getAttribute("sId");
		
		sId="admin@muhan.com";
		if(sId != null) { 

			//권한 조회 메서드
			boolean isRightUser = service.getPrivilege(sId,Privilege.사원조회);
			isRightUser = true;//TODO:
			if(isRightUser) {
				
				//권한 있을 시에 조회 수행
				List<Emp_viewVO> empList= service.getMemberList(searchType, keyword, startRow, listLimit);
				model.addAttribute("empList", empList);
				isRightUser = service.getPrivilege(sId,Privilege.사원관리);
				System.out.println("사원관리 권한: " + isRightUser);
				model.addAttribute("priv", "1");

				
				//부서 및 재직상태 변경을 위한 테이블 컬럼 가져오기
				List<DepartmentVO> deptList= service.getdeptList();
				List<WorksVO> workList= service.getworkList();
				
				System.out.println("deptList : "+ deptList);
				System.out.println("workList : "+ workList);
				
				
				
				//JSON데이터로 변환
				JSONArray deptArr = new JSONArray();
				JSONArray workArr = new JSONArray();
				
				for ( DepartmentVO dept : deptList) {
						System.out.println(dept);
						deptArr.put(new JSONObject(dept));
				}
				for ( WorksVO work : workList) {
					System.out.println(work);
					workArr.put(new JSONObject(work));
				}
			
				model.addAttribute("deptArr", deptArr);
				model.addAttribute("workArr", workArr);
				
				

			}
		
			System.out.println("sId   : "+sId);
			
		}else {
			model.addAttribute("msg", "권한이 없습니다");
			return "fail_back";
		}
		
		return "member/emp_List";
	}
	
	@GetMapping(value = "/employees_search")
	public String emp_view_sch( @RequestParam(defaultValue = "") String searchType,
							@RequestParam(defaultValue = "") String keyword,
							@RequestParam(defaultValue = "1") int pageNum,
							Model model, HttpSession session){
		//공통코드
		String ip;
		try {
			InetAddress local = InetAddress.getLocalHost();
			ip = local.getHostAddress();
			model.addAttribute("ip", ip);
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		session.getAttribute("sId");
		String sId = (String)session.getAttribute("sId");
	

		// ---------------------------------------------------------------------------
		// org.json 패키지의 JSONObjectg 클래스를 활용하여 JSON 객체 1개를 생성하고
		// JSONArray 클래스를 활용하여 JSONObject 객체 복수개에 대한 배열 생성
		// 자바 클래스를 활용하여 JSONobject 객체 복수개에 대한  배열 생성
//		JSONArray boardArr = new JSONArray();
//		
//		for (BoardVO board : boardList) {
////			System.out.println(board);
//			JSONObject obj =  new JSONObject(board);
//			boardArr.put(obj);
//		}


		sId="admin@muhan.com";
		if(sId != null) { 
			//권한 조회 메서드
			boolean isRightUser = service.getPrivilege(sId,Privilege.사원관리);
			isRightUser = true;//TODO:
			if(isRightUser) {
				//권한 있을 시에 조회 수행
				List<Emp_viewVO> empList= service.getMemberList(searchType, keyword, startRow, listLimit);
				model.addAttribute("empList", empList);
				isRightUser = service.getPrivilege(sId,Privilege.사원관리);
				System.out.println("사원관리 권한: " + isRightUser);
				model.addAttribute("priv", "1");
				
				//부서 및 재직상태 변경을 위한 테이블 컬럼 가져오기
				List<DepartmentVO> deptList= service.getdeptList();
				List<WorksVO> workList= service.getworkList();
				
				System.out.println("deptList : "+ deptList);
				System.out.println("workList : "+ workList);
				
				model.addAttribute("deptList", deptList);
				model.addAttribute("workList", workList);
		
			}
		}
		
		
		return "member/emp_List";	
	}
		

	

	@ResponseBody
	@PostMapping(value = "/emp_update_part.ajax")
	public void emp_update_part(@RequestBody Map<String, Object> data,
								Model model, HttpSession session){
		//@RequestParam List<EmployeesVO> emp => 안됨
//		work.getWork_type();
//		dept.getDept_name();
		System.out.println(data);
//		System.out.println("employees"+ employees);
//		System.out.println("work_type"+ work_type.getWork_type());
//		System.out.println("dept_name"+ dept_name.getDept_name());
//		System.out.println("selectedModalRadioVal: " +selectedModalRadioVal);
		
		
//		if(	work.getWork_type() != null	) {
			
//				int updateWorkCount = service.updateEmpWork();
//		}else {
			
//				int updateDeptCount = service.updateEmpDept();
//		}
			

			 
		}else {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";
		}
	
	}
	
	//상세조회
	@GetMapping(value = "/employees/detail")
	public String emp_detail(Model model, HttpSession session){
		
		
		
		
		
	}


	@PostMapping(value = "/dept_detail.ajax")
	public String dept_detail(DepartmentVO dept,HttpServletResponse response, Model model) {
		Integer.parseInt(dept.getDept_cd());
		dept.getDept_name();
		
		
		List<Map<String, String>> deptInfo =	service.getDeptInfo_count(Integer.parseInt(dept.getDept_cd()));
		List<Emp_viewVO> deptInfoList = service.getDeptmemberComposition(Integer.parseInt(dept.getDept_cd()));
		model.addAttribute("deptInfo", deptInfo);
		model.addAttribute("deptInfoList", deptInfoList);
		
		try {
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(deptInfo); // toString() 생략됨
		response.getWriter().print(deptInfo); // toString() 생략됨
	} catch (IOException e) {
		e.printStackTrace();
	}
		
		return "member/dept_detail";
	}
			
		
		
	
	
	//-------------------------------------------사원조회/상세정보조회 끝------------------------------------------------
	//---------------------------------------------------------------------------------------------------------------------
}//end of MemberController













		
