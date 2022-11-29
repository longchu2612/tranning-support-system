<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Milestone List</title>
        <link href="../css/style-dashboard.css" rel="stylesheet" />
        <script src="../js/pagger.js" type="text/javascript"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function doDeleteMilestone(id, name) {
                if (confirm("Are you sure delete milestone " + name)) {
                    window.location = "milestone?id_delete=" + id;
                }
            }
        </script>
    </head>
    <body class="sb-nav-fixed">
        <div id="layoutSidenav">
            <jsp:include page="SideBarAndNavBar.jsp"/>
            <div id="layoutSidenav_content">

                <c:if test="${requestScope.add!= null}">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Add Milestone </h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Milestone List</li>
                            </ol>
                            <div class="card">
                                <form action="milestone">
                                    <div class="col-md-6 ">
                                        <input type="hidden" name="click_add" value="add">
                                        <input type="hidden" name="id_add" value="add">

                                        <div class="form-group position-relative">
                                            <label for="name" class="form-label h4">Assignment(<label style="color: red"> *</label>):</label>
                                            <select name="assignment_add" class="btn btn-outline-warning" style=" width: 250px">
                                                <c:forEach var="a" items="${requestScope.list_assignment}">
                                                    <option value="${a.ass_id}">${a.title}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="form-group mb-md-0 position-relative">
                                            <label for="name" class="form-label h4">Lớp(<label style="color: red"> *</label>):</label>

                                            <select name="class_add" class="btn btn-outline-warning" style="margin-left: 90px; width: 250px">
                                                <c:forEach items="${requestScope.list_class}" var="c">
                                                    <option value="${c.class_id}">${c.class_code}</option>>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div>
                                            <label class="h4" class="form-label h4">Từ ngày(<label style="color: red"> *</label>):</label>
                                            <input type="date" name="fromdate" class="btn btn-outline-warning" required style="margin-left: 40px ; width: 250px">

                                        </div>
                                        <div>
                                            <label class="h4" class="form-label h4">Đến ngày(<label style="color: red"> *</label>):</label>
                                            <input type="date" name="todate" class="btn btn-outline-warning" required style="margin-left: 25px ; width: 250px">

                                        </div>

                                        <div>
                                            <label class="form-label h4">Tiêu đề(<label style="color: red"> *</label>):</label>
                                            <input type="text" class="form-control" aria-label="file example" placeholder="Tên tiêu đề" name="title" required title="Vui lòng nhập tiêu đề!">
                                        </div>

                                        <div>
                                            <label class="form-label h4">Nội dung bài tập:</label>
                                            <!--<input type="text" class="form-control" aria-label="file example" name="ass_body" placeholder="Nội dung" >-->
                                            <textarea id="id" name="ass_body" rows="5" cols="90" placeholder="Nội dung..."></textarea>
                                        </div>
                                        <!--status-->
                                        <div>
                                            <p class="h4">Trạng thái:</p>
                                            <div>
                                                <input name="status" value="1" type="radio" checked="true"> Bật
                                                <input name="status" value="0" type="radio" > Tắt
                                            </div>
                                        </div>
                                        <div>
                                            <label class="form-label h4">Mô tả: </label>
                                            <!--<input  type="text" class="form-control" aria-label="file example" name="description" placeholder="Mô tả" value="${requestScope.description}">-->
                                            <textarea id="id" name="description" rows="5" cols="90" placeholder="Mô tả..."></textarea>
                                        </div>
                                        <input type="submit" name="name" value="Thêm" class="btn btn-outline-success">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </main>
                </c:if>
                <c:if test="${requestScope.add == null}">

                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Milestone list</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Milestone List</li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-body">
                                    <form action="milestone" method="get" style="display: flex">


                                        <div class="input-group">
                                            <c:if test="${requestScope.key_search == null}">
                                                <input name = "search" value="" class="form-control" type="text" placeholder="Tìm kiếm theo tiêu đề..." aria-label="Search for..." aria-describedby="btnSearch" />
                                            </c:if>
                                            <c:if test="${requestScope.key_search != null}">
                                                <input name = "search" value="${requestScope.key_search}" class="form-control" type="text" placeholder="Tìm kiếm theo tiêu đề..." aria-label="Search for..." aria-describedby="btnSearch" />
                                            </c:if>
                                            <button class="btn btn-primary" id="btnNavbarSearch" type="submit"><i class="fas fa-search"></i></button>
                                        </div>
                                        <a href="milestone?id_add=add" class="btn btn-outline-success" >Thêm</a>
                                    </form>
                                    <c:if test="${requestScope.mess_add != null}">
                                        <h4 class="alert alert-success">${requestScope.mess_add}</h4>
                                    </c:if>
                                    <c:if test="${requestScope.mess_add_error != null}">
                                        <h4 class="alert alert-danger">${requestScope.mess_add_error}</h4>
                                    </c:if>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tiêu đề</th>
                                                <th>Assignment</th>
                                                <th>Lớp</th>
                                                <th>Từ ngày</th>
                                                <th>Đến ngày</th>
                                                <th>Trạng thái</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!--Neu khong search-->
                                            <c:if test="${requestScope.data_search == null}">
                                                <c:forEach var="m" items="${requestScope.list_milestone}">
                                                    <tr>
                                                        <td>${m.milestone_id}</td>
                                                        <td>${m.title}</td>

                                                        <td>${m.ass.title}</td>
                                                        <td>${m.class_id.class_code}</td>
                                                        <td>${m.from_date}</td>
                                                        <td>${m.to_date}</td>

                                                        <c:if test="${m.status}">
                                                            <td style="color: green">Active</td><!-- comment -->
                                                        </c:if>
                                                        <c:if test="${!m.status}">
                                                            <td style="color: red">Detive</td><!-- comment -->
                                                        </c:if>
                                                        <td>
                                                            <a class="btn btn-outline-info" href="milestone?id_detail=${m.milestone_id}">Chi tiết</a>
                                                            <a href="#" onclick="doDeleteMilestone('${m.milestone_id}', '${m.title}')" class="btn btn-outline-danger">Xóa</a>

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${requestScope.data_search != null}">
                                                <c:forEach var="m" items="${requestScope.data_search}">
                                                    <tr>
                                                        <td>${m.milestone_id}</td>
                                                        <td>${m.ass.title}</td>
                                                        <td>${m.class_id.class_code}</td>
                                                        <td>${m.from_date}</td>
                                                        <td>${m.to_date}</td>
                                                        <td>${m.title}</td>
                                                        <td>${m.ass_body}</td><!-- comment -->
                                                        <td>${m.description}</td><!-- comment -->

                                                        <c:if test="${m.status}">
                                                            <td>Active</td><!-- comment -->
                                                        </c:if>
                                                        <c:if test="${!m.status}">
                                                            <td>Detive</td><!-- comment -->
                                                        </c:if>
                                                        <td>
                                                            <a class="btn btn-outline-info" href="milestone?id_detail=${m.milestone_id}">Chi tiết</a>
                                                            <a href="#" onclick="doDeleteMilestone('${m.milestone_id}', '${m.title}')" class="btn btn-outline-danger">Xóa</a>

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div>
                                <div style="display: flex">
                                    <c:forEach  begin="1" end="${requestScope.total_page}" var="i">
                                        <div  class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                            <div  class="btn-group me-2" role="group" aria-label="First group">
                                                <a href="milestone?page=${i}" class="btn btn-primary">${i}</a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </main>
                </c:if>
                <footer class="py-4 bg-light mt-auto">
                    <jsp:include page="../Footter.jsp"/>
                </footer>
            </div>
        </div>
        <script src="../js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>