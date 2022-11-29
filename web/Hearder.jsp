<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="#page-top"><img src="assets/img/logo.png" alt="..." /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars ms-1"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                <li class="nav-item"><a class="nav-link" href="#thamGiaNgay">Tham gia ngay</a></li>
                <li class="nav-item"><a class="nav-link" href="#portfolio">Khoá học</a></li>
                <li class="nav-item"><a class="nav-link" href="#contact">Phản hồi</a></li>
            </ul>
        </div>
        <c:if test="${sessionScope.acc!=null}" >

            <a href="Dashboard/Dashboard.jsp" class="btn btn-primary btn-lg active" role="button" aria-pressed="true"
               style="margin-left: 20px;">Dashboard</a>
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><img style="width: 30px ; height: 30px" src="${sessionScope.acc.avatar_url}" alt="alt"/></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="home">Trang chủ</a></li>
                        <!--=======-->
                        <li><a class="dropdown-item" href="#!">Profile</a></li>

                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="login">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </c:if>
        <c:if test="${sessionScope.acc==null}" >
            <a href="login" class="btn btn-primary btn-lg active" role="button" aria-pressed="true"
               style="margin-left: 20px;">Đăng nhập</a>
            <a href="register.jsp" class="btn btn-primary btn-lg active" role="button" aria-pressed="true"
               style="margin-left: 10px;">Đăng ký</a>
        </c:if>
    </div>
</nav>