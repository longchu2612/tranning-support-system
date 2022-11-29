<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Permission</title>
        <link href="../css/style-dashboard.css" rel="stylesheet" />
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="home">Edu champ</a>
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
                            <a class="nav-link" href="${requestScope.website_url}/dashboard">
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
                                <nav class="nav-link "  class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link " href="${requestScope.website_url}/Dashboard/setting-list" >Setting list</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseUser" aria-expanded="false" aria-controls="collapseUser">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-user-tie"></i></div>
                                User
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseUser" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="nav-link " href="${requestScope.url}/Dashboard/UserList" class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link " href="${requestScope.website_url}/Dashboard/user-list" >User list</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSubject" aria-expanded="false" aria-controls="collapseSubject">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-book"></i></div>
                                Subject
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseSubject" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">                                 
                                    <a class="nav-link " href="${requestScope.website_url}/Dashboard/subject-list">                                      
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
                        <h1 class="mt-4">Permission</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a class="text-decoration-none" href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Permission</li>
                        </ol>
                        <div class="card mb-4">
                            <form action ="permission" method="POST">
                                <div class="row">                               
                                    <c:forEach items="${requestScope.permission_list}" var="pl">      
                                        <div class="col-6">
                                            <p class="h5">Url: ${pl[0].setting.setting_value}</p>
                                            <table id="datatablesSimple" class="table">
                                                <thead>
                                                <th><input type="hidden" name="screens_id" value="${pl[0].setting.setting_id}"></th>
                                                <th>Can view</th>
                                                <th>Can add</th>
                                                <th>Can edit</th>
                                                <th>Can delete</th>
                                                </thead>
                                                <tbody>    
                                                    <c:forEach items="${pl}" var="perm" varStatus="loop">
                                                        <tr>
                                                            <td>
                                                                ${requestScope.role_list[loop.index].setting_title}
                                                            </td>
                                                            <td>
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" name="${perm.setting.setting_id}-${requestScope.role_list[loop.index].setting_id}-1" value="1"
                                                                           <c:if test="${perm.get_all_data}">
                                                                               checked
                                                                           </c:if>>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" name="${perm.setting.setting_id}-${requestScope.role_list[loop.index].setting_id}-2" value="1"
                                                                           <c:if test="${perm.can_add}">
                                                                               checked
                                                                           </c:if>>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" name="${perm.setting.setting_id}-${requestScope.role_list[loop.index].setting_id}-3" value="1"
                                                                           <c:if test="${perm.can_edit}">
                                                                               checked
                                                                           </c:if>>

                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-check form-switch">
                                                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" name="${perm.setting.setting_id}-${requestScope.role_list[loop.index].setting_id}-4" value="1"
                                                                           <c:if test="${perm.can_delete}">
                                                                               checked
                                                                           </c:if>>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:forEach>                                   
                                </div>
                                <input type="hidden" name="screen_url" value="${requestScope.url}page=${requestScope.page}">
                                <div class="row">
                                    <div class="col-6">
                                        <div>
                                            <div class="text-center"><button class="btn btn-primary btn-xl text-uppercase"
                                                                             id="submitButton" type="submit">Submit</button></div>
                                        </div>
                                    </div>
                                    <div class="col-6 ">
                                        <nav class="justify-content-center" aria-label="Page navigation example">                                    
                                            <ul id="bot_pagger" class="pagination">
                                            </ul>
                                        </nav>
                                    </div>
                                </div>


                            </form>

                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                    </div>
                </footer>
            </div>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            render("bot_pagger", ${requestScope.page}, ${requestScope.totalpage}, 2, "${requestScope.url}");
        </script>requestScope
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    </body>
</html>
