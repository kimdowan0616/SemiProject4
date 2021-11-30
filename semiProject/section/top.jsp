<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>내집내꾸</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />

<title>내집내꾸 - 내집은 내가 꾸민다!</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="../assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">

	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<!-- 로고 -->
			<img src="../images/kakao.png" width="50" height="50"
				style="margin-right: 20px" alt='로고'> <a class="navbar-brand"
				href="#page-top">내집내꾸</a>

			<!-- 모바일버전 우측 메뉴버튼 -->
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>

			<!-- 드롭다운 메뉴 -->
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<a class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"
					aria-expanded="false"> 카테고리 </a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"
					style="left: 25%; width: 300px">
					<li><a class="dropdown-item" href="#">가구</a></li>
					<li><a class="dropdown-item" href="#">패브릭</a></li>
					<li><a class="dropdown-item" href="#">가전</a></li>
					<li><a class="dropdown-item" href="#">생활용품</a></li>
					<li><a class="dropdown-item" href="#">반려동물</a></li>
				</ul>

				<!-- 일반메뉴 -->
				<ul class="navbar-nav ms-left">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">스토어</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">컨텐츠</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#services">커뮤니티</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded">
							<form class="d-flex">
								<input class="form-control me-2" type="search"
									placeholder="요즘 커뮤니티 트렌드는?" aria-label="Search">
								<button class="btn btn-outline-success" type="submit">검색</button>
							</form>
					</a></li>
				</ul>

				<!-- 우측상단 로그인 -->
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav">
						<li class="nav-item mx-0 mx-lg-1"><a
							class="nav-link py-3 px-0 px-lg-3 rounded" data-bs-toggle="modal"
							data-bs-target="#modalSignin">로그인/가입</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<!-- 로그인 modal -->
	<div class="modal modal-signin modal fade " tabindex="-1" role="dialog"
		id="modalSignin" aria-hidden="true" aria-labelledby="modalSignin">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-5 shadow">
				<div class="modal-header p-5 pb-4 border-bottom-0">
					<!-- <h5 class="modal-title">Modal title</h5> -->
					<h2 class="fw-bold mb-0">내집내꾸 로그인</h2>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body p-5 pt-0">
					<form class="">
						<div class="form-floating mb-3">
							<input type="text" class="form-control rounded-4"
								id="floatingInput" placeholder="name@example.com"> <label
								for="floatingInput">아이디</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-4"
								id="floatingPassword" placeholder="Password"> <label
								for="floatingPassword">비밀번호</label>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary"
							type="submit">로그인</button>
						<small class="text-muted">아이디가 없으세요? 1분이면 가입완료!<br></small>
						<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary"
							type="button" data-bs-toggle="modal"
							data-bs-target="#modalSignup">회원가입</button>
						<hr class="my-4">
						<h2 class="fs-5 fw-bold mb-3">현재 간편로그인 준비중입니다</h2>
						<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4"
							type="submit">
							<img src="../images/kakao.png" width="16" height="16"> Sign
							up with KaKao
						</button>
						<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4"
							type="submit">
							<img src="../images/facebook.png" width="16" height="16">
							Sign up with Facebook
						</button>

						<hr class="my-3">
						<h2 class="fs-6 fw-bold mb-3">내집내꾸 판매자가 되고싶으세요?</h2>
						<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4"
							type="button" data-bs-toggle="modal"
							data-bs-target="#modalcompanySignup">판매자 가입하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 일반 회원가입 modal -->
	<div class="modal modal-signin modal fade " tabindex="-1" role="dialog"
		id="modalSignup" aria-hidden="true" aria-labelledby="modalSignup">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-5 shadow">
				<div class="modal-header p-3 pb-2 border-bottom-0">
					<!-- <h5 class="modal-title">Modal title</h5> -->
					<h3 class="fw-bold mb-0">내집내꾸 회원가입</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="container px-5 my-5">
					<form id="contactForm" data-sb-form-api-token="API_TOKEN">
						<div class="form-floating mb-3">
							<input class="form-control" id="id" type="text" placeholder="id"
								data-sb-validations="required"
								style="width: 70%; position: absolute;" /> <label for="아이디"
								style="width: 70%; position: inherit">아이디</label>
							<button class="btn btn-primary btn-md" style="position: inherit">ID중복확인
							</button>
							<div class="invalid-feedback" data-sb-feedback="id:required"
								style="width: 50%">아이디는 필수항목 입니다.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="pwd" type="text"
								placeholder="pwd" data-sb-validations="required" /> <label
								for="비밀번호">비밀번호</label>
							<div class="invalid-feedback" data-sb-feedback="pwd:required">비밀번호를
								입력해주세요.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="pwdck" type="text"
								placeholder="pwdck" data-sb-validations="" /> <label
								for="비밀번호확인">비밀번호 확인</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="name" type="text"
								placeholder="name" data-sb-validations="required" /> <label
								for="이름">이름</label>
							<div class="invalid-feedback" data-sb-feedback="name:required">이름을
								입력해주세요.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="phone" type="text"
								placeholder="phone" data-sb-validations="required" /> <label
								for="연락처">연락처</label>
							<div class="invalid-feedback" data-sb-feedback="phone:required">연락처를
								입력해주세요.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="post" type="text"
								placeholder="post" data-sb-validations="required"
								style="width: 75%; position: absolute" /> <label for="우편번호"
								style="width: 75%; position: inherit">우편번호</label>
							<button class="btn btn-primary btn-md" style="position: inherit">주소찾기
							</button>
							<div class="invalid-feedback" data-sb-feedback="post:required"
								style="width: 55%">주소찾기를 해주세요.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="address" type="text"
								placeholder="address" data-sb-validations="required" /> <label
								for="주소">주소</label>
							<div class="invalid-feedback" data-sb-feedback="address:required">상세주소를
								입력해주세요.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="email" type="email"
								placeholder="email" data-sb-validations="email" /> <label
								for="이메일">이메일</label>
							<div class="invalid-feedback" data-sb-feedback="email:email">이메일
								형식이 맞지않습니다. (Exam@gmail.com)</div>
						</div>
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">Form submission successful!</div>
							</div>
							<div class="d-none" id="submitErrorMessage">
								<div class="text-center text-danger mb-3">Error sending
									message!</div>
							</div>
							<div class="d-grid">
								<button class="btn btn-primary btn-lg disabled"
									id="submitButton" type="submit">Submit</button>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- 판매자 가입 modal -->
	<div class="modal modal-signin modal fade " tabindex="-1" role="dialog"
		id="modalcompanySignup" aria-hidden="true"
		aria-labelledby="modalcompanySignup">
		<div class="modal-dialog" role="document">
			<div class="modal-content rounded-5 shadow">
				<div class="modal-header p-3 pb-2 border-bottom-0">
					<!-- <h5 class="modal-title">Modal title</h5> -->
					<h3 class="fw-bold mb-0">판매자 회원가입</h3>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="container px-5 my-5">
					<form id="contactForm" data-sb-form-api-token="API_TOKEN">
						<div class="form-floating mb-3">
							<input class="form-control" id="id" type="text" placeholder="id"
								data-sb-validations="required" /> <label for="아이디">아이디</label>
							<div class="invalid-feedback" data-sb-feedback="id:required">아이디는
								필수항목 입니다.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="pwd" type="text"
								placeholder="pwd" data-sb-validations="required" /> <label
								for="비밀번호">비밀번호</label>
							<div class="invalid-feedback" data-sb-feedback="pwd:required">비밀번호를
								입력해주세요.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="pwdck" type="text"
								placeholder="pwdck" data-sb-validations="" /> <label
								for="비밀번호확인">비밀번호 확인</label>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="name" type="text"
								placeholder="name" data-sb-validations="required" /> <label
								for="이름">회사명</label>
							<div class="invalid-feedback" data-sb-feedback="이름:required">이름을
								입력해주세요.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="phone" type="text"
								placeholder="phone" data-sb-validations="required" /> <label
								for="연락처">연락처</label>
							<div class="invalid-feedback" data-sb-feedback="phone:required">연락처를
								입력해주세요.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="post" type="text"
								placeholder="post" data-sb-validations="required" /> <label
								for="우편번호">우편번호</label>
							<div class="invalid-feedback" data-sb-feedback="post:required">우편번호가
								없습니다.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="address" type="text"
								placeholder="address" data-sb-validations="required" /> <label
								for="주소">주소</label>
							<div class="invalid-feedback" data-sb-feedback="address:required">주소를
								입력해주세요.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="email" type="email"
								placeholder="email" data-sb-validations="email" /> <label
								for="이메일">이메일</label>
							<div class="invalid-feedback" data-sb-feedback="email:email">Exam@gmail.com</div>
						</div>
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">Form submission successful!</div>
								<a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
							</div>
						</div>
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3">Error sending
								message!</div>
						</div>
						<div class="d-grid">
							<button class="btn btn-primary btn-lg disabled" id="submitButton"
								type="submit">Submit</button>
						</div>
					</form>
				</div>
				<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
			</div>
		</div>
	</div>