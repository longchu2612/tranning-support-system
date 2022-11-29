<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>User Detail</title>
        <link href="../css/style-dashboard.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
        <link href="css/styles.css" rel="stylesheet" />
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
            <jsp:include page="SideBarAndNavBar.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4 ">
                        <h1 class="mt-4">User list</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a class="text-decoration-none" href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item"><a class="text-decoration-none" href="${requestScope.website_url}/Dashboard/user-list">User List</a></li>
                            <li class="breadcrumb-item active">User Detail</li>
                        </ol>
                        <!-- Modal -->
                        <div class="modal fade" id="modelComfirm" tabindex="-1" aria-hidden="false" show>
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="exampleModalLabel">Save successfully </h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        User detail has been saved successfully.
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <form id="contactForm" class="was-validated col-md-12" style="margin-left: 10px" action ="user-detail" method="POST">
                                <div class="col-md-6">
                                    <div>
                                        <p class="h4">ID: ${requestScope.user.id}</p>
                                        <input type="hidden" name="id" value="${requestScope.user.id}">
                                    </div>
                                    <div class="form-group position-relative">
                                        <label for="name" class="form-label h4">Full name</label>
                                        <input name = "fullname" class="form-control" id="name" type="text" placeholder="Full name" value="${requestScope.user.full_name}" required />
                                        <div class="invalid-tooltip">
                                            Need input name.
                                        </div>
                                    </div>
                                    <div class="form-group position-relative">
                                        <label for="name" class="form-label h4">Gmail</label>
                                        <input name="gmail" type="email" class="form-control" id="email" placeholder="Gmail"
                                               pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" value="${requestScope.user.gmail}" required>
                                        <div class="invalid-tooltip">
                                            Need input gmail.
                                        </div>
                                    </div>
                                    <div class="form-group mb-md-0 position-relative">
                                        <label for="mobile" class="form-label h4">Mobile</label>
                                        <input name="mobile" type="tel" class="form-control" id="mobile" placeholder="Số điện thoại"
                                               value="${requestScope.user.mobile}" pattern="[0-9]{10,11}"  required>
                                        <div class="invalid-tooltip">
                                            Need input phone with length between 10-11 number.
                                        </div>
                                    </div>
                                    <div>
                                        <p class="h4">Status</p>
                                        <div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="status" id="flexRadioDefault1" value="1"
                                                       <c:if test="${requestScope.user.status eq 1}">
                                                           checked
                                                       </c:if>
                                                       >
                                                <label class="form-check-label" for="flexRadioDefault1">
                                                    Active
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="status" id="1" value ="0"
                                                       <c:if test="${requestScope.user.status eq 0}">
                                                           checked
                                                       </c:if>>
                                                <label class="form-check-label" for="2">
                                                    Deactive
                                                </label>                                                
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="status" id="" value ="-1"
                                                       <c:if test="${requestScope.user.status eq -1}">
                                                           checked
                                                       </c:if>>
                                                <label class="form-check-label" for="-1">
                                                    Unverified
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <label class="form-label h4">Avatar</label>
                                        <input type="file" class="form-control" aria-label="file example" name="avatar">
                                    </div>
                                    <div class="mb-3 position-relative">
                                        <label class="form-label h4">Role</label>
                                        <select class="form-select" required aria-label="select role" name="role">
                                            <c:forEach items="${requestScope.role_list}" var="rl">                               
                                                <option value="${rl.setting_id}" 
                                                        <c:if test="${requestScope.user.setting_id eq rl.setting_id}">
                                                            selected="selected"
                                                        </c:if>>${rl.setting_title}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-tooltip">
                                            Need select role.
                                        </div>
                                    </div>
                                    <div class="form-group form-group-textarea mb-md-0 position-relative">
                                        <label class="form-label h4">Note</label>                    
                                        <textarea class="form-control" id="note" placeholder="Note" name="note">${requestScope.user.note}</textarea>
                                    </div>
                                </div>
                                <div style="margin-top: 25px;">
                                    <div class="text-center"><button class="btn btn-primary btn-xl text-uppercase"
                                                                     id="submitButton" type="submit">Submit</button></div>
                                </div>
                            </form>
                        </div>

                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                    </div>
                </footer>
            </div>
        </div>
        <c:if test="${requestScope.save}">
            <script>
                var myModal = new bootstrap.Modal(document.getElementById("modelComfirm"), {});
                document.onreadystatechange = function () {
                    myModal.show();
                };
            </script>
        </c:if>
        <script>
            render("bot_pagger", ${requestScope.page}, ${requestScope.totalpage}, 2, "${requestScope.url}");
        </script>
        <script src="js/scripts.js"></script>
    </body>
</html>
