<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Schedule Detail</title>
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
                        <h1 class="mt-4">Schedule Detail</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a class="text-decoration-none" href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item"><a class="text-decoration-none" href="${requestScope.website_url}/Dashboard/schedule-list">Schedule List</a></li>
                            <li class="breadcrumb-item active">Schedule Detail</li>
                        </ol>

                        <div class="card">
                            <form id="contactForm" class="needs-validation col-md-12" style="margin-left: 10px" action ="schedule-detail" method="POST" novalidate>
                                <div class="row">
                                    <p class="h4">ID ${requestScope.schedule.schedule_id}</p>
                                    <input type="hidden" name="id" value="${requestScope.schedule.schedule_id}">
                                </div>
                                <div class="row col-6">
                                    <div class="form-group position-relative">
                                        <label for="topic" class="form-label">Topic</label>
                                        <div class="">
                                            <input name = "topic" class="form-control col-6" id="topic" type="text" placeholder="Topic" pattern="[^]{1,45}" value="${requestScope.schedule.topic}" required />
                                            <div class="invalid-tooltip">
                                                Need input Topic.
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                                <div class="row col-6">
                                    <div class="mb-1 position-relative col-6">
                                        <label class="form-label">Class</label>
                                        <div>
                                            <p>${requestScope.schedule.classId.class_code}</p>
                                        </div>
                                    </div>                                    
                                    <div class="col-6 position-relative">
                                        <label class="form-label ">Room</label>
                                        <select class="form-select" required aria-label="select role" name="room">
                                            <c:forEach items="${requestScope.room_list}" var="rl">                               
                                                <option value="${rl.setting_id}" 
                                                        <c:if test="${requestScope.schedule.room.setting_id eq rl.setting_id}">
                                                            selected="selected"
                                                        </c:if>>${rl.setting_value}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-tooltip">
                                            Need select Room.
                                        </div>
                                    </div>
                                </div>
                                <div class="row col-6">
                                    <div class="position-relative col-6">
                                        <label class="form-label ">Slot</label>
                                        <select class="form-select" required aria-label="select role" name="slot">
                                            <c:forEach items="${requestScope.slot_list}" var="sl">                               
                                                <option value="${sl.setting_id}" 
                                                        <c:if test="${requestScope.schedule.slot.setting_id eq sl.setting_id}">
                                                            selected="selected"
                                                        </c:if>>${sl.setting_value}
                                                </option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-tooltip">
                                            Need select Slot.
                                        </div>
                                    </div>
                                    <div class="form-group position-relative col-6">
                                        <label for="date" class="form-label">Date</label>
                                        <div class="">
                                            <input name = "date" class="form-control col-6" id="date" type="date"  value="${requestScope.schedule.date}" required />
                                            <div class="invalid-tooltip">
                                                Need input Date.
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                                <div class="row">
                                    <label for="" class="form-label">Status</label>
                                    <div class="col-3">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="status" id="inlineRadio1" value="1" 
                                                   <c:if test="${requestScope.schedule.status}">
                                                       checked
                                                   </c:if>
                                                   required>
                                            <label class="form-check-label" for="inlineRadio1">Taken</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row col-6">
                                    <div class="form-group position-relative col-6">
                                        <label for="fromTime" class="form-label">From time</label>
                                        <div class="">
                                            <input name = "fromTime" class="form-control" id="fromTime" type="time" oninput="checkTime()"   value="<fmt:formatDate pattern = "HH:mm" value = "${requestScope.schedule.from_time}"/>" required />
                                            <div class="invalid-tooltip" id="from-time-nvalid-tooltip">
                                                Need input From time.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group position-relative col-6">
                                        <label for="toTime" class="form-label">To time</label>
                                        <div class="">
                                            <input name = "toTime" class="form-control" id="toTime" type="time" onChange="checkTime()"  value="<fmt:formatDate pattern = "HH:mm" value = "${requestScope.schedule.to_time}"/>" required />
                                            <div class="invalid-tooltip" id="to-time-nvalid-tooltip">
                                                Need input To time.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div style="margin-top: 25px;">
                                    <div class="text-center">
                                        <button class="btn btn-primary btn-xl text-uppercase"
                                                id="submitButton" type="submit">Submit
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <!-- Modal -->
                            <div class="modal fade" id="modelComfirm" tabindex="-1" aria-hidden="false" show>
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Save successfully </h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Schedule detail has been saved successfully.
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
            function checkTime() {
                var fromTime = document.getElementById("fromTime").value;
                var toTime = document.getElementById("toTime").value;
                if (fromTime >= toTime)
                {
                    document.getElementById('fromTime').setCustomValidity("Invalid field.");
                    document.getElementById('toTime').setCustomValidity("Invalid field.");
                    document.getElementById('from-time-nvalid-tooltip').innerHTML = "From time must be before to time.";
                    document.getElementById('to-time-nvalid-tooltip').innerHTML = "From time must be before to time.";
                } else {
                    document.getElementById('fromTime').setCustomValidity('');
                    document.getElementById('toTime').setCustomValidity('');
                    document.getElementById('from-time-nvalid-tooltip').innerHTML = "Need input From time.";
                    document.getElementById('to-time-nvalid-tooltip').innerHTML = "Need input To time.";
                }
            }
        </script>
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
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script><!-- comment -->  
    </body>
</html>
