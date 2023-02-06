package com.thisteam.muhansangsa.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.thisteam.muhansangsa.service.ProductService;
import com.thisteam.muhansangsa.vo.PageInfo;
import com.thisteam.muhansangsa.vo.ProductVO;
import com.thisteam.muhansangsa.vo.Product_group_bottomVO;

@Controller
public class ProductController {
	
	@Autowired	
	private ProductService service ;
	
	//========================= 품목 등록 시작 =======================================
	@GetMapping(value = "/ProdInsertForm")
		public	String prodInsertForm(
				@RequestParam(defaultValue = "") String msg,
				Model model) {
		model.addAttribute("msg", msg);
		return "product/prod_insertForm";
	}

	
	@PostMapping(value = "/ProdInsertPro")
	public String prodInsertPro(@ModelAttribute ProductVO product, Model model, HttpSession session,
		 @RequestParam("file") MultipartFile file, MultipartRequest request) {
		
		//파일업로드 시작
		String uploadDir = "/resources/upload/product/"; 
		String saveDir = session.getServletContext().getRealPath(uploadDir);
		//실제 업로드 경로 
		System.out.println("실제 업로드 경로 : " + saveDir);
		 
		String product_image = file.getOriginalFilename().toString(); // 실제 등록 이미지 파일명
		product.setProduct_image(product_image);
			// 파일 생성
		File f = new File(saveDir, product_image); 
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
		// 파일업로드 끝
		
		//바코드에 UUID 난수 등록(그대로 하면 길어서 디비 에러발생-> 10자리까지 끊음)
		product.setBarcode(UUID.randomUUID().toString().substring(1, 10));
		
		
		int insertCount = service.prodInsertPro(product);
		if(insertCount > 0) { // 등록 성공 시
			return "redirect:/ProdInsertForm?msg="+"1"; 
		}else {
			model.addAttribute("msg", "품목 등록 실패!");
			return "fail_back";
		}
		
		
	} 

	//품목 그룹 목록 조회 페이지 출력용
	@GetMapping(value = "/Product/GroupBottomSelectList")
		public	String groupBottomSelectList(
				@RequestParam(defaultValue = "") String msg,
				Model model) {
		
		model.addAttribute("msg", msg);
		
		return "product/group_bottom_selectList";
	}
	
	//품목 그룹 목록 조회 페이지 조회용(JSON)
	@ResponseBody
	@GetMapping(value = "/Product/GroupBottomSelectListJson")
		public	void groupBottomSelectListJson(
				@RequestParam(defaultValue = "") String searchType,
				@RequestParam(defaultValue = "") String keyword,
				@RequestParam(defaultValue = "1") int pageNum,
				Model model,
				HttpSession session,
				HttpServletResponse response) {
		
		// 페이징 처리를 위한 변수 선언
		int listLimit = 10; // 한 페이지에서 표시할 게시물 목록을 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		// 거래처 목록 가져오기
		List<Product_group_bottomVO> groupList = service.getGroupList(searchType, keyword, startRow, listLimit);
		
		// JSON 형식 변환
		JSONArray jsonArray = new JSONArray();
		
		for(Product_group_bottomVO group : groupList) {
			JSONObject jsonObject = new JSONObject(group);
			
			jsonArray.put(jsonObject);
		}
		
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonArray);
		} catch (IOException e) {
			e.printStackTrace();
		}	
		
	}
	
	//거래처 조회 페이지
	@GetMapping(value = "/Product/ClientSelectList")
		public	String clientSelectList() {
		return "product/client_selectList";
	}
	

	//--------------------------------- 품목 등록 끝 ---------------------------------
	//========================= 품목 조회(목록) 시작 =======================================

	@GetMapping(value = "/ProdSelectList")
	public	String prodSelectList(
		@RequestParam(defaultValue = "") String searchType,
		@RequestParam(defaultValue = "") String keyword,
		@RequestParam(defaultValue = "1") int pageNum,
		Model model) {
		
		//페이징 처리를 위한 변수 선언
		int listLimit = 10; // 게시물 목록 10개로 제한
		int startRow = (pageNum - 1) * listLimit; // 조회 시작 행번호 계산
		
		//품목 목록 조회
		List<ProductVO> productList = service.getProductList(keyword, searchType, startRow, listLimit);
		
		//-------------------------------------------------
		// 페이징 처리
		// 1. 한 페이지에 표시할 페이지 목록(번호) 갯수 계산
		//=> 파라미터 : 검색타입, 검색어   리턴타입 : int(listCount)
		int listCount = service.getProductListCount(keyword, searchType);
		
		// 2. 한 페이지에서 표시할 페이지 목록 갯수 설정 (페이지 번들의 갯수)
		int pageListLimit = 10; // 한 페이지에서 표시할 페이지 목록을 10개로 제한
		
		// 3. 전체 페이지 목록 수 계산
		int maxPage = listCount / listLimit 
						+ (listCount % listLimit == 0 ? 0 : 1); 
		
		// 4. 시작 페이지 번호 계산
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		
		// 5. 끝 페이지 번호 계산
		int endPage = startPage + pageListLimit - 1;
		
		// 6. 만약, 끝 페이지 번호(endPage)가 전체(최대) 페이지 번호(maxPage) 보다
		//    클 경우, 끝 페이지 번호를 최대 페이지 번호로 교체
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체 생성 후 페이징 처리 정보 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);		
		
		// 품목 리스트 객체(productList) 와 페이징 정보 객체(pageInfo)
		// 검색타입(searchType), 키워드(keyword)를 Model 객체에 저장
		model.addAttribute("keyword", keyword);		
		model.addAttribute("searchType", searchType);		
		model.addAttribute("productList", productList);
		model.addAttribute("pageInfo", pageInfo);		
		
		return "product/prod_selectList";
		
	}
	//--------------------------------- 품목 조회 끝 ---------------------------------
	//========================= 품목 수정 시작 (상세정보) =======================================

	//품목 그룹 목록 상세조회 페이지 출력용
	@GetMapping(value = "/ProdUpdateForm")
		public	String ProdUpdateForm(
				@RequestParam(defaultValue = "") int product_cd,
				@RequestParam(defaultValue = "") String msg,
				Model model) {
		
		ProductVO product = service.getProdUpdate(product_cd);
		model.addAttribute("product", product);
		model.addAttribute("msg", msg);
		
		return "product/prod_updateForm";
	}
	
	//품목 상세정보 수정 진행(update)
	@PostMapping(value = "/ProdUpdatePro")
		public String memberListDetailUpdatePro(
				@ModelAttribute ProductVO product, 
				 @RequestParam("file") MultipartFile file,
				Model model, HttpSession session){
			
			String sId = (String)session.getAttribute("sId");
	
			if(sId != null) { // 로그인 되어있을 때
				if(file.getSize() >0 ) { // 첨부파일을 수정할 경우 1이상 카운트 되기때문에 이렇게 조건문 줬음! 
					//파일업로드 시작
					String uploadDir = "/resources/upload/product/"; 
					String saveDir = session.getServletContext().getRealPath(uploadDir);
					//실제 업로드 경로 
					System.out.println("실제 업로드 경로 : " + saveDir);
					 
					String product_image = file.getOriginalFilename().toString(); // 실제 등록 이미지 파일명
					product.setProduct_image(product_image);
						// 파일 생성
					File f = new File(saveDir, product_image); 
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
				
				}
				
				
				int updateCount  = service.ProdUpdatePro(product);
				return "redirect:/ProdUpdateForm?product_cd="+product.getProduct_cd() 
				+ "&msg="+"1";
				
			} else {
				model.addAttribute("msg", "잘못된 접근입니다.");
				return "fail_back";
			}
	
		}	

	//--------------------------------- 품목 수정 끝 (상세정보) ---------------------------------
	//========================= 품목 그룹 신규 등록 시작 (Modal) =======================================	
	//품목 그룹 신규 등록(Modal) 
	@PostMapping(value = "/Product/ProdGroupBottomNameInsertPro")
	public String prodInsertPro(
			@RequestParam(defaultValue = "") String product_group_bottom_name,
			Model model) {
	
	
			int insertCount = service.prodGroupBottomNameInsertPro(product_group_bottom_name);
			
			if(insertCount > 0) { // 등록 성공 시
				return "redirect:/Product/GroupBottomSelectList?msg="+"1"; //성공일땐 1, 실패일땐 2
			} else {
				model.addAttribute("msg", "그룹 신규 등록 실패");
				return "fail_back";
			}

	} 
	
	
}













