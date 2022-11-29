<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>

        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <title>Class eval criteria</title>

        <link href="../css/style-dashboard.css" rel="stylesheet" />
        <script src="../js/pagger.js" type="text/javascript"></script>
        <link href="../css/styles.css" rel="stylesheet" />

        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>



        <script type="text/javascript">
            function doDeleteCriteria(id, name) {
                if (confirm("Are you sure delete criteria " + name)) {
                    window.location = "class_evalcriteria?delete=" + id;
                }
            }
        </script>
        <script type="text/javascript">
            function doChangeStatus(id, name, status) {
                if (confirm("Bạn có chắc chắn đổi trạng thái của " + name + "!")) {
                    window.location = "class_evalcriteria?id_change_status=" + id + "&status=" + status;
                }
            }
        </script>
        <script>
            function checkAss() {
                document.getElementById("frm").submit();
            }
        </script>
        <script>
            function checkClass() {
                document.getElementById("frm-check-class").submit();
            }
        </script>
        <script>
            function checkAssignment() {
                document.getElementById("frm-check-assignment").submit();
            }
        </script>
        <script>
            function checkEval() {
                document.getElementById("frm-check-eval").submit();
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
                            <h1 class="mt-4">Add class eval criteria</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active"><a href="class_evalcriteria">Class eval criteria List</a> </li>
                                <li class="breadcrumb-item active">Add class eval criteria </li>
                            </ol>

                            <!--Class sau khi check được doAdd gửi sang-->
                            <c:set var="ms" value="${requestScope.mile_check}"/> 
                            <c:set var="ev" value="${requestScope.eval}"/> 


                            <div class="col-md-12" style="display: flex">

                                <!--===========ADD=========-->
                                <c:if test="${requestScope.id_add != null}">
                                    <div class="card col-md-12"  style="margin-right:  10px" >
                                        <center><h2 class="alert-info">THÊM MỚI</h2> </center>
                                        <div class="col-md-11">

                                            <!--FORM ADD-->
                                            <form class="was-validated" action ="class_evalcriteria">

                                                <div class="form-group position-relative">
                                                    <label for="name" class="form-label h4">Mooc:</label>
                                                    <select name="milestone_id" class="btn btn-warning">
                                                        <c:forEach var="m" items="${requestScope.list_mile}">
                                                            <option value="${m.milestone_id}">${m.title} </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-md-12 " style="margin-left: 20px">
                                                    <input type="hidden" name="click_add" value="add">
                                                    <input type="hidden" name="id_add" value="add">
                                                    <input type="hidden" name="class_id" value="${ev.milestone_id.class_id.class_id}">
                                                    <input type="hidden" name="eval_check" value="${ev.criteria_id}">

                                                    <div class="form-group mb-md-0 position-relative">
                                                        <label class="form-label h4">Tiêu chí(<label style="color: red"> *</label>):</label>
                                                        <input name="criteria_name"  class="form-control" id="mobile" placeholder="Tên tiêu chí" required value="${requestScope.name}">
                                                    </div>
                                                    <div>
                                                        <p class="h4">Làm việc nhóm:</p>
                                                        <div>
                                                            <input name="is_team_eval" value="1" type="radio" checked="true"> Không
                                                            <input name="is_team_eval" value="0" type="radio" > Có
                                                        </div>
                                                    </div>

                                                    <div>
                                                        <label class="form-label h4">Eval weight(<label style="color: red"> *</label>):</label>
                                                        <input v type="text" class="form-control" aria-label="file example" name="evalWeight" required pattern="[0-9]{1,8}" title="Vui lòng nhập số tự nhiên!" >
                                                    </div>

                                                    <c:if test="${requestScope.mess_eval_weight != null}">
                                                        <label style="color: red">${requestScope.mess_eval_weight}</label> 
                                                    </c:if>

                                                    <div>
                                                        <label class="form-label h4">Chỉ tiêu(<label style="color: red"> *</label>):</label>
                                                        <input value="${requestScope.maxloc}" type="text" class="form-control" aria-label="file example" name="maxLoc" required pattern="[0-9]{1,3}" title="Vui lòng nhập số từ 0-100!">
                                                    </div>

                                                    <!--status-->
                                                    <div>
                                                        <p class="h4">Trạng thái:</p>
                                                        <div>
                                                            <input name="status" value="1" type="radio" checked="true">Hoạt động
                                                            <input name="status" value="0" type="radio" > Không hoạt động

                                                        </div>
                                                    </div>

                                                    <div>
                                                        <label class="form-label h4">Mô tả: </label>
                                                        <textarea  type="text" class="form-control" aria-label="file example" name="description" >${requestScope.description}</textarea>
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
                                    </div>
                                </c:if>

                                <!--==============CLONE===========-->
                                <c:if test="${requestScope.id_clone != null}">
                                    <div class="card col-md-12"  style="margin-right:  10px" >
                                        <center><h2 class="alert-info">THÊM MỚI</h2> </center>
                                        <div class="col-md-11">
                                            <c:if test="${requestScope.eval == null}">
                                                <div class="col-md-12 " style="margin-left: 20px">
                                                    <!--FORM CHECK CLASS-->
                                                    <form id="frm-check-class" action="class_evalcriteria">
                                                        <!--check class-->
                                                        <input type="hidden" name="id_add" value="add">
                                                        <input type="hidden" name="check_milestone" value="check">
                                                        <div class="form-group position-relative">
                                                            <label for="name" class="form-label h4">Mooc:</label>
                                                            <select name="milestone_id" class="btn btn-warning">
                                                                <c:forEach var="m" items="${requestScope.list_mile}">
                                                                    <c:if test="${ms.milestone_id == m.milestone_id}">
                                                                        <option value="${m.milestone_id}" selected>${m.title}</option>
                                                                    </c:if>
                                                                    <c:if test="${ms.milestone_id != m.milestone_id}">
                                                                        <option value="${m.milestone_id}" >${m.title}</option>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </form>
                                                </div>
                                            </c:if>

                                            <c:if test="${requestScope.eval != null}">
                                                <div class="form-group position-relative">
                                                    <h3 for="name" class="form-label h4" >Lớp:<label style="color: #00be8e ; font-size: 30px">${ev.milestone_id.class_id.class_code}</label></h3>
                                                </div>
                                                <div class="form-group mb-md-0 position-relative">
                                                    <h3 class="form-label h4">Mốc:<label style="color: #00be8e">${ev.milestone_id.title}</label></h3>
                                                </div>
                                            </c:if>

                                            <!--FORM ADD-->
                                            <form class="was-validated" action ="class_evalcriteria">
                                                <div class="col-md-12 " style="margin-left: 20px">
                                                    <input type="hidden" name="click_add" value="add">
                                                    <input type="hidden" name="id_add" value="add">
                                                    <input type="hidden" name="class_id" value="${ev.milestone_id.class_id.class_id}">
                                                    <input type="hidden" name="eval_check" value="${ev.criteria_id}">

                                                    <div class="form-group mb-md-0 position-relative">
                                                        <label class="form-label h4">Tiêu chí(<label style="color: red"> *</label>):</label>
                                                        <input name="criteria_name"  class="form-control" id="mobile" placeholder="Tên tiêu chí" required value="${ev.criteria_name}">
                                                    </div>
                                                    <div>
                                                        <p class="h4">Làm việc nhóm:</p>
                                                        <div>
                                                            <c:if test="${ev.is_team_eval == true}">
                                                                <input name="is_team_eval" value="1" type="radio" checked="true"> Không
                                                                <input name="is_team_eval" value="0" type="radio" > Có
                                                            </c:if>
                                                            <c:if test="${ev.is_team_eval == false}">
                                                                <input name="is_team_eval" value="1" type="radio" > Không
                                                                <input name="is_team_eval" value="0" type="radio" checked="true"> Có
                                                            </c:if>
                                                        </div>
                                                    </div>

                                                    <div>
                                                        <label class="form-label h4">Eval weight(<label style="color: red"> *</label>):</label>
                                                        <input value="${ev.eval_weight}" type="text" class="form-control" aria-label="file example" name="evalWeight" required pattern="[0-9]{1,8}" title="Vui lòng nhập số tự nhiên!" >
                                                    </div>

                                                    <c:if test="${requestScope.mess_eval_weight != null}">
                                                        <label style="color: red">${requestScope.mess_eval_weight}</label> 
                                                    </c:if>

                                                    <div>
                                                        <label class="form-label h4">Chỉ tiêu(<label style="color: red"> *</label>):</label>
                                                        <input value="${ev.max_loc}" type="text" class="form-control" aria-label="file example" name="maxLoc" required pattern="[0-9]{1,3}" title="Vui lòng nhập số từ 0-100!">
                                                    </div>

                                                    <!--status-->
                                                    <div>
                                                        <p class="h4">Trạng thái:</p>
                                                        <div>
                                                            <c:if test="${ev.status == true}">
                                                                <input name="status" value="1" type="radio" checked="true">Hoạt động
                                                                <input name="status" value="0" type="radio" > Không hoạt động
                                                            </c:if>
                                                            <c:if test="${ev.status == false}">
                                                                <input name="status" value="1" type="radio" > Không
                                                                <input name="status" value="0" type="radio" checked="true"> Có
                                                            </c:if>
                                                        </div>
                                                    </div>

                                                    <div>
                                                        <label class="form-label h4">Mô tả: </label>
                                                        <textarea  type="text" class="form-control" aria-label="file example" name="description" >${ev.description}</textarea>
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
                            <h1 class="mt-4">Class Eval criteria list</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="Dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active"><a href="class_evalcriteria">Class Eval criteria list</a></li>
                            </ol>
                            <div class="card mb-4">
                                <div class="card-body">
                                    <c:if test="${requestScope.mess_add!=null}">
                                        <h4 class="alert alert-success"> ${requestScope.mess_add}</h4>
                                    </c:if>
                                    <form action="class_evalcriteria" method="get" style="display: flex"> 
                                        <input name="id_search" type="hidden" value="search"> <!--truyền id để gửi tín hiệu là click vào search-->

                                        <!--lọc theo Class-->
                                        <div class="input-group" style="margin-left: 100px">
                                            <select class="btn btn-warning" name="filter_id_class">
                                                <c:forEach var="cl" items="${requestScope.list_class}">
                                                    <c:if test="${requestScope.class_id == cl.class_id}">
                                                        <option value="${cl.class_id}" selected >${cl.class_code}</option>>
                                                    </c:if>
                                                    <c:if test="${requestScope.class_id != cl.class_id}">
                                                        <option style="color: black" value="${cl.class_id}">${cl.class_code} </option>
                                                    </c:if>

                                                </c:forEach>
                                                <option value="0" >--All Class--</option>

                                            </select>
                                        </div>


                                        <!--lọc theo status-->
                                        <div class="input-group">
                                            <select class="btn btn-warning" name="filter_status">
                                                <c:if test="${requestScope.status_s == 1}">
                                                    <option value="2">--All Status--</option>
                                                    <option value="1" selected>Đang hoạt động</option>
                                                    <option value="0" >Đã dừng hoạt động</option>
                                                </c:if>
                                                <c:if test="${requestScope.status_s == 0}">
                                                    <option value="2">--All Status--</option>
                                                    <option value="1" >Đang hoạt động</option>
                                                    <option value="0" selected>Đã dừng hoạt động</option>

                                                </c:if>
                                                <c:if test="${requestScope.status_s == null}">
                                                    <option value="1">Đang hoạt động</option>
                                                    <option value="0" >Đã dừng hoạt động</option>
                                                    <option value="2">--All Status--</option>

                                                </c:if>
                                                <c:if test="${requestScope.status_s == 2}">
                                                    <option value="2" selected>--All Status--</option>
                                                    <option value="1" >Đang hoạt động</option>
                                                    <option value="0" >Đã dừng hoạt động</option>
                                                </c:if>
                                            </select>
                                        </div>
                                        <div class="input-group">
                                            <div style="display: flex">

                                                <c:if test="${requestScope.key_search == null}">
                                                    <input name = "search" value="" class="form-control" type="text" placeholder="Tìm kiếm theo tiêu chí..." aria-label="Search for..." aria-describedby="btnSearch" />
                                                </c:if>
                                                <c:if test="${requestScope.key_search != null}">
                                                    <input name = "search" value="${requestScope.key_search}" class="form-control" type="text" placeholder="Tìm kiếm theo tiêu chí..." aria-label="Search for..." aria-describedby="btnSearch" />
                                                </c:if>
                                                <button class="btn btn-primary" id="btnNavbarSearch" type="submit"><i class="fas fa-search"></i></button>
                                            </div>
                                        </div>
                                        <a href="class_evalcriteria?id_add=add" class="btn btn-success" >Thêm</a>
                                    </form>

                                    <c:if test="${requestScope.mess_change_status!= null}">
                                        <h6 class="alert alert-success">${requestScope.mess_change_status}</h6>
                                    </c:if>
                                    <c:if test="${requestScope.mess_delete!= null}">
                                        <h6 class="alert alert-success">${requestScope.mess_delete}</h6>
                                    </c:if>
                                    <table id="datatablesSimple" class="table">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Tiêu chí
                                                    <!--action mac dinh-->
                                                    <c:if test="${requestScope.action_sort == null}"> 
                                                        <!--up == giam dan-->
                                                        <a href="class_evalcriteria?id_sort=name_down"><i class="fas fa-angle-down"></i></a>
                                                        </c:if>

                                                    <c:if test="${requestScope.action_sort != null}"> 
                                                        <!-- == 0 tức là đang sort giảm dần <=> hiện button tăng dần-->
                                                        <c:if test="${requestScope.action_sort == 0}"> 
                                                            <a href="class_evalcriteria?id_sort=name_up"><i class="fas fa-angle-up"></i></a>
                                                            </c:if>
                                                        <!-- == 1 tức là đang sort tăng dần <=> hiện button giảm dần-->

                                                        <c:if test="${requestScope.action_sort == 1}">
                                                            <a href="class_evalcriteria?id_sort=name_down"><i class="fas fa-angle-down"></i></a>
                                                            </c:if>
                                                        </c:if>                                                
                                                </th>
                                                <th>Lớp</th>
                                                <th>Eval weight 
                                                    <!--action mac dinh-->
                                                    <c:if test="${requestScope.action_sort == null}"> 
                                                        <!--up == giam dan-->
                                                        <a href="class_evalcriteria?id_sort=weight_down"><i class="fas fa-angle-down"></i></a>
                                                        </c:if>

                                                    <c:if test="${requestScope.action_sort != null}"> 
                                                        <!-- == 0 tức là đang sort giảm dần <=> hiện button tăng dần-->
                                                        <c:if test="${requestScope.action_sort == 0}"> 
                                                            <a href="class_evalcriteria?id_sort=weight_up"><i class="fas fa-angle-up"></i></a>
                                                            </c:if>
                                                        <!-- == 1 tức là đang sort tăng dần <=> hiện button giảm dần-->

                                                        <c:if test="${requestScope.action_sort == 1}">
                                                            <a href="class_evalcriteria?id_sort=weight_down"><i class="fas fa-angle-down"></i></a>
                                                            </c:if>
                                                        </c:if>     </th>
                                                <th>Trạng thái</th>
                                                <th>Chỉ tiêu</th>
                                                <th>Mốc</th>
                                                <th>Làm nhóm</th>
                                                <th>Nút</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <!--Neu khong search-->
                                            <c:if test="${requestScope.data_search == null}">
                                                <c:forEach var="e" items="${requestScope.list_class_criteria}">
                                                    <tr>
                                                        <td>${e.criteria_id}</td>
                                                        <td>${e.criteria_name}</td>
                                                        <td>${e.milestone_id.class_id.class_code}</td>

                                                        <c:if test="${e.eval_weight == 100}">
                                                            <td style="color: green;font: bold">${e.eval_weight}%</td>
                                                        </c:if>
                                                        <c:if test="${e.eval_weight < 100}">
                                                            <td style="color: red;font: bold">${e.eval_weight}%</td>
                                                        </c:if>


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
                                                            ${e.max_loc}
                                                        </td>    
                                                        <td>
                                                            ${e.milestone_id.title}
                                                        </td>    
                                                        <td>
                                                            <c:if test="${e.is_team_eval == true}">
                                                                Có
                                                            </c:if>
                                                            <c:if test="${e.is_team_eval == false}">
                                                                Không
                                                            </c:if>

                                                        </td>

                                                        <td>
                                                            <a class="btn btn-info" href="class_evalcriteria?id_eval=${e.criteria_id}"><i class="far fa-eye"></i></a>
                                                            <a href="#" onclick="doDeleteCriteria('${e.criteria_id}', '${e.criteria_name}')" class="btn btn-danger"><i class="fas fa-prescription-bottle"></i></a>
                                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal"><i class="fas fa-redo"></i></button>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="myModal" role="dialog">
                                                                <div class="modal-dialog">
                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                            <h4 class="modal-title">Bạn có muốn đổi trạng thái của tiêu chí ${e.criteria_name}</h4>
                                                                        </div>
                                                                        <div class="modal-body"><p>Chọn...</p></div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                                                                            <c:if test="${e.status == true}">
                                                                                <a href="class_evalcriteria?id_change_status=${e.criteria_id}&status=0" class="btn btn-default" >Đổi</a>
                                                                            </c:if>
                                                                            <c:if test="${e.status == false}">
                                                                                <a href="class_evalcriteria?id_change_status=${e.criteria_id}&status=1" class="btn btn-default" >Đổi</a>
                                                                            </c:if>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <a class="btn btn-info" href="class_evalcriteria?id_clone=${e.criteria_id}"><i class="fas fa-clone"></i></a>

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>

                                            <c:if test="${requestScope.data_search != null}">
                                                <c:forEach var="e" items="${requestScope.data_search}">
                                                    <tr>
                                                        <td>${e.criteria_id}</td>
                                                        <td>${e.criteria_name}</td>
                                                        <td>${e.milestone_id.class_id.class_code}</td>

                                                        <c:if test="${e.eval_weight == 100}">
                                                            <td style="color: green;font: bold">${e.eval_weight}%</td>
                                                        </c:if>
                                                        <c:if test="${e.eval_weight < 100}">
                                                            <td style="color: red;font: bold">${e.eval_weight}%</td>
                                                        </c:if>

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
                                                            ${e.max_loc}
                                                        </td>    
                                                        <td>
                                                            ${e.milestone_id.title}
                                                        </td>    
                                                        <td>
                                                            <c:if test="${e.is_team_eval == true}">
                                                                Có
                                                            </c:if>
                                                            <c:if test="${e.is_team_eval == false}">
                                                                Không
                                                            </c:if>

                                                        </td>
                                                        <td>
                                                            <a class="btn btn-info" href="class_evalcriteria?id_eval=${e.criteria_id}"><i class="far fa-eye"></i></a>
                                                            <a href="#" onclick="doDeleteCriteria('${e.criteria_id}', '${e.criteria_name}')" class="btn btn-danger"><i class="fas fa-prescription-bottle"></i></a>
                                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal"><i class="fas fa-redo"></i></button>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="myModal" role="dialog">
                                                                <div class="modal-dialog">
                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                            <h4 class="modal-title">Bạn có muốn đổi trạng thái của tiêu chí ${e.criteria_name}</h4>
                                                                        </div>
                                                                        <div class="modal-body"><p>Chọn...</p></div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                                                                            <c:if test="${e.status == true}">
                                                                                <a href="class_evalcriteria?id_change_status=${e.criteria_id}&status=0" class="btn btn-default" >Đổi</a>
                                                                            </c:if>
                                                                            <c:if test="${e.status == false}">
                                                                                <a href="class_evalcriteria?id_change_status=${e.criteria_id}&status=1" class="btn btn-default" >Đổi</a>
                                                                            </c:if>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <a class="btn btn-info" href="class_evalcriteria?id_eval=${e.criteria_id}"><i class="fas fa-clone"></i></a>

                                                        </td>
                                                    </tr>
                                                </c:forEach>

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
                                                        <a href="class_evalcriteria?page=${i}" class="btn btn-warning">${i}</a>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

    </body>
</html>