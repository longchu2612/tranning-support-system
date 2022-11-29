<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Schedule List</title>
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
                        <h1 class="mt-4">Schedule list</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a class="text-decoration-none" href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Schedule list</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <form action="schedule-list" method="Get">                                         
                                    <div class="input-group justify-content-start">
                                        <div class="col-3">
                                            <select class="form-select" name="class" onchange="this.form.submit()">
                                                <c:forEach items="${requestScope.class_list}" var="cl">
                                                    <option value="${cl.class_id}"
                                                            <c:if test="${cl.class_id eq requestScope.selected_class}">
                                                                selected
                                                            </c:if>
                                                            >
                                                    <a href="${requestScope.website_url}/Dashboard/schedule-list?classId=${cl.class_id}">${cl.class_code}</a>
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-5">

                                        </div>
                                        <div class="col-3">
                                            <input name = "search" class="form-control" type="search" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnSearch" value="${requestScope.search}" />
                                        </div>
                                        <button class="btn btn-primary" id="btnNavbarSearch" type="submit"><i class="fas fa-search"></i></button>
                                    </div>
                                </form>
                                <div class="row">
                                    <div class="col-10">

                                    </div>
                                    <div class="col-2">
                                        <a href="${requestScope.website_url}/Dashboard/schedule-add" class="btn btn-primary" tabindex="-1" role="button" aria-disabled="true">Add</a>
                                    </div>
                                </div>
                                <table id="datatablesSimple" class="table">
                                    <thead>
                                        <tr>
                                            <c:if test="${requestScope.sort eq 0}">
                                                <c:if test="${requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=0&order=FALSE'">Slot <i class="fa-solid fa-sort-up"></i> </th>
                                                    </c:if>
                                                    <c:if test="${!requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=0&order=TRUE'">Slot <i class="fa-solid fa-sort-down"></i></th>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.sort ne 0}">
                                                <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=0&order=TRUE'">Slot <i class="fa-solid fa-sort"></i></th>
                                                </c:if>
                                                <c:if test="${requestScope.sort eq 1}">
                                                    <c:if test="${requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=1&order=FALSE'">Topic <i class="fa-solid fa-sort-up"></i> </th>
                                                    </c:if>
                                                    <c:if test="${!requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=1&order=TRUE'">Topic <i class="fa-solid fa-sort-down"></i></th>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.sort ne 1}">
                                                <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=1&order=TRUE'">Topic <i class="fa-solid fa-sort"></i></th>
                                                </c:if>
                                                <c:if test="${requestScope.sort eq 2}">
                                                    <c:if test="${requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=2&order=FALSE'">Date <i class="fa-solid fa-sort-up"></i> </th>
                                                    </c:if>
                                                    <c:if test="${!requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=2&order=TRUE'">Date <i class="fa-solid fa-sort-down"></i></th>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.sort ne 2}">
                                                <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=2&order=TRUE'">Date <i class="fa-solid fa-sort"></i></th>
                                                </c:if>
                                                <c:if test="${requestScope.sort eq 3}">
                                                    <c:if test="${requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=3&order=FALSE'">From Time <i class="fa-solid fa-sort-up"></i> </th>
                                                    </c:if>
                                                    <c:if test="${!requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=3&order=TRUE'">From Time <i class="fa-solid fa-sort-down"></i></th>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.sort ne 3}">
                                                <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=3&order=TRUE'">From Time <i class="fa-solid fa-sort"></i></th>
                                                </c:if>
                                                <c:if test="${requestScope.sort eq 4}">
                                                    <c:if test="${requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=4&order=FALSE'">To Time <i class="fa-solid fa-sort-up"></i> </th>
                                                    </c:if>
                                                    <c:if test="${!requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=4&order=TRUE'">To Time <i class="fa-solid fa-sort-down"></i></th>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.sort ne 4}">
                                                <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=4&order=TRUE'">To Time <i class="fa-solid fa-sort"></i></th>
                                                </c:if>
                                                <c:if test="${requestScope.sort eq 5}">
                                                    <c:if test="${requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=5&order=FALSE'">Room<i class="fa-solid fa-sort-up"></i> </th>
                                                    </c:if>
                                                    <c:if test="${!requestScope.order}">
                                                    <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=5&order=TRUE'">Room<i class="fa-solid fa-sort-down"></i></th>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${requestScope.sort ne 5}">
                                                <th onclick="window.location.href = '${requestScope.website_url}/Dashboard/schedule-list?classId=${requestScope.selected_class}&search=${requestScope.search}&sort=5&order=TRUE'">Room<i class="fa-solid fa-sort"></i></th>
                                                </c:if>
                                            <th>Status</th>
                                                <c:if test="${requestScope.role}">
                                                <th>Take Attendance</th>
                                                </c:if>                                           
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.schedule_list}" var="sl">                               
                                            <tr>
                                                <td>${sl.slot.setting_value}</td>
                                                <td>${sl.topic}</td>
                                                <td><fmt:formatDate pattern = "dd-MM-yyyy" value = "${sl.date}"/></td>
                                                <td><fmt:formatDate pattern = "HH:mm" value = "${sl.from_time}"/></td>                                              
                                                <td><fmt:formatDate pattern = "HH:mm" value = "${sl.to_time}"/></td>      
                                                <td>${sl.room.setting_value}</td>
                                                <c:if test="${sl.status}">
                                                    <td class="active">Taken</td>   
                                                </c:if>
                                                <c:if test="${!sl.status}">
                                                    <td class="inactive">Not yet</td>  
                                                </c:if>
                                                <c:if test="${requestScope.role}">
                                                    <td>
                                                        <a type="button" class="btn btn-outline-primary" href="${requestScope.website_url}/Dashboard/take-attendance?scheduleId=${sl.schedule_id}"><i class="fa-solid fa-user-check"></i></a>                                            
                                                    </td>
                                                </c:if>
                                                <td>
                                                    <a href="${requestScope.website_url}/Dashboard/schedule-detail?scheduleId=${sl.schedule_id}"><i class="fa-solid fa-eye"></i></a>                                            
                                                </td>                                              
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="row">
                                    <div class="col-10">
                                        <nav aria-label="Page navigation example">                                    
                                            <ul id="bot_pagger" class="pagination">
                                            </ul>
                                        </nav>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>

                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                    </div>
                </footer>
            </div>
            <div class="modal fade" id="modelComfirm" tabindex="-1" aria-hidden="false" show>
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Add successfully </h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Schedule detail has been added successfully.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            render("bot_pagger", ${requestScope.page}, ${requestScope.totalpage}, 2, "${requestScope.url}");
        </script>
        <c:if test="${requestScope.add}">
            <script>
                var myModal = new bootstrap.Modal(document.getElementById("modelComfirm"), {});
                document.onreadystatechange = function () {
                    myModal.show();
                };
            </script>
        </c:if>
        <script src="js/scripts.js"></script>
    </body>
</html>
