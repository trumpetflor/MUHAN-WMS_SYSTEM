package com.thisteam.muhansangsa.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.thisteam.muhansangsa.HomeController;
import com.thisteam.muhansangsa.service.EmployeesService;
import com.thisteam.muhansangsa.service.MailService;
import com.thisteam.muhansangsa.vo.DepartmentVO;
import com.thisteam.muhansangsa.vo.Emp_viewVO;
import com.thisteam.muhansangsa.vo.EmployeesVO;
import com.thisteam.muhansangsa.vo.PageInfo;
import com.thisteam.muhansangsa.vo.Privilege;
import com.thisteam.muhansangsa.vo.WorksVO;

@Controller
public class EmployeesController {
	//log4j
	private static final Logger logger = LoggerFactory.getLogger(EmployeesController.class);
	
	@Autowired
	private EmployeesService service;
	
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
		
		
		// ---------------------------------------- 사원 번호 생ㅇ성 
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
	      if(employee.getIdx() == 0) {
	         employee.setIdx(1);
	      }
	      
	      // 4. 캘린더로 받은 date 값 SimpleDateFormat을 이용하여 연도 뒤2자리만 추출하기
	      SimpleDateFormat dateFormat = new SimpleDateFormat("YY");
	      String date = dateFormat.format(employee.getHire_date());
	      
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
		
		// 임시 패스워드 만드는 로직
		String passwd = UUID.randomUUID().toString().substring(1, 8);
		System.out.println("이메일 인증에 사용된 비밀번호 : " + passwd);
		
		//23/02/08 사원 등록시 패스워드 암호화 작업 진행
		BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder(); // 객체 생성
		employee.setEmp_passwd(passwdEncoder.encode(passwd)); // 암호화된 패스워드 저장
		
		
		// 7. 최종 : 사원 등록 
		int insertCount = service.registerEmployee(employee);
				
		if(insertCount > 0) { // 등록 성공 시
			// 메일 발송
			String addr = "switwillbs@gmail.com";
			String subject = "[muhansangsa] 임시 패스워드 입니다.";
			String body = employee.getEmp_name() 
							+ " 님의 임시 패스워드 : "
							+ passwd
							+ " 입니다.";
			
			mailService.sendEmail(employee.getEmp_email(),addr,subject,body);
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
		return "employees/login"; // login.jsp 로 포워딩
	}
	
	// 로그인 비즈니스 로직 작업
	@PostMapping(value = "/Login")
	public String loginPro(
			@ModelAttribute EmployeesVO employees, 
			Model model, 
			HttpSession session) {
		
		// 비밀번호 암호화 !!DB에 비밀번호 재설정 필요(해싱, 솔팅 다름)!!
		// 파라미터 : 이메일(id 역할)
		BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder(); // 객체 생성
		String pass = service.getPass(employees.getEmp_email()); //email(id) 에 해당하는 비밀번호 가져오기
		System.out.println("1==="+pass);
		
		//암호화 비밀번호 비교
		if(pass == null || !passwdEncoder.matches(employees.getEmp_passwd(), pass)) { // 실패(id 에 해당하는 pass 없거나 pass 맞지 X)			
			model.addAttribute("msg", "아이디 혹은 비밀번호가 틀렸습니다");
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
	public String mypage(
			@RequestParam(defaultValue = "") String msg,
			Model model, HttpSession session) {
		
		//로그인 id 는 sId = emp_email  
		String id = (String)session.getAttribute("sId");
		model.addAttribute("msg", msg);
		
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
	public String mypageUpdate(
			@RequestParam(defaultValue = "") String msg,
			@ModelAttribute EmployeesVO employees, 
			@RequestParam(value ="file") MultipartFile file,
			Model model, 
			HttpSession session){
		
		String sId = (String)session.getAttribute("sId");
		
		System.out.print("employees.getEmp_email()::"+employees.getEmp_email());
		
		if(sId != null) { // 세션아이디가 있을 경우 시작 
			
			//비밀번호 확인
			if(!employees.getEmp_passwd().equals(employees.getEmp_comfirmPasswd())) {
				model.addAttribute("msg", "비밀번호가 일치하지않습니다.");
				return "fail_back";
			}
			
			//패스워드 값이 있을경우 암호화
			if(employees.getEmp_passwd() != null && ! "".equals(employees.getEmp_passwd())) {
				BCryptPasswordEncoder passwdEncoder = new BCryptPasswordEncoder();
				employees.setEmp_passwd(passwdEncoder.encode(employees.getEmp_passwd()));
			}
	
			//---------- 파일 수정 관련 시작 ---------
			if(file.getSize() >0 ) { // 첨부파일을 수정할 경우 1이상 카운트 되기때문에 이렇게 조건문 줬음! 
				//파일업로드 시작
				// 파일 업로드를 위한 변수 설정
				String uploadDir = "/resources/upload";
				String saveDir = session.getServletContext().getRealPath(uploadDir);
				
//				System.out.println("11111111=======================");
				
				// 5. 이미지 파일명 추출하기 (파일명이 중복일 경우 발생하는 문제 해결해야함)
				String photo = file.getOriginalFilename().toString();
				System.out.println("뭐가 넘어오나 : " + photo);
				employees.setPhoto(photo);
				
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
			
				} //---------- 파일 수정 관련 끝 ---------
			
			
			int updateCount  = service.updateMypageMember(employees);
			
			if(updateCount > 0) { // 등록 성공 시
				return "redirect:/Mypage?&msg="+"1"; //성공일땐 1, 실패일땐 2

			} else {
				model.addAttribute("msg", "마이페이지 수정 실패");
				return "fail_back";
			}
			
		} else {
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

	//사원 상세정보 수정 (update)
	@GetMapping(value = "/empListDetailUpdate")
	public String memberListDetailUpdate(
			@RequestParam(defaultValue = "") String id,
			Model model) {
		EmployeesVO employees = service.getMypageInfo(id);
		model.addAttribute("employees", employees);
		
		return "employees/emp_ListDetailUpdate";
	}	
	
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

	// 사원조회 페이지
	@GetMapping(value = "/employees")
	public String emp_view(@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model,
			HttpSession session) {

		try {
			InetAddress local = InetAddress.getLocalHost();
			String ip = local.getHostAddress();
			model.addAttribute("ip", ip);
			logger.info("접속 ip : "+ ip);
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산

		if (session.getAttribute("sId") == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			return "fail_back";

		}

		String sId = (String) session.getAttribute("sId");

		// 권한 조회 메서드
		boolean isRightUser = service.getPrivilege(sId, Privilege.사원조회);

		if (isRightUser) {

			// 권한 있을 시에 조회 수행
			List<Emp_viewVO> empList = service.getMemberList(searchType, keyword, startRow, listLimit);
			model.addAttribute("empList", empList);
			isRightUser = service.getPrivilege(sId, Privilege.사원관리);
			System.out.println("사원관리 권한: " + isRightUser);
			model.addAttribute("priv", "1");

			// 부서 및 재직상태 변경을 위한 테이블 컬럼 가져오기
			List<DepartmentVO> deptList = service.getdeptList();
			List<WorksVO> workList = service.getworkList();

			System.out.println("deptList : " + deptList);
			System.out.println("workList : " + workList);

			// JSON데이터로 변환
			JSONArray deptArr = new JSONArray();
			JSONArray workArr = new JSONArray();

			for (DepartmentVO dept : deptList) {
				System.out.println(dept);
				deptArr.put(new JSONObject(dept));
			}
			for (WorksVO work : workList) {
				System.out.println(work);
				workArr.put(new JSONObject(work));
			}
			
			//< 페이징처리를 위한 작업>------------------------

			// 한 페이지에서 표시할 페이지 목록(번호) 갯수 계산
			// 1. Service 객체의 selectBoardListCount() 메서드를 호출하여 전체 게시물 수 조회
			// => 파라미터 : 검색타입, 검색어   리턴타입 : int(listCount)
			int listCount = service.getEmpListCount(searchType, keyword);
//			System.out.println("총 게시물 수 : " + listCount);
//			
//			 2. 한 페이지에서 표시할 페이지 목록 갯수 설정
			int pageListLimit = 10; // 한 페이지에서 표시할 페이지 목록을 3개로 제한
//			
//			// 3. 전체 페이지 목록 수 계산
			int maxPage = listCount / listLimit 
							+ (listCount % listLimit == 0 ? 0 : 1); 
//			
//			// 4. 시작 페이지 번호 계산
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
//			
//			// 5. 끝 페이지 번호 계산
			int endPage = startPage + pageListLimit - 1;
//			
//			// 6. 만약, 끝 페이지 번호(endPage)가 전체(최대) 페이지 번호(maxPage) 보다
//			//    클 경우, 끝 페이지 번호를 최대 페이지 번호로 교체
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			
//			// PageInfo 객체 생성 후 페이징 처리 정보 저장
			PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
//			// ---------------------------------------------------------------------------
//			// 게시물 목록 객체(boardList) 와 페이징 정보 객체(pageInfo)를 Model 객체에 저장
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("deptArr", deptArr);
			model.addAttribute("workArr", workArr);
		
			System.out.println("workArr : " + workArr);
			System.out.println("deptArr : " + deptArr);
			System.out.println("sId   : " + sId);
			return "employees/emp_List";
		} else {
			model.addAttribute("msg", "권한이 없습니다.");
			return "fail_back";
		}

	}
	   
	   
			@GetMapping(value = "/employees_search")
			public String emp_view_sch(@RequestParam(defaultValue = "") String searchType,
					@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int pageNum,
					Model model, HttpSession session) {
				// 공통코드
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

		
				if (session.getAttribute("sId") == null) {
					model.addAttribute("msg", "잘못된 접근입니다.");
					return "fail_back";
				}

			
				String sId = (String) session.getAttribute("sId");
			
					// 권한 조회 메서드
					boolean isRightUser = service.getPrivilege(sId, Privilege.사원관리);
					isRightUser = true;// TODO:
					if (isRightUser) {
						// 권한 있을 시에 조회 수행
						List<Emp_viewVO> empList = service.getMemberList(searchType, keyword, startRow, listLimit);
						model.addAttribute("empList", empList);
						isRightUser = service.getPrivilege(sId, Privilege.사원관리);
						System.out.println("사원관리 권한: " + isRightUser);
						model.addAttribute("priv", "1");

						// 부서 및 재직상태 변경을 위한 테이블 컬럼 가져오기
						List<DepartmentVO> deptList = service.getdeptList();
						List<WorksVO> workList = service.getworkList();

						
						// JSON데이터로 변환
						JSONArray deptArr = new JSONArray();
						JSONArray workArr = new JSONArray();

						for (DepartmentVO dept : deptList) {
							System.out.println(dept);
							deptArr.put(new JSONObject(dept));
						}
						for (WorksVO work : workList) {
							System.out.println(work);
							workArr.put(new JSONObject(work));
						}
						System.out.println("deptList : " + deptList);
						System.out.println("workList : " + workList);

						model.addAttribute("deptList", deptList);
						model.addAttribute("workList", workList);
						
						
						
						model.addAttribute("deptArr", deptArr);
						model.addAttribute("workArr", workArr);
					}else {
						model.addAttribute("msg", "권한이 없습니다.");
						return "fail_back";
				}

				return "employees/emp_List";
			}
	      

	   
		// 대량의 사원 일괄 부서변경 또는 재직상태변경
		@ResponseBody
		@PostMapping(value = "/emp_update_part.ajax")
		public void emp_update_part(@RequestBody String data, Model model, HttpSession session,
				HttpServletResponse response) {
	
			List<Map<String, String>> info = new Gson().fromJson(String.valueOf(data),
					new TypeToken<List<Map<String, Object>>>() {
					}.getType());

			List<Emp_viewVO> empList = new ArrayList<Emp_viewVO>();
			String updateObj = "";
			String work_type = "";
			String dept_name = "";
			for (int i = 0; i < info.size(); i++) {
				// 사원정보가 있는 컬럼만 Emp_viewVO 객체에 담기
				if (info.get(i).get("emp_num") != null) {

					Emp_viewVO emp = new Emp_viewVO();
					emp.setEmp_num(info.get(i).get("emp_num"));
					emp.setEmp_name(info.get(i).get("emp_name"));

					empList.add(emp);

				}

				// 부서정보변경/ 재직정보변경 판별을 위해 선언된 변수에 값 넣기
				if (info.get(i).get("selectedModalRadioVal") != null) {
					updateObj = info.get(i).get("selectedModalRadioVal");
				}
				if (info.get(i).get("dept_name") != null) {
					dept_name = info.get(i).get("dept_name");
				}
				if (info.get(i).get("work_type") != null) {
					work_type = info.get(i).get("work_type");
				}

			}

//			System.out.println("해야할것 status : " + updateObj);
//			System.out.println("work_type : " + work_type);
//			System.out.println("dept_name :  " + dept_name);
//			System.out.println("empList:" + empList);

			int updateCount = service.updateEmpesInfo(empList, updateObj, work_type, dept_name);
			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(updateCount); // toString() 생략됨
			} catch (IOException e) {
				e.printStackTrace();
			}

			System.out.println("updateCount " + updateCount);
		}


		@PostMapping(value = "/dept_detail.ajax")
		public String dept_detail(DepartmentVO dept, HttpServletResponse response, Model model) {
			Integer.parseInt(dept.getDept_cd());
			dept.getDept_name();

			List<Map<String, String>> deptInfo = service.getDeptInfo_count(Integer.parseInt(dept.getDept_cd()));
			List<Emp_viewVO> deptInfoList = service.getDeptmemberComposition(Integer.parseInt(dept.getDept_cd()));
			model.addAttribute("deptInfo", deptInfo);
			model.addAttribute("deptInfoList", deptInfoList);
			model.addAttribute("dept_name", dept.getDept_name());

			try {
				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(deptInfo); // toString() 생략됨
				response.getWriter().print(deptInfo); // toString() 생략됨
			} catch (IOException e) {
				e.printStackTrace();
			}

			return "employees/dept_detail";
		}
	   
	   
	   //-------------------------------------------사원조회/상세정보조회 끝------------------------------------------------
	   //---------------------------------------------------------------------------------------------------------------------
	}//end of EmployeesController
















