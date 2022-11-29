<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Eval detail</title>
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
                        <h1 class="mt-4">Eval criteria detail</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item"><a href="eval-criteria">Eval criteria list</a></li>
                            <li class="breadcrumb-item active">Eval Criteria Detail</li>
                        </ol>
                        <div class="card">
                            <form id="contactForm" class="was-validated" action ="eval-criteria" method="">
                                <div class="col-md-6 ">
                                    <c:set var="cr" value="${requestScope.eval}"/>
                                    <div >
                                        <p class="h4">ID: ${cr.criteria_id} </p>
                                        <input type="hidden" name="id" value="${cr.criteria_id}">
                                    </div>
                                    <div >
                                        <p class="h4">Môn: ${cr.ass_id.subject_id.subject_name} </p>
                                    </div>

                                    <!--request all assigment-->
                                    <div class="form-group position-relative">
                                        <label for="name" class="form-label h4">Assigment:</label>
                                        <select name="assignment" class="btn btn-outline-warning">
                                            <c:forEach var="a" items="${requestScope.list_ass}">
                                                <option value="${a.ass_id}">${a.title}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
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
                                        <input value="${cr.eval_weight}" type="text" class="form-control" aria-label="file example" name="evalWeight">
                                    </div>
                                    <div>
                                        <label class="form-label h4">Chỉ tiêu</label>
                                        <input value="${cr.max_loc}" type="text" class="form-control" aria-label="file example" name="maxLoc" >
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
                                                <input name="status" value="1" type="radio" > Active
                                                <input name="status" value="0" type="radio" checked="true"> Deactive
                                            </div>
                                        </c:if>
                                    </div>
                                    <div>
                                        <label class="form-label h4">Mô tả: </label>
                                        <input value="${cr.description}" type="text" class="form-control" aria-label="file example" name="description">
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
                            </form>
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
