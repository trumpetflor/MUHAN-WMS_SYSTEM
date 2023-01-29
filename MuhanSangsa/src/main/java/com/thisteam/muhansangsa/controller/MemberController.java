package com.thisteam.muhansangsa.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.thisteam.muhansangsa.service.MemberService;
import com.thisteam.muhansangsa.vo.EmployeesVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping(value = "/employeeRegisterForm")
	public String register() {
		return "employee_registartion_form";
	}
	
	@PostMapping(value = "/employeeRegisterPro")
	public String registerPro(@ModelAttribute EmployeesVO employee, Model model, HttpSession session,
		 @RequestParam("file") MultipartFile file, MultipartRequest request) {
		System.out.println("잘 넘어왔냐 :  " + employee);
		
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
		
		// 5. 이미지 파일명 추출하기
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
				
		if(!f.exists()) {
			f.mkdirs();
		}
		
		// 6. 권한 설정
//		int priv_cod1 = service.getPrivCode(employee);
//		System.out.println("권한 잘 넘어오는지 : " + priv_cod1);
		
		String priv_code = "";
		String[] arr = employee.getPriv_Cd().split(",");
		for(String code : arr) {
			// 권한 int타입으로 변환하여 계산
			priv_code += Integer.parseInt(code);
			System.out.println("권한코드 잘 계산되고 있니 : " + priv_code);
			
			employee.setPriv_Cd(priv_code);
		}
		
		// 사원 등록 
		int insertCount = service.registerEmployee(employee);
		
//		int updateCount = service.getPrivCd(employee);
		
		if(insertCount > 0) { // 등록 성공 시
			return "redirect:/";
		} else {
			model.addAttribute("msg", "사원 등록 실패!");
			return "fail_back";
		}
		
		
	}
}













