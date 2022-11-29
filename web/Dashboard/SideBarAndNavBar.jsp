<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">

    <a class="navbar-brand ps-3" href="home"></a>
    <a class="btn btn-outline-warning" id="sidebarToggle" href="../home"><label style="font-size: 30px;color: white">Trang chủ</label></a>
    <!-- Navbar Search-->
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group"></div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><img style="width: 30px ; height: 30px" src="${sessionScope.acc.avatar_url}" alt="alt"/></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="../home">Trang chủ</a></li>
                <!--=======-->
                <li><a class="dropdown-item" href="#!">Profile</a></li>

                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="../login.jsp">Logout</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <a class="nav-link" href="Dashboard.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>
                        <div class="sb-sidenav-menu-heading">Admin</div>                      
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseUser">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-user-tie"></i></div>
                            User
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseUser" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="nav-link " class="sb-sidenav-menu-nested nav">
                                <a class="nav-link " href="/Dashboard/user-list" >User list</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="/Dashboard/permission">
                            <i class="fa-solid fa-eye"></i>
                            Permission
                        </a>
                        <div class="sb-sidenav-menu-heading">Admin/Manager</div>    

                        <div class="sb-sidenav-menu">
                            <div class="nav">

                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Khóa học
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="subject-list">Khóa học</a>
                                        <a class="nav-link" href="dashboard?option=3">Thống kê khóa học</a>
                                    </nav>
                                </div>

                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#eval" aria-expanded="false" aria-controls="eval">
                                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                    Ðánh giá
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="eval" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                        <div class="collapse" id="collapseSetting" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">

                                        </div>
                                        <a class="nav-link" href="eval-criteria">Đánh giá bài tập</a>
                                    </nav>
                                </div>
                                <div class="collapse" id="eval" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                        <div class="collapse" id="collapseSetting" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">

                                        </div>
                                        <a class="nav-link" href="class_evalcriteria">Đánh giá lớp</a>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#milestone" aria-expanded="false" aria-controls="milestone">
                                    <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                    Mooc
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="milestone" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                        <div class="collapse" id="collapseSetting" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                        </div>
                                        <a class="nav-link" href="milestone">List mooc</a>
                                    </nav>
                                </div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#schedule" aria-expanded="false" aria-controls="milestone">
                                    <div class="sb-nav-link-icon"><i class="fa fa-calendar" aria-hidden="true"></i>
                                    </div>
                                    Schedule
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="schedule" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                        <div class="collapse" id="collapseSetting" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                        </div>
                                        <a class="nav-link" href="/Dashboard/schedule-list">Schedule list</a>
                                    </nav>
                                </div>
                                <div class="collapse" id="schedule" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                        <div class="collapse" id="collapseSetting" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                        </div>
                                        <a class="nav-link" href="/Dashboard/schedule-add">Schedule add</a>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </nav>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            Start Bootstrap
        </div>
    </nav>
</div>
