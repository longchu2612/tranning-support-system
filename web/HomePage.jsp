<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Home</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>

    <body id="page-top">
        <!-- Navigation-->
        <jsp:include page="Hearder.jsp"/>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Học một cách dễ dàng</div>
                <div class="masthead-heading text-uppercase">Hãy chọn một khóa học ngay hôm nay</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tìm hiểu thêm</a>
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="thamGiaNgay">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Tham gia ngay</h2>
                    <h3 class="section-subheading text-muted">Hãy tham gia để hoàn thiện bản thân.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-solid fa-right-to-bracket fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Đơn giản</h4>
                        <p class="text-muted">Đăng ký dễ dàng.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-solid fa-book fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Đa dạng</h4>
                        <p class="text-muted">Hơn 100 khóa học để bạn lụa chọn.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-sharp fa-solid fa-users fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Chuyên gia</h4>
                        <p class="text-muted">Với đội ngũ chuyên gia sẵn sàng giải quyết mọi thắc mắc 24/7.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Khóa học</h2>
                    <h3 class="section-subheading text-muted">Khóa học mới</h3>
                </div>
                <div class="row">
                    <c:forEach var="s" items="${requestScope.list}">
                        <div class="col-lg-4 col-sm-6 mb-4 btn btn-outline-warning">
                            <!-- Portfolio item 1-->
                            <div class="portfolio-item">
                                <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                                    <div class="portfolio-hover">
                                        <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                                    </div>
                                    <!--==================Image course=====================-->
                                    <!--<img class="img-fluid" src="assets/img/bg" alt="..." />-->
                                </a>
                                <div class="portfolio-caption">
                                    <div class="portfolio-caption-heading" style="color: #00be8e">${s.subject_code}</div>
                                    <div class="portfolio-caption-subheading text-muted">${s.subject_name}</div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <center><a href="Dashboard/SubjectList" target="target" class="btn btn-outline-success">Xem tất cả khóa học</a></center>
                </div>
            </div>
        </section>
        <!-- Contact-->
        <jsp:include page="Footter.jsp" />
        <!-- Footer-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <script src="js/scripts_1.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>


    </body>

</html>