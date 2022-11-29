<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Subject List</title>
        <link href="../css/style-dashboard.css" rel="stylesheet" />
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Start Bootstrap</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="${requestScope.website_url}/Dashboard">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>    
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSetting" aria-expanded="false" aria-controls="collapseSetting">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-gear"></i></div>
                                Setting
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseSetting" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a >Setting list</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseUser">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-user-tie"></i></div>
                                User
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="${requestScope.website_url}/Dashboard/user-list">User list</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSubject" aria-expanded="false" aria-controls="collapseSubject">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-book"></i></div>
                                Subject
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseSubject" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav  class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">                                 
                                    <a class="nav-link" href="${requestScope.website_url}/Dashboard/subject-list">                                      
                                        Subject List
                                    </a>
                                </nav>
                            </div>
                            <a class="nav-link" href="${requestScope.website_url}/Dashboard/permission">
                                <i class="fa-solid fa-eye"></i>
                                Permission
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Subject list</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a class="text-decoration-none" href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Subject list</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form action="SubjectList" method="Get">                                         
                                    <div class="input-group">
                                        <input name = "search" class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnSearch" />
                                        <button class="btn btn-primary" id="btnNavbarSearch" type="submit"><i class="fas fa-search"></i></button>
                                    </div>
                                </form>
                                <table id="datatablesSimple" class="table">
                                    <thead>
                                        <tr>
                                            <th>Subject code</th>
                                            <th>Subject name</th>
                                            <th>Manager name</th>
                                            <th>Expert name</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.subject_list}" var="sl">                               
                                            <tr>
                                                <td>${sl.subject_code}</td>     
                                                <td>${sl.subject_name}</td> 
                                                <td><a class="text-decoration-none" href="${requestScope.website_url}/Dashboard/user-detail?userId=${sl.manager.id}">${sl.manager.full_name}</a></td> 
                                                <td><a class="text-decoration-none" href="${requestScope.website_url}/Dashboard/user-detail?userId=${sl.expert.id}">${sl.expert.full_name}</a></td> 
                                                    <c:if test="${sl.status}">
                                                    <td class="active">Active</td>   
                                                </c:if>
                                                <c:if test="${!sl.status}">
                                                    <td class="inactive">Inactive</td>  
                                                </c:if>

                                                <td><a href="${requestScope.path}${sl.subject_id}"><i class="fa-solid fa-eye"></i></a><span> </span>
                                                    <a class="link-danger" href="${requestScope.website_url}/Dashboard/user-detail?userId=${sl.expert.id}"><i class="fa fa-trash" ></i></a></td> 
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <nav aria-label="Page navigation example">                                    
                                    <ul id="bot_pagger" class="pagination">
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                    </div>
                </footer>
            </div>
        </div>
        <script>
            render("bot_pagger",${requestScope.page}, ${requestScope.totalpage}, 2, "${requestScope.url}");
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    </body>
</html>
