<html lang="en"><head>
    <meta charset="utf-8">
    <title>slidePhoto.jsp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

    <!-- Demo styles -->
    <style>
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .swiper {
        margin-left: auto;
        margin-right: auto;
      }
    </style>
  </head>

  <body>
    <!-- Swiper -->
    <div class="swiper mySwiper swiper-initialized swiper-horizontal swiper-pointer-events">
		<div class="swiper-wrapper" id="swiper-wrapper-bc48b346f2a7d954" aria-live="polite" style="transition-duration: 0ms; transform: translate3d(-19500px, 0px, 0px);">
		<div class="swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev" data-swiper-slide-index="8" role="group" aria-label="9 / 9" style="width: 1920px; margin-right: 30px;"></div>
		<div class="swiper-slide swiper-slide-duplicate-active" data-swiper-slide-index="0" role="group" aria-label="1 / 6" style="width: 1920px; margin-right: 30px;"><img src="../assets/img/portfolio/table1.jpg" style="width: 300px; height: 300px;" /></div>
        <div class="swiper-slide" data-swiper-slide-index="1" role="group" aria-label="2 / 6" style="width: 1920px; margin-right: 30px;"><img src="../assets/img/portfolio/table2.jpg" style="width: 300px; height: 300px;" /></div>
        <div class="swiper-slide" data-swiper-slide-index="2" role="group" aria-label="3 / 6" style="width: 1920px; margin-right: 30px;"><img src="../assets/img/portfolio/table3.jpg" style="width: 300px; height: 300px;" /></div>
        <div class="swiper-slide" data-swiper-slide-index="3" role="group" aria-label="4 / 6" style="width: 1920px; margin-right: 30px;"><img src="../assets/img/portfolio/table4.jpg" style="width: 300px; height: 300px;" /></div>
        <div class="swiper-slide" data-swiper-slide-index="4" role="group" aria-label="5 / 6" style="width: 1920px; margin-right: 30px;"><img src="../assets/img/portfolio/table5.jpg" style="width: 300px; height: 300px;" /></div>
        <div class="swiper-slide swiper-slide-prev swiper-slide-duplicate-next" data-swiper-slide-index="6" role="group" aria-label="6 / 6" style="width: 1920px; margin-right: 30px;"><img src="../assets/img/portfolio/table6.jpg" style="width: 300px; height: 300px;" /></div>
		<div class="swiper-slide swiper-slide-duplicate swiper-slide-active" data-swiper-slide-index="0" role="group" aria-label="1 / 6" style="width: 1920px; margin-right: 30px;"></div></div>
		<div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide" aria-controls="swiper-wrapper-bc48b346f2a7d954"></div>
		<div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide" aria-controls="swiper-wrapper-bc48b346f2a7d954"></div>
		<div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal">
		<span class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button" aria-label="Go to slide 1"></span>
		<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 2"></span>
		<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 3"></span>
		<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 4"></span>
		<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 5"></span>
		<span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 6"></span></div>
    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
  

</body></html>