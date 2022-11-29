<%-- 
    Document   : contactdetail
    Created on : Sep 24, 2022, 6:04:26 PM
    Author     : Acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web Contact Detail</title>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Contact</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">

        <div id="layoutSidenav">
            <jsp:include page="SideBar_NavBar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">

                        <div id="layoutAuthentication">
                            <div id="layoutAuthentication_content">
                                <main>
                                    <div class="container">
                                        <div class="row justify-content-center">
                                            <div class=" fs-4 fw-bold text-muted mt-4 " style="color: blue">Supporter : ${user.full_name }</div>

                                            <div class="col-lg-7">
                                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Contact Details</h3></div>
                                                    <div class="card-body">
                                                        <form action="web-contact-detail" method="POST">

                                                            <div class="row mb-4">

                                                                <div class="col-md-12">

                                                                    <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="category">
                                                                        <option selected>Open this select menu</option>
                                                                        <c:forEach items="${requestScope.listSetting }" var="lse">
                                                                            <option value="${lse.setting_id }">${lse.setting_title}</option>
                                                                        </c:forEach>
                                                                    </select>

                                                                </div>

                                                            </div>


                                                            <div class="row mb-2">
                                                                <div class="col-md-12">
                                                                    <div class="form-floating mb-3 mb-md-0">
                                                                        <input class="form-control" id="inputFirstName" name="name" type="text" placeholder="Enter your first name" />
                                                                        <label for="inputFirstName">Full Name</label>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                            <div class="row mb-2">

                                                                <div class="col-md-12">
                                                                    <div class="form-floating mb-3 mb-md-0">
                                                                        <input class="form-control" id="inputPhone" name="mobile" type="phone" placeholder="Enter your phone number"/>
                                                                        <label for="inputPhone">Mobile</label>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-floating mb-2">
                                                                <input class="form-control" id="inputEmail" name="email" type="email" placeholder="name@example.com" />
                                                                <label for="inputEmail">Email address</label>
                                                            </div>
                                                            <div class="row mb-2">

                                                                <div class="col-md-12">
                                                                    <div class="form-floating mb-3 mb-md-0">
                                                                        <input class="form-control" id="inputMessage" name="message" type="message" placeholder="Enter message"/>
                                                                        <label for="inputMessage">Message</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <input type="hidden" name="sid" value="${user.id}">
                                                            <div class="mt-4 mb-0">
                                                                <div class="d-grid"><input class="btn btn-primary btn-block" type="submit" value="Submit"></div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <!--  <div class="card-footer text-center py-3">
                                                          <div class="small"><a href="login.html">Have an account? Go to login</a></div>
                                                      </div>-->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </main>
                            </div>

                            </main>
                            <footer class="py-4 bg-light mt-auto">
                                <div class="container-fluid px-4">
                                    <div class="d-flex align-items-center justify-content-between small">
                                        <div class="text-muted">Copyright &copy; Your Website 2022</div>
                                        <div>
                                            <a href="#">Privacy Policy</a>
                                            &middot;
                                            <a href="#">Terms &amp; Conditions</a>
                                        </div>
                                    </div>
                                </div>
                            </footer>
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
                    <script src="assets/demo/chart-area-demo.js"></script>
                    <script src="assets/demo/chart-bar-demo.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
                    <script src="js/datatables-simple-demo.js"></script>
                    <!--<script src="js/fetchAPI.js"></script>-->
                    </body>
                    </html>
