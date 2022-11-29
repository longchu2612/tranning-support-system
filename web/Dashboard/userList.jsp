<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>User List</title>
        <link href="../css/style-dashboard.css" rel="stylesheet" />
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <div id="layoutSidenav">
            <jsp:include page="SideBarAndNavBar.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">User</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a class="text-decoration-none" href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">User list</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form action="user-list" method="Get">                                         
                                    <div class="input-group">
                                        <input name = "search" class="form-control" type="search" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnSearch" value="${requestScope.search}" />
                                        <button class="btn btn-primary" id="btnNavbarSearch" type="submit"><i class="fas fa-search"></i></button>
                                    </div>
                                </form>
                                <div class="row">
                                    <div class="col-10">

                                    </div>
                                    <div class="col-2">
                                        <a type="button" href="/Dashboard/user-add" class="btn btn-primary"><i class="fa-solid fa-plus"></i>Add user</a>
                                    </div>
                                </div>

                                <table id="datatablesSimple" class="table">
                                    <thead>
                                        <tr>
                                            <c:if test="${requestScope.sort eq 0}">
                                                <c:if test="${requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/user-list?search=${requestScope.search}&sort=0&order=FALSE'">ID <i class="fa-solid fa-sort-up"></i> </th>
                                                    </c:if>
                                                    <c:if test="${!requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/user-list?search=${requestScope.search}&sort=0&order=TRUE'">ID <i class="fa-solid fa-sort-down"></i></th>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.sort ne 0}">
                                                <th onclick="window.location.href = '/Dashboard/user-list?search=${requestScope.search}&sort=0&order=TRUE'">ID <i class="fa-solid fa-sort"></i></th>
                                                </c:if>
                                                <c:if test="${requestScope.sort eq 1}">
                                                    <c:if test="${requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/user-list?search=${requestScope.search}&sort=1&order=FALSE'">Full name<i class="fa-solid fa-sort-up"></i> </th>
                                                    </c:if>
                                                    <c:if test="${!requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/user-list?search=${requestScope.search}&sort=1&order=TRUE'">Full name<i class="fa-solid fa-sort-down"></i></th>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.sort ne 1}">
                                                <th onclick="window.location.href = '/Dashboard/user-list?search=${requestScope.search}&sort=1&order=TRUE'">Full name<i class="fa-solid fa-sort"></i></th>
                                                </c:if>
                                                <c:if test="${requestScope.sort eq 2}">
                                                    <c:if test="${requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/user-list?search=${requestScope.search}&sort=2&order=FALSE'">Gmail<i class="fa-solid fa-sort-up"></i> </th>
                                                    </c:if>
                                                    <c:if test="${!requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/user-list?search=${requestScope.search}&sort=2&order=TRUE'">Gmail<i class="fa-solid fa-sort-down"></i></th>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.sort ne 2}">
                                                <th onclick="window.location.href = '/Dashboard/user-list?search=${requestScope.search}&sort=2&order=TRUE'">Gmail<i class="fa-solid fa-sort"></i></th>
                                                </c:if>
                                                <c:if test="${requestScope.sort eq 3}">
                                                    <c:if test="${requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/user-list?search=${requestScope.search}&sort=3&order=FALSE'">Mobile<i class="fa-solid fa-sort-up"></i> </th>
                                                    </c:if>
                                                    <c:if test="${!requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/user-list?search=${requestScope.search}&sort=3&order=TRUE'">Mobile<i class="fa-solid fa-sort-down"></i></th>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.sort ne 3}">
                                                <th onclick="window.location.href = '/Dashboard/user-list?search=${requestScope.search}&sort=3&order=TRUE'">Mobile<i class="fa-solid fa-sort"></i></th>
                                                </c:if>   
                                            <th>Role</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.user_list}" var="ul">                               
                                            <tr>
                                                <td>${ul.id}</td>
                                                <td>${ul.full_name}</td>
                                                <td>${ul.gmail}</td>
                                                <td>${ul.mobile}</td>                                              
                                                <td>${ul.role}</td>
                                                <c:if test="${ul.status ne -1}">
                                                    <td class="active">Verified</td>   
                                                </c:if>
                                                <c:if test="${ul.status eq -1}">
                                                    <td class="inactive">Unverified</td>  
                                                </c:if>
                                                <td>                                                   
                                                    <a href="/Dashboard/user-detail?userId=${ul.id}"><i class="fa-solid fa-eye"></i></a>
                                                    <a class="link-danger" onclick="deleteUrl(${ul.id})"><i class="fa fa-trash"></i></a>                                                   
                                                </td>                                              
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
        <!-- Modal -->
        <div class="modal fade" id="modelComfirm" tabindex="-1" aria-hidden="false" show>
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Add successfully </h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        User has been added successfully.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modelDelete" tabindex="-1" aria-hidden="false" show>
            <div class="modal-dialog">  
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Remove user</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Are you sure you want to remove this user?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <a class="btn btn-danger" href="" id="removeLink">Remove</a>
                    </div>
                </div>
            </div>
        </div>
        <script>
            render("bot_pagger", ${requestScope.page}, ${requestScope.totalpage}, 2, "${requestScope.url}");
            function deleteUrl(id) {
                var myModal = new bootstrap.Modal(document.getElementById("modelDelete"), {})
                myModal.show();
                document.getElementById("removeLink").href = "${requestScope.url}page=" + "${requestScope.page}" + "&action=delete&userId=" + id;
            }
        </script>
        <c:if test="${requestScope.add}">
            <script>
                var myModal = new bootstrap.Modal(document.getElementById("modelComfirm"), {});
                document.onreadystatechange = function () {
                    myModal.show();
                };
            </script>
        </c:if>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    </body>
</html>
