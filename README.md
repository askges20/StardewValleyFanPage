# StardewValleyFanPage
2020-2 지능웹설계 프로젝트 : 스타듀밸리 게임 팬페이지

<h2>프로젝트 개요</h2>
<p>- 목표 : 게임 유저들이 소통할 수 있는 커뮤니티 공간 구현
<p>- 사용 언어 : JSP, HTML, CSS, JS
<p>- IDE : Eclipse
<p>- DB : MySQL
<p>- 서버 : Apache Tomcat
  
<h2>구현 기능</h2>
<p>- 로그인 및 회원가입 기능
<p>- 커뮤니티에서 게시글, 댓글 작성/수정/삭제
<p>- 게시글 작성 시 사진 첨부 가능 (MultipartRequest 객체 이용)
<p>- 게임 정보 수정 기능 (관리자 계정만 가능, 시큐리티 이용)
<p>- 마이페이지에서 자신이 작성한 게시글, 댓글 확인 가능
<p>- 한글/영어 다국어 지원 (JSTL fmt 태그를 이용한 다국어 처리)
<p>- Bootstrap을 활용하여 반응형 웹 지원</p>
  
<h2>화면 캡쳐</h2>
<h3>🌻 메인 화면</h3>
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FL3xuE%2Fbtq7klbQ902%2FNBKZjd5brJMdz9KSUWW5LK%2Fimg.png">
<p>- 스타듀밸리 게임 공식 유튜브 영상과 게임 소개를 포함함</p>
<br>

<h3>🌻 회원가입</h3>
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FO4HIG%2Fbtq69Wd25Qu%2F1I6KziQ2WNH3DUBmnoUGKK%2Fimg.png">
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbC646F%2Fbtq69WSGpL9%2FJhXiUcVOfc2Ah1uQdL7RK0%2Fimg.png">
<p>- 회원가입 완료 시 DB에 사용자 정보 저장, 쿠키를 이용하여 바로 로그인 가능</p>
<br>

<h3>🌻 커뮤니티</h3>
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fd2D657%2Fbtq7iOS8gTH%2FUiprkbC2iW3LQa7sLQnIZ1%2Fimg.png">
<p>- 팬페이지 유저들이 작성한 게시글 목록 확인</p>
<br>
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbPsI5z%2Fbtq7ib82tCD%2F9MRcqmb6AGiNrvlU7RKGa0%2Fimg.png">
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbbm5Jr%2Fbtq7bDeeUE3%2FJvk50aMxE2kdzguDOBLB61%2Fimg.png">
<p>- 게시글 제목, 내용, 작성자 및 작성일자 확인 가능</p>
<p>- 댓글로 다른 유저들과 소통 가능</p>
<br>
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FweSRB%2Fbtq7jzOXnWq%2FKWtVtGGQtgyElW4rlIjVkk%2Fimg.png">
<p>- 글 작성 시 사진 첨부 가능<p>
<br>
  
<h3>🌻 마이페이지</h3>
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FORbW2%2Fbtq7fdl5WDO%2FIb2emH9XRAll6HC1bHzfA0%2Fimg.png">
<p>- 자신이 작성한 게시글, 댓글 확인 가능, 클릭 시 관련 게시글 페이지로 이동</p>
<br>

<h3>🌻 다국어 처리</h3>
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FClINb%2Fbtq7gXXEhqF%2F1H71Z7K2mu2J0iWDlXzqw0%2Fimg.png">
<p>- JSTL을 이용하여 사이트 내용 전체 한글/영어 지원</p>
