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
<script type="text/javascript" src="../js/scripts.js"></script>

<title>Freelancer - Start Bootstrap Theme</title>
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

	<!-- 심볼마크 -->
	<symbol id="facebook" viewBox="0 0 16 16"> <path
		d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
	</symbol>

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
				</li>

				<!-- 일반메뉴 -->
				<ul class="navbar-nav ms-left">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#portfolio">스토어</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">컨텐츠</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">커뮤니티</a></li>
				</ul>


				<!-- 검색바 -->
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<form class="d-flex">
							<input class="form-control me-2" type="search"
								placeholder="요즘 커뮤니티 트렌드는?" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">검색</button>
						</form>
					</div>
				</nav>

				<!-- 우측상단 로그인 -->
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav">
						<li class="nav-item mx-0 mx-lg-1"><a
							class="nav-link py-3 px-0 px-lg-3 rounded" data-bs-toggle="modal"
							data-bs-target="#modalSignin">로그인/가입</a></li>
					</ul>
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
							<input type="email" class="form-control rounded-4"
								id="floatingInput" placeholder="name@example.com"> <label
								for="floatingInput">Email address</label>
						</div>
						<div class="form-floating mb-3">
							<input type="password" class="form-control rounded-4"
								id="floatingPassword" placeholder="Password"> <label
								for="floatingPassword">Password</label>
						</div>
						<button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary"
							type="submit">Sign up</button>
						<small class="text-muted">By clicking Sign up, you agree
							to the terms of use.</small>
						<hr class="my-4">
						<h2 class="fs-5 fw-bold mb-3">간편 로그인</h2>
						<button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4"
							type="submit">
							<svg class="bi me-1" width="16" height="16">
								<img src="../images/kakao.png" width="16" height="16"></svg>
							Sign up with KaKao
						</button>
						<button class="w-100 py-2 mb-2 btn btn-outline-primary rounded-4"
							type="submit">
							<svg class="bi me-1" width="16" height="16">
								<use xlink:href="#facebook" /></svg>
							Sign up with Facebook
						</button>

					</form>
				</div>
			</div>
		</div>
	</div>