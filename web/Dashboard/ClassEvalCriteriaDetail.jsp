<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Class eval detail</title>
        <link href="../css/style-dashboard.css" rel="stylesheet" />
        <script src="../js/pagger.js" type="text/javascript"></script>

        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <div id="layoutSidenav">
            <jsp:include page="SideBarAndNavBar.jsp"/>
            <div id="layoutSidenav_content">


                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Class eval criteria detail</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item"><a href="class_evalcriteria">Class eval criteria list</a></li>
                            <li class="breadcrumb-item active">Class eval Criteria Detail</li>
                        </ol>
                        <div class="card col-md-12"  >
                            <center><h2 class="alert-info">DETAILS </h2> </center>

                            <c:set var="cr" value="${requestScope.eval}"/>
                            <div class="form-group position-relative">
                                <p class="h4">ID: ${cr.criteria_id} </p>
                            </div>
                            <div class="form-group mb-md-0 position-relative">
                                <h3 for="name" class="form-label h4" >Lớp:<label style="color: #00be8e ; font-size: 30px">${cr.milestone_id.class_id.class_code}</label></h3>
                            </div>
                            <div class="form-group mb-md-0 position-relative">
                                <h3 for="name" class="form-label h4" >Mốc:<label style="color: #00be8e ; font-size: 30px">${cr.milestone_id.title}</label></h3>
                            </div>
                            <div class="col-md-11" style="margin-left: 20px">

                                <form id="contactForm" class="was-validated" action ="class_evalcriteria" >
                                    <input type="hidden" name="id_update" value="${cr.criteria_id}">

                                    <div class="col-md-12 ">


                                        <input type="hidden" name="id" value="${cr.criteria_id}">

                                        <div class="form-group mb-md-0 position-relative">
                                            <label for="mobile" class="form-label h4">Tiêu chí</label>
                                            <input name="criteria_name"  class="form-control" id="mobile" placeholder="Tên tiêu chí"
                                                   value="${cr.criteria_name}"  required>
                                        </div>

                                        <div>
                                            <p class="h4">Làm việc nhóm:</p>
                                            <c:if test="${cr.is_team_eval}">
                                                <div>
                                                    <input name="is_team_eval" value="1" type="radio" checked="true"> Yes
                                                    <input name="is_team_eval" value="0" type="radio" > No
                                                </div>
                                            </c:if>
                                            <c:if test="${!cr.is_team_eval}">
                                                <div>
                                                    <input name="is_team_eval" value="1" type="radio" > Yes
                                                    <input name="is_team_eval" value="0" type="radio" checked="true"> No
                                                </div>
                                            </c:if>
                                        </div>
                                        <div>
                                            <label class="form-label h4">Eval weight</label>
                                            <input value="${cr.eval_weight}" type="text" class="form-control" aria-label="file example" name="evalWeight" required required pattern="[0-9]{1,3}" title="Vui lòng nhập số từ 0-100!" >
                                        </div>
                                        <c:if test="${requestScope.mess_err_weight != null}">
                                            <label style="color: red">Vui lòng nhập số từ 0-100!</label>
                                        </c:if>
                                        <div>
                                            <label class="form-label h4">Chỉ tiêu</label>
                                            <input value="${cr.max_loc}" type="text" class="form-control" aria-label="file example" name="maxLoc"  pattern="[0-9]{1,8}" title="Vui lòng nhập số tự nhiên!">
                                        </div>
                                        <!--status-->
                                        <div>
                                            <p class="h4">Trạng thái:</p>
                                            <c:if test="${cr.status}">
                                                <div>
                                                    <input name="status" value="1" type="radio" checked="true"> Active
                                                    <input name="status" value="0" type="radio" > Deactive
                                                </div>
                                            </c:if>
                                            <c:if test="${!cr.status}">
                                                <div>
                                                    <input name="status" value="1" type="radio" > Đang hoạt động
                                                    <input name="status" value="0" type="radio" checked="true"> Đã dừng hoạt động
                                                </div>
                                            </c:if>
                                        </div>
                                        <div>
                                            <label class="form-label h4">Mô tả: </label>
                                            <textarea value="" type="text" class="form-control" aria-label="file example" name="description">${cr.description}</textarea>
                                        </div>
                                        <c:if test="${requestScope.mess != null}">
                                            <h4 class="alert alert-success">${requestScope.mess}</h4>
                                        </c:if>
                                    </div>
                                    <div style="margin-top: 25px;">
                                        <div class="text-center"><button class="btn btn-primary btn-xl text-uppercase"
                                                                         id="submitButton" type="submit">Sửa</button>
                                        </div>
                                    </div>
                                </form><!-- comment -->
                            </div>
                        </div>
                    </div>
                </main>
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
