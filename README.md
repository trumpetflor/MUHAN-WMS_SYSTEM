
## 🏭MuhanSangsa 🏭
팀프로젝트로 진행한  WMS(창고 관리 시스템) 및 사원관리 시스템입니다.
## DEMO : 👉<a href="http://itwillbs4.cafe24.com/MuhanSangsa">MUHAN WMS System</a>👈 
<i>(**아이디 및 비밀번호 : 포트폴리오에 첨부)</i>

![Muhan_logo](https://user-images.githubusercontent.com/112055211/230053316-9197b2f3-0b15-47ee-ac2c-6e24039c774c.png)
<br>

#️⃣목차
---
[1. 개요](#1️⃣개요)<br>
[2. 개발 환경 및 기술 스택](#2️⃣개발-환경-및-기술-스택)<br>
[3. 담당파트 작업파일 경로](#3️⃣담당파트-작업파일-경로)<br>
[4. ERD 및 구현페이지 설명](#4️⃣erd-및-구현페이지-설명)<br>
  - [4-1.ERD](#erd)<br>
  - [4-2.인사 파트](#01인사)<br>
  - [4-3.출고 등록 파트](#02출고-등록)<br>
  - [4-3.재고 관리 파트](#03재고)<br>

1️⃣개요
----
- 설명: <br>: MVC모델2을 기반으로 스프링 프레임워크를 이용하여 만든 WMS(창고 관리 시스템) 및 사원관리 시스템입니다.<br>
               크게 사원관리, 재고관리, 창고관리, 입고관리, 출고관리로 구성되어있습니다.
- 개발기간: 2023.01.20 - 2023.02.12 ( 총 24일 中 10일 설계 / 14일 구현)
- 총 개발 인원: 6명
- 개발시 참고 사이트 : https://www.ecount.com/kr

- 담당파트: 
  - 인사 (사원조회, 사원 재직상태 및 부서 일괄변경 기능)
  - 출고 (신규 출고 생성)
  - 재고 (재고 현황 및 재고조정 이동 창고 위치)
  - 팝업창 및 등록 뷰 페이지 구현
  - 권한 조회 기능 모듈화

            
<br><br><br>
2️⃣개발 환경 및 기술 스택
---
### 개발환경
- IDE: STS4
- Server: Apache Tomcat 8.0
- DB Tool: dbeaver, workbench
- Build tool: maven


### 기술 스택
- BACK-END
  - JAVA(jdk 1.8.0)
  - SPRING FRAMEWORK /  MVC 모델2 아키텍처 패턴
  - jdbc
  - MySQL
  - Mybatis
  - jsp
- FRONT-END
  - Bootstrap 
  - javascript
  - jQuery
  - Ajax
  - HTML
  - CSS

<br><br><br>
3️⃣담당파트 작업파일 경로
---
#### Controller
인사https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/java/com/thisteam/muhansangsa/controller/EmployeesController.java#L539
출고https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/java/com/thisteam/muhansangsa/controller/OutController.java#L376
재고https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/java/com/thisteam/muhansangsa/controller/StockController.java#L284

#### Service:
인사https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/java/com/thisteam/muhansangsa/service/EmployeesService.java#L76
출고 https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/java/com/thisteam/muhansangsa/service/OutService.java#L59
재고
https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/java/com/thisteam/muhansangsa/service/StockService.java#L24


#### mapper:
인사https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/java/com/thisteam/muhansangsa/mapper/EmployeesMapper.java#L47
출고https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/java/com/thisteam/muhansangsa/mapper/OutMapper.java#L18
재고
https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/java/com/thisteam/muhansangsa/mapper/StockMapper.java#L17



#### mapper.xml
인사
https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/resources/com/thisteam/muhansangsa/mapper/EmployeesMapper.xml#L146
출고
https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/resources/com/thisteam/muhansangsa/mapper/OutMapper.xml#L6
재고https://github.com/trumpetflor/MUHAN-WMS_SYSTEM/blob/b9b08e800888bbc37964f1b2dbde59ba3c6e1440/MuhanSangsa/src/main/resources/com/thisteam/muhansangsa/mapper/StockMapper.xml#L4

<br><br><br>
4️⃣ERD 및 구현페이지 설명
---
### ERD
![image](https://user-images.githubusercontent.com/112055211/230067245-335d4efa-7b65-419e-82e1-40621e410abc.png)
### 01.인사
- Page access route: <i>메뉴 > 사원 조회</i>
- 주요기능 요약
  - 권한에 따른 사원 조회 기능 구분(기본조회/상세조회 및 수정)
  - 페이징 처리
  - 분류에 따른 검색 기능
  - 권한에 따라 사원 선택 체크박스 및 수정 및 사원 일괄 수정 기능
  - 일괄 수정 기능 
    - jQuery 모달창으로 뷰단 구현
    - 사원 체크 후 일괄 수정 버튼 클릭 시, 부서 또는 재직상태 변경 가능.
    - ajax를 활용해 비동기 방식으로 구현 및 Gson 라이브러리 사용

![무한상사 발표 ppt 템플릿 - 이름제거3](https://user-images.githubusercontent.com/112055211/230071584-ffcb9d31-69cb-43e6-a767-e75ca0de610b.png)
![무한상사 발표 ppt 템플릿 - 이름제거4](https://user-images.githubusercontent.com/112055211/230071621-644483b1-b652-4305-ada3-1410db1ad210.png)
![무한상사 발표 ppt 템플릿 - 이름제거5](https://user-images.githubusercontent.com/112055211/230071675-9294d39a-6e47-452e-999f-6e77555fcc3a.png)




### 02.출고 등록
- Page access route: <i>메뉴 > 출고관리 > 출고 예정 > 하단 '신규등록' 버튼</i>
- 주요기능 요약
  - 출고 신규 등록 기능
  - 등록 날짜 현재날짜로 자동 보여지는 기능.
  - 거래처,담당자,품목, 재고번호 검색으로 선택 기능
  - 품목에 맞는 재고번호만 보이도록 구현.
  - 품목 추가 및 삭제 기능
  - 재고 수량보다 많은 수량을 출고시킬 경우 신규출고서 등록 불가.
  
![무한상사 발표 ppt 템플릿 - 이름제거6](https://user-images.githubusercontent.com/112055211/230071726-1ed0ab75-f666-4a5e-a0ba-6bb5efc1ccbb.png)
![무한상사 발표 ppt 템플릿 - 이름제거7](https://user-images.githubusercontent.com/112055211/230071744-09187f87-b365-4b07-8f19-05f355cc558c.png)

### 03.재고
- Page access route: 1) <i>메뉴 > 재고조회</i> <br> 2)
                       <i>메뉴 > 재고조회 > 체크박스 클릭 후 '조정'버튼 </i>
- 주요기능 요약
  - 재고 페이지
    - 페이징처리 및 검색 기능
    - Excel파일로 다운 기능 
        - 전체 목록 다운 기능과 검색 결과를 다운할 수 있는 기능
        - 파일 저장명은 현재날짜 포함되어 저장
     - 체크박스로 재고 선택 ( 조정 페이지로 넘어가기 위함)
  - 조정페이지(이동재고번호 파트)
    - 이동 재고 번호 클릭 시 해당 품목을 가진 재고번호 확인 및 선택 가능
    - 새 위치(새 재고번호 생성)추가 기능
      - 창고 > 구역 > 선반 위치 비동기 방식으로 선택 가능
      
![무한상사 발표 ppt 템플릿 - 이름제거8](https://user-images.githubusercontent.com/112055211/230071802-5bce3134-3e51-496d-b6f2-fdd3e08217f1.png)
![무한상사 발표 ppt 템플릿 - 이름제거9](https://user-images.githubusercontent.com/112055211/230071838-8be62752-0572-4c71-b799-50107a1875c7.png)
![무한상사 발표 ppt 템플릿 - 이름제거10](https://user-images.githubusercontent.com/112055211/230071849-cb3c2872-0b30-4404-b5b0-a1b66891f623.png)
![무한상사 발표 ppt 템플릿 - 이름제거11](https://user-images.githubusercontent.com/112055211/230071862-7213cbcc-de80-4422-9b61-e70fe358180f.png)
![무한상사 발표 ppt 템플릿 - 이름제거12](https://user-images.githubusercontent.com/112055211/230071879-ff8e1095-058b-4e38-91af-75a6e22ca13c.png)
![무한상사 발표 ppt 템플릿 - 이름제거13](https://user-images.githubusercontent.com/112055211/230071890-645cb098-f34a-40b5-8a90-c5094cad359c.png)


