<%@ page import="model.bean.Course" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--
      - primary meta tag
    -->
    <title>IT English</title>
    <meta name="title" content="EduWeb - The Best Program to Enroll for Exchange">
    <meta name="description" content="This is an education html template made by codewithsadee">

    <!--
      - favicon
    -->
    <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">

    <!--
      - custom css link
    -->


    <!--
      - google font link
    -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@400;500;600;700;800&family=Poppins:wght@400;500&display=swap"
            rel="stylesheet">

    <!--
      - preload images
    -->
    <link rel="preload" as="image" href="./assets/images/hero-bg.svg">
    <link rel="preload" as="image" href="./assets/images/hero-banner-1.jpg">
    <link rel="preload" as="image" href="./assets/images/hero-banner-2.jpg">
    <link rel="preload" as="image" href="./assets/images/hero-shape-1.svg">
    <link rel="preload" as="image" href="./assets/images/hero-shape-2.png">

    <link rel="stylesheet" type="text/css" href="./assets/css/style.scss">

</head>

<body id="top">

<!--
  - #HEADER
-->

<jsp:include page="layout/client/header.jsp"/>
<main>
    <article>

        <!--
          - #HERO
        -->
        <section class="section hero has-bg-image" id="home" aria-label="home"
                 style="background-image: url('./assets/images/hero-bg.svg')">
            <div class="container">

                <div class="hero-content">

                    <h1 class="h1 section-title">
                        Chào mừng đến với <span class="span">Trung tâm Anh ngữ</span>
                    </h1>

                    <p class="hero-text">
                        Đạt được mục tiêu tiếng Anh của bạn với đội ngũ giáo viên chuyên nghiệp và các khóa học được thiết kế riêng.
                    </p>

                    <a href="#courses" class="btn has-before">
                        <span class="span">Xem khóa học</span>

                        <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                    </a>

                </div>

                <figure class="hero-banner">

                    <div class="img-holder one" style="--width: 270; --height: 300;">
                        <img src="./assets/images/hero-banner-1.jpg" width="270" height="300" alt="Hình ảnh trung tâm" class="img-cover">
                    </div>

                    <div class="img-holder two" style="--width: 240; --height: 370;">
                        <img src="./assets/images/hero-banner-2.jpg" width="240" height="370" alt="Học viên tại trung tâm" class="img-cover">
                    </div>

                    <img src="./assets/images/hero-shape-1.svg" width="380" height="190" alt="" class="shape hero-shape-1">

                    <img src="./assets/images/hero-shape-2.png" width="622" height="551" alt="" class="shape hero-shape-2">

                </figure>

            </div>
        </section>


        <!--
          - #CATEGORY
        -->

        <!--
          - #COURSE
        -->

        <section class="section course" id="courses" aria-label="course">
            <div class="container">
                <p class="section-subtitle">Khóa học phổ biến</p>
                <h2 class="h2 section-title">Chọn một khóa học để bắt đầu</h2>
                <ul class="grid-list">
                    <%
                        List<Course> courses = (List<Course>) request.getAttribute("courseList");

                        if (courses != null && !courses.isEmpty()) {
                            for (Course course : courses) {
                                Integer studentCount = (Integer) request.getAttribute("studentCount_" + course.getId());
                    %>
                    <li>
                        <div class="course-card">
                            <figure class="card-banner img-holder" style="--width: 370; --height: 220;">
                                <img src="./assets/images/day-mon-tieng-anh.jpg" width="370" height="220" loading="lazy" alt="<%= course.getName() %>" class="img-cover">
                            </figure>

                            <div class="abs-badge">
                                <ion-icon name="time-outline" aria-hidden="true"></ion-icon>
                                <span class="span">
                            <%= course.getStartDate() %> - <%= course.getEndDate() %></span>
                            </div>

                            <div class="card-content">
                                <h3 class="h3">
                                    <span class="badge">Beginner</span>
                                    <a href="#" class="card-title"><%= course.getName() %></a>
                                </h3>

                                <div class="wrapper">
                                    <div class="rating-wrapper">
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                        <ion-icon name="star"></ion-icon>
                                    </div>
                                    <p class="rating-text">(5.0/5 Đánh giá)</p>
                                </div>

                                <data class="price" value="<%= course.getPrice() %>"><%= course.getPrice() %> đ</data>

                                <ul class="card-meta-list">
                                    <li class="card-meta-item">
                                        <ion-icon name="people-outline" aria-hidden="true"></ion-icon>
                                        <span class="span"><%= studentCount != null ? studentCount : 0 %> Học viên</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <%
                            }
                        }
                    %>
                </ul>

                <a href="#" class="btn has-before">
                    <span class="span">Xem thêm khóa học</span>
                    <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                </a>
            </div>
        </section>


        <!--
          - #ABOUT
        -->

        <section class="section about" id="about" aria-label="about">
            <div class="container">

                <figure class="about-banner">

                    <div class="img-holder" style="--width: 520; --height: 370;">
                        <img src="./assets/images/about-banner.jpg" width="520" height="370" loading="lazy" alt="Giới thiệu về chúng tôi"
                             class="img-cover">
                    </div>

                    <img src="./assets/images/about-shape-1.svg" width="360" height="420" loading="lazy" alt=""
                         class="shape about-shape-1">

                    <img src="./assets/images/about-shape-2.svg" width="371" height="220" loading="lazy" alt=""
                         class="shape about-shape-2">

                    <img src="./assets/images/about-shape-3.png" width="722" height="528" loading="lazy" alt=""
                         class="shape about-shape-3">

                </figure>

                <div class="about-content">

                    <p class="section-subtitle">Về Chúng Tôi</p>

                    <h2 class="h2 section-title">
                        Hơn 10 năm kinh nghiệm trong <span class="span">giảng dạy tiếng Anh</span> trực tuyến
                    </h2>

                    <p class="section-text">
                        Chúng tôi tự hào mang đến các khóa học tiếng Anh chất lượng, giúp học viên phát triển kỹ năng giao tiếp, học thuật và chuyên môn một cách hiệu quả.
                    </p>

                    <ul class="about-list">

                        <li class="about-item">
                            <ion-icon name="checkmark-done-outline" aria-hidden="true"></ion-icon>

                            <span class="span">Đội ngũ giảng viên chuyên nghiệp</span>
                        </li>

                        <li class="about-item">
                            <ion-icon name="checkmark-done-outline" aria-hidden="true"></ion-icon>

                            <span class="span">Học trực tuyến mọi lúc, mọi nơi</span>
                        </li>

                        <li class="about-item">
                            <ion-icon name="checkmark-done-outline" aria-hidden="true"></ion-icon>

                            <span class="span">Truy cập tài liệu học tập trọn đời</span>
                        </li>

                    </ul>

                    <img src="./assets/images/about-shape-4.svg" width="100" height="100" loading="lazy" alt=""
                         class="shape about-shape-4">

                </div>

            </div>
        </section>

        <section class="section category" aria-label="category">
            <div class="container">

                <p class="section-subtitle">Danh mục khóa học</p>

                <h2 class="h2 section-title">
                    Các <span class="span">khóa học tiếng Anh</span> trực tuyến cho mọi đối tượng
                </h2>

                <p class="section-text">
                    Lựa chọn từ các khóa học được thiết kế phù hợp với nhu cầu học tập và mục tiêu của bạn.
                </p>

                <ul class="grid-list">

                    <li>
                        <div class="category-card" style="--color: 170, 75%, 41%">

                            <div class="card-icon">
                                <img src="./assets/images/category-1.svg" width="40" height="40" loading="lazy"
                                     alt="Tiếng Anh giao tiếp" class="img">
                            </div>

                            <h3 class="h3">
                                <a href="#" class="card-title">Tiếng Anh giao tiếp</a>
                            </h3>

                            <p class="card-text">
                                Nâng cao kỹ năng giao tiếp tiếng Anh của bạn với các tình huống thực tế.
                            </p>


                        </div>
                    </li>

                    <li>
                        <div class="category-card" style="--color: 351, 83%, 61%">

                            <div class="card-icon">
                                <img src="./assets/images/category-2.svg" width="40" height="40" loading="lazy"
                                     alt="Luyện thi IELTS" class="img">
                            </div>

                            <h3 class="h3">
                                <a href="#" class="card-title">Luyện thi IELTS</a>
                            </h3>

                            <p class="card-text">
                                Chuẩn bị cho kỳ thi IELTS với chiến lược và bài học chuyên sâu.
                            </p>


                        </div>
                    </li>

                    <li>
                        <div class="category-card" style="--color: 229, 75%, 58%">

                            <div class="card-icon">
                                <img src="./assets/images/category-3.svg" width="40" height="40" loading="lazy"
                                     alt="Tiếng Anh học thuật" class="img">
                            </div>

                            <h3 class="h3">
                                <a href="#" class="card-title">Tiếng Anh học thuật</a>
                            </h3>

                            <p class="card-text">
                                Khám phá kiến thức học thuật với tiếng Anh chuẩn quốc tế.
                            </p>


                        </div>
                    </li>

                    <li>
                        <div class="category-card" style="--color: 42, 94%, 55%">

                            <div class="card-icon">
                                <img src="./assets/images/category-4.svg" width="40" height="40" loading="lazy"
                                     alt="Tiếng Anh doanh nghiệp" class="img">
                            </div>

                            <h3 class="h3">
                                <a href="#" class="card-title">Tiếng Anh doanh nghiệp</a>
                            </h3>

                            <p class="card-text">
                                Phát triển kỹ năng tiếng Anh chuyên nghiệp cho môi trường công việc.
                            </p>


                        </div>
                    </li>

                </ul>

            </div>
        </section>

        <!--
          - #VIDEO
        -->

        <section class="video has-bg-image" aria-label="video"
                 style="background-image: url('./assets/images/video-bg.png')">
            <div class="container">

                <div class="video-card">

                    <div class="video-banner img-holder has-after" style="--width: ; --height: ;">
                        <img src="./assets/images/video-banner.jpg" width="970" height="550" loading="lazy" alt="video banner"
                             class="img-cover">

                        <button class="play-btn" aria-label="play video">
                            <ion-icon name="play" aria-hidden="true"></ion-icon>
                        </button>
                    </div>

                    <img src="./assets/images/video-shape-1.png" width="1089" height="605" loading="lazy" alt=""
                         class="shape video-shape-1">

                    <img src="./assets/images/video-shape-2.png" width="158" height="174" loading="lazy" alt=""
                         class="shape video-shape-2">

                </div>

            </div>
        </section>


        <!--
          - #STATE
        -->

        <section class="section stats" aria-label="thống kê">
            <div class="container">

                <ul class="grid-list">

                    <li>
                        <div class="stats-card" style="--color: 170, 75%, 41%">
                            <h3 class="card-title">29.3k</h3>

                            <p class="card-text">Học viên đăng ký</p>
                        </div>
                    </li>

                    <li>
                        <div class="stats-card" style="--color: 351, 83%, 61%">
                            <h3 class="card-title">32.4K</h3>

                            <p class="card-text">Khóa học hoàn thành</p>
                        </div>
                    </li>

                    <li>
                        <div class="stats-card" style="--color: 260, 100%, 67%">
                            <h3 class="card-title">100%</h3>

                            <p class="card-text">Tỷ lệ hài lòng</p>
                        </div>
                    </li>

                    <li>
                        <div class="stats-card" style="--color: 42, 94%, 55%">
                            <h3 class="card-title">354+</h3>

                            <p class="card-text">Giảng viên hàng đầu</p>
                        </div>
                    </li>

                </ul>

            </div>
        </section>

        <!--
          - #BLOG
        -->
        <section class="section blog has-bg-image" id="blog" aria-label="blog"
                 style="background-image: url('./assets/images/blog-bg.svg')">
            <div class="container">

                <p class="section-subtitle">Bài viết mới nhất</p>

                <h2 class="h2 section-title">Cập nhật tin tức cùng Eduweb</h2>

                <ul class="grid-list">

                    <li>
                        <div class="blog-card">

                            <figure class="card-banner img-holder has-after" style="--width: 370; --height: 370;">
                                <img src="./assets/images/blog-1.jpg" width="370" height="370" loading="lazy"
                                     alt="Làm thế nào để trở thành blogger giỏi hơn: Lập kế hoạch nội dung" class="img-cover">
                            </figure>

                            <div class="card-content">

                                <a href="#" class="card-btn" aria-label="đọc thêm">
                                    <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                                </a>

                                <a href="#" class="card-subtitle">Học trực tuyến</a>

                                <h3 class="h3">
                                    <a href="#" class="card-title">Làm thế nào để trở thành blogger giỏi hơn: Lập kế hoạch nội dung</a>
                                </h3>

                                <ul class="card-meta-list">

                                    <li class="card-meta-item">
                                        <ion-icon name="calendar-outline" aria-hidden="true"></ion-icon>

                                        <span class="span">10 Tháng 10, 2021</span>
                                    </li>

                                    <li class="card-meta-item">
                                        <ion-icon name="chatbubbles-outline" aria-hidden="true"></ion-icon>

                                        <span class="span">Chủ đề: Viết Blog</span>
                                    </li>

                                </ul>

                                <p class="card-text">
                                    Học cách lập kế hoạch nội dung hiệu quả để trở thành blogger chuyên nghiệp.
                                </p>

                            </div>

                        </div>
                    </li>

                    <li>
                        <div class="blog-card">

                            <figure class="card-banner img-holder has-after" style="--width: 370; --height: 370;">
                                <img src="./assets/images/blog-2.jpg" width="370" height="370" loading="lazy"
                                     alt="5 kỹ năng giao tiếp tiếng Anh mà bạn cần biết" class="img-cover">
                            </figure>

                            <div class="card-content">

                                <a href="#" class="card-btn" aria-label="đọc thêm">
                                    <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                                </a>

                                <a href="#" class="card-subtitle">Học trực tuyến</a>

                                <h3 class="h3">
                                    <a href="#" class="card-title">5 kỹ năng giao tiếp tiếng Anh mà bạn cần biết</a>
                                </h3>

                                <ul class="card-meta-list">

                                    <li class="card-meta-item">
                                        <ion-icon name="calendar-outline" aria-hidden="true"></ion-icon>

                                        <span class="span">15 Tháng 11, 2021</span>
                                    </li>

                                    <li class="card-meta-item">
                                        <ion-icon name="chatbubbles-outline" aria-hidden="true"></ion-icon>

                                        <span class="span">Chủ đề: Giao tiếp</span>
                                    </li>

                                </ul>

                                <p class="card-text">
                                    Tìm hiểu những kỹ năng giao tiếp quan trọng giúp bạn tự tin khi nói tiếng Anh.
                                </p>

                            </div>

                        </div>
                    </li>

                    <li>
                        <div class="blog-card">

                            <figure class="card-banner img-holder has-after" style="--width: 370; --height: 370;">
                                <img src="./assets/images/blog-3.jpg" width="370" height="370" loading="lazy"
                                     alt="Cách học từ vựng tiếng Anh hiệu quả" class="img-cover">
                            </figure>

                            <div class="card-content">

                                <a href="#" class="card-btn" aria-label="đọc thêm">
                                    <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                                </a>

                                <a href="#" class="card-subtitle">Học trực tuyến</a>

                                <h3 class="h3">
                                    <a href="#" class="card-title">Cách học từ vựng tiếng Anh hiệu quả</a>
                                </h3>

                                <ul class="card-meta-list">

                                    <li class="card-meta-item">
                                        <ion-icon name="calendar-outline" aria-hidden="true"></ion-icon>

                                        <span class="span">20 Tháng 12, 2021</span>
                                    </li>

                                    <li class="card-meta-item">
                                        <ion-icon name="chatbubbles-outline" aria-hidden="true"></ion-icon>

                                        <span class="span">Chủ đề: Từ vựng</span>
                                    </li>

                                </ul>

                                <p class="card-text">
                                    Tìm hiểu cách áp dụng các phương pháp học từ vựng giúp bạn ghi nhớ lâu hơn.
                                </p>

                            </div>

                        </div>
                    </li>

                </ul>

                <img src="./assets/images/blog-shape.png" width="186" height="186" loading="lazy" alt=""
                     class="shape blog-shape">

            </div>
        </section>


    </article>
</main>

<!--
  - #FOOTER
-->

<jsp:include page="layout/client/footer.jsp"/>





<!--
  - #BACK TO TOP
-->

<a href="#top" class="back-top-btn" aria-label="back top top" data-back-top-btn>
    <ion-icon name="chevron-up" aria-hidden="true"></ion-icon>
</a>





<!--
  - custom js link
-->
<script src="./assets/js/script.js" defer></script>

<!--
  - ionicon link
-->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>

</html>