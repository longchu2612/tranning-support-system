<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Eval criteria</title>
        <link href="../css/style-dashboard.css" rel="stylesheet" />

        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        
        <script type="text/javascript">
            function doDeleteCriteria(id, name) {
                if (confirm("Are you sure delete criteria " + name)) {
                    window.location = "eval-criteria?delete=" + id;
                }
            }
        </script>
        <script type="text/javascript">
            function doChangeStatus(id, name, status) {
                if (confirm("Bạn có chắc chắn đổi trạng thái của " + name + "!")) {
                    window.location = "eval-criteria?id_change_status=" + id + "&status=" + status;
                }
            }
        </script>
    </head>
    <body class="sb-nav-fixed">
        <div id="layoutSidenav">
            <jsp:include page="SideBarAndNavBar.jsp"/>
            <div id="layoutSidenav_content">
                <!--người dùng click vào "thêm"-->
                <c:if test="${requestScope.add != null}">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Add eval criteria</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active"><a href="eval-criteria">Eval criteria</a> </li>
                            </ol>
                            <div class="card">
                                <c:if test="${requestScope.list_subject != null}">
                                    <center>
                                        <form action="eval-criteria">
                                            <!--check vao doAdd-->
                                            <input type="hidden" name="id_add" value="add"> 
                                            <!--check subject-->
                                            <input type="hidden" name="check_subject" value="exitst">
                                            <select class="btn btn-outline-warning" name="id_subject">
                                                <c:forEach items="${requestScope.list_subject}" var="s">
                                                    <option value="${s.subject_id}">${s.subject_name}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="submit" value="CHECK" class="btn btn-outline-warning">
                                        </form>
                                    </center>
                                </c:if>
                                <!--sau khi người dùng click vào check subject-->
                                <c:if test="${requestScope.list_subject == null}">
                                    <div class="card">
                                        <form id="contactForm" class="was-validated" action ="eval-criteria">
                                            <div class="col-md-6 ">
                                                <input type="hidden" name="click_add" value="add">
                                                <input type="hidden" name="id_add" value="add">
                                                <div>
                                                    <p class="h4">Môn: ${requestScope.subject.subject_name} </p>
                                                </div>
                                                <!--request all assigment-->
                                                <div class="form-group position-relative">
                                                    <label for="name" class="form-label h4">Assignment:</label>
                                                    <select name="assignment_add" class="btn btn-outline-warning">
                                                        <c:forEach var="a" items="${requestScope.list_assignment}">
                                                            <option value="${a.ass_id}">${a.title}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group mb-md-0 position-relative">
                                                    <label class="form-label h4">Tiêu chí</label>
                                                    <input name="criteria_name"  class="form-control" id="mobile" placeholder="Tên tiêu chí"
                                                           required>
                                                </div>
                                                <div>
                                                    <p class="h4">Làm việc nhóm:</p>
                                                    <div>
                                                        <input name="is_team_eval" value="1" type="radio" checked="true"> Yes
                                                        <input name="is_team_eval" value="0" type="radio" > No
                                                    </div>

                                                </div>
                                                <div>
                                                    <label class="form-label h4">Eval weight</label>
                                                    <input type="text" class="form-control" aria-label="file example" name="evalWeight">
                                                </div>
                                                <div>
                                                    <label class="form-label h4">Chỉ tiêu</label>
                                                    <input value="" type="text" class="form-control" aria-label="file example" name="maxLoc" >
                                                </div>
                                                <!--status-->
                                                <div>
                                                    <p class="h4">Trạng thái:</p>
                                                    <div>
                                                        <input name="status" value="1" type="radio" checked="true"> Active
                                                        <input name="status" value="0" type="radio" > Deactive
                                                    </div>
                                                </div>
                                                <div>
                                                    <label class="form-label h4">Mô tả: </label>
                                                    <input  type="text" class="form-control" aria-label="file example" name="description">
                                                </div>

                                            </div>
                                            <c:if test="${requestScope.mess_error == null}">
                                                <div style="margin-top: 25px;">
                                                    <div class="text-center"><button class="btn btn-primary btn-xl text-uppercase"id="submitButton" type="submit">Thêm</button>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${requestScope.mess_error != null}">
                                                <h4 class="alert alert-danger">${requestScope.mess_error}</h4>
                                            </c:if>
                                        </form>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </main>
                </c:if>

                <!--khi người dùng click vào link--> 
                <!--màn hình sẽ hiển thị ra list criteria--> 
                <!--Trong này bao gồm list criteria sau khi phân trang và list sau khi search & lọc-->
                <c:if test="${requestScope.add == null}">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Eval criteria</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active"><a href="eval-criteria">Eval criteria</a></li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-body">
                                    <c:if test="${requestScope.mess_add!=null}">
                                        <h4 class="alert alert-success"> ${requestScope.mess_add}</h4>
                                    </c:if>
                                    <form action="eval-criteria" method="get" style="display: flex"> 
                                        <input name="id_search" type="hidden" value="search">

                                        <!--lọc theo subject-->
                                        <div class="input-group" style="margin-left: 100px">
                                            <select class="btn btn-outline-warning" name="filter_subject">
                                                <c:forEach var="s" items="${requestScope.list_subject}">
                                                    <option style="color: black" value="${s.subject_id}">${s.subject_name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="input-group">
                                            <select class="btn btn-outline-warning" name="ass">
                                                <option value="1">Assignment</option>
                                                <option value="0">a</option>
                                            </select>
                                        </div>

                                        <!--lọc theo status-->
                                        <div class="input-group">
                                            <select class="btn btn-outline-warning" name="filter_status">
                                                <option value="1">Đang hoạt động</option>
                                                <option value="0">Đã dừng hoạt động</option>
                                            </select>
                                        </div>
                                        <div class="input-group">
                                            <c:if test="${requestScope.key_search == null}">
                                                <input name = "search" value="" class="form-control" type="text" placeholder="Tìm kiếm theo tiêu chí..." aria-label="Search for..." aria-describedby="btnSearch" />
                                            </c:if>
                                            <c:if test="${requestScope.key_search != null}">
                                                <input name = "search" value="${requestScope.key_search}" class="form-control" type="text" placeholder="Tìm kiếm theo tiêu chí..." aria-label="Search for..." aria-describedby="btnSearch" />
                                            </c:if>
                                            <button class="btn btn-primary" id="btnNavbarSearch" type="submit"><i class="fas fa-search"></i></button>
                                        </div>
                                        <a href="eval-criteria?id_add=add" class="btn btn-outline-success" >Thêm</a>

                                    </form>
                                    <c:if test="${requestScope.mess_change_status!= null}">
                                        <h6 class="alert alert-success">${requestScope.mess_change_status}</h6>
                                    </c:if>
                                    <table id="datatablesSimple" class="table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tiêu chí</th>
                                                <th>Môn</th>
                                                <th>Assignmet</th>
                                                <th>Trạng thái</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <!--Neu khong search-->
                                            <c:if test="${requestScope.mess_not_found == null}">
                                                <c:if test="${requestScope.data_search == null}">
                                                    <c:forEach var="e" items="${requestScope.list_criteria}">
                                                        <tr>
                                                            <td>${e.criteria_id}</td>
                                                            <td>${e.criteria_name}</td>
                                                            <td>${e.ass_id.subject_id.subject_name}</td>

                                                            <td>${e.ass_id.title}</td>
                                                            <c:if test="${e.status == true}">
                                                                <td style="color: greenyellow"> 
                                                                    <a href="#" onclick="doChangeStatus('${e.criteria_id}', '${e.criteria_name}', '0')" class="btn btn-outline-success">Ðang hoạt động</a>
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${e.status == false}">
                                                                <td style="color: red">
                                                                    <a href="#" onclick="doChangeStatus('${e.criteria_id}', '${e.criteria_name}', '1')" class="btn btn-outline-danger">Dừng hoạt động</a>
                                                                </td>
                                                            </c:if>
                                                            <td>
                                                                <a class="btn btn-outline-info" href="eval-criteria?id_eval=${e.criteria_id}">Chi tiết</a>
                                                                <a href="#" onclick="doDeleteCriteria('${e.criteria_id}', '${e.criteria_name}')" class="btn btn-outline-danger">Xóa</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </c:if>

                                                <c:if test="${requestScope.data_search != null}">
                                                    <c:forEach var="e" items="${requestScope.data_search}">
                                                        <tr>
                                                            <td>${e.criteria_id}</td>
                                                            <td>${e.criteria_name}</td>
                                                            <td>${e.ass_id.title}</td>
                                                            <td>${e.ass_id.subject_id.subject_name}</td>
                                                            <c:if test="${e.status == true}">
                                                                <td style="color: greenyellow">Đang hoạt động 
                                                                    <a href="#" onclick="doChangeStatus('${e.criteria_id}', '${e.criteria_name}', '0')" class="btn btn-outline-success"><img src="https://toppng.com//public/uploads/preview/blue-edit-icon-change-black-icon-11553444930fj2oheswkx.png" width="20px" height="20px" alt="alt"/></a>
                                                                </td>
                                                            </c:if>
                                                            <c:if test="${e.status == false}">
                                                                <td style="color: red">Đã dừng hoạt động
                                                                    <a href="#" onclick="doChangeStatus('${e.criteria_id}', '${e.criteria_name}', '1')" class="btn btn-outline-success"><img src="https://toppng.com//public/uploads/preview/blue-edit-icon-change-black-icon-11553444930fj2oheswkx.png" width="20px" height="20px" alt="alt"/></a>
                                                                </td>
                                                            </c:if>
                                                            F
                                                            <td>
                                                                <a class="btn btn-outline-info" href="eval-criteria?id_eval=${e.criteria_id}">Chi tiết</a>
                                                                <a href="#" onclick="doDeleteCriteria('${e.criteria_id}', '${e.criteria_name}')" class="btn btn-outline-danger">Xóa</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </c:if>
                                            </c:if>
                                            <c:if test="${requestScope.mess_not_found != null}">
                                            <h4 class="alert alert-danger">Không tìm thấy!</h4>
                                        </c:if>

                                        </tbody>

                                    </table>
                                    <div>
                                        <div style="display: flex">
                                            <c:forEach  begin="1" end="${requestScope.total_page}" var="i">
                                                <div  class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
                                                    <div  class="btn-group me-2" role="group" aria-label="First group">
                                                        <a href="eval-criteria?page=${i}" class="btn btn-primary">${i}</a>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    </body>
</html>