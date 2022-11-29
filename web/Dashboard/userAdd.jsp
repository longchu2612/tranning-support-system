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
        <div id="layoutSidenav">
            <jsp:include page="SideBarAndNavBar.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4 ">
                        <h1 class="mt-4">User list</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a class="text-decoration-none" href="/dashboard">Dashboard</a></li>
                            <li class="breadcrumb-item"><a class="text-decoration-none" href="/Dashboard/user-list">User List</a></li>
                            <li class="breadcrumb-item active">User Detail</li>
                        </ol>                        
                        <div class="card">
                            <form id="contactForm" class="needs-validation col-md-12" style="margin-left: 10px" action ="user-add" method="POST" novalidate>
                                <div class="col-md-6">
                                    <div class="form-group position-relative">
                                        <label for="name" class="form-label h4">Full name</label>
                                        <input name = "fullname" class="form-control" id="name" type="text" placeholder="Full name" value="" required />
                                        <div class="invalid-tooltip">
                                            Need input name.
                                        </div>
                                    </div>
                                    <div class="form-group position-relative">
                                        <label for="name" class="form-label h4">Gmail</label>
                                        <input name="gmail" type="email" class="form-control" id="email" placeholder="Gmail"
                                               pattern="[A-Za-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" value="" required>
                                        <div class="invalid-tooltip">
                                            Need input gmail.
                                        </div>
                                    </div>
                                    <div class="form-group mb-md-0 position-relative">
                                        <label for="mobile" class="form-label h4">Mobile</label>
                                        <input name="mobile" type="tel" class="form-control" id="mobile" placeholder="Số điện thoại"
                                               value="" pattern="[0-9]{10,11}"  required>
                                        <div class="invalid-tooltip">
                                            Need input phone with length between 10-11 number.
                                        </div>
                                    </div>
                                    <div>
                                        <p class="h4">Status</p>
                                        <div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="status" id="flexRadioDefault1" value="1">
                                                <label class="form-check-label" for="flexRadioDefault1">
                                                    Active
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="status" id="1" value ="0">
                                                <label class="form-check-label" for="2">
                                                    Deactive
                                                </label>                                                
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="status" id="" value ="-1" checked>
                                                <label class="form-check-label" for="-1">
                                                    Unverified
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3 position-relative">
                                        <label class="form-label h4">Role</label>
                                        <select class="form-select" required aria-label="select role" name="role">
                                            <c:forEach items="${requestScope.role_list}" var="rl">                               
                                                <option value="${rl.setting_id}">
                                                    ${rl.setting_title}
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
            var forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function (form)
            {
                form.addEventListener('submit', function (event)
                {
                    if (!form.checkValidity( ))
                    {
                        event.preventDefault( )
                        event.stopPropagation( );
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        </script>
        <script>
            render("bot_pagger", ${requestScope.page}, ${requestScope.totalpage}, 2, "${requestScope.url}");
        </script>
        <script src="js/scripts.js"></script>
    </body>
</html>
