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
        <title>Schedule Add</title>
        <link href="../css/style-dashboard.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="sb-nav-fixed">
        <div id="layoutSidenav">
            <jsp:include page="SideBarAndNavBar.jsp"/>               
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4 ">
                        <h1 class="mt-4">Schedule Add</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a class="text-decoration-none" href="${requestScope.website_url}/Dashboard">Dashboard</a></li>
                            <li class="breadcrumb-item"><a class="text-decoration-none" href="${requestScope.website_url}/Dashboard/schedule-list">Schedule List</a></li>
                            <li class="breadcrumb-item active">Schedule Add</li>
                        </ol>

                        <div class="card">
                            <form id="contactForm" class="needs-validation col-md-12" style="margin-left: 10px" action ="schedule-add" method="POST" novalidate>
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
                                    <div class="col-6 position-relative">
                                        <label class="form-label ">Class</label>
                                        <select class="form-select" name="class">
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
                                        <div class="invalid-tooltip">
                                            Need select Class.
                                        </div>
                                    </div>                                   
                                    <div class="col-6 position-relative">
                                        <label class="form-label ">Room</label>
                                        <select class="form-select" required aria-label="select room" name="room">
                                            <c:forEach items="${requestScope.room_list}" var="rl">                               
                                                <option value="${rl.setting_id}">
                                                    ${rl.setting_value}
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
                                        <select class="form-select" required aria-label="" name="slot">
                                            <c:forEach items="${requestScope.slot_list}" var="sl">                               
                                                <option value="${sl.setting_id}">
                                                    ${sl.setting_value}
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
                                            <input name = "date" class="form-control col-6" id="date" type="date"  value="" required />
                                            <div class="invalid-tooltip">
                                                Need input Date.
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                                <div class="row">
                                    <label for="" class="form-label">Status</label>
                                </div>
                                <div class="row col-6">
                                    <div class="form-group position-relative col-6">
                                        <label for="fromTime" class="form-label">From time</label>
                                        <div class="">
                                            <input name = "fromTime" class="form-control" id="fromTime" type="time""  value="" required />
                                            <div class="from-time-invalid-tooltip">
                                                Need input From time.
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group position-relative col-6">
                                        <label for="toTime" class="form-label">To time</label>
                                        <div class="">
                                            <input name = "toTime" class="form-control" id="toTime" type="time""  value="" oninvalid="this.setCustomValidity('Please enter valid User No.')" required />
                                            <div class="to-time-invalid-tooltip">
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
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                    </div>
                </footer>
            </div>
        </div>
        <c:if test="${requestScope.add}">
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
                    document.getElementById('from-time-invalid-tooltip').innerHTML = "From time must be before to time.";
                    document.getElementById('to-time-invalid-tooltip').innerHTML = "From time must be before to time.";
                } else {
                    document.getElementById('fromTime').setCustomValidity('');
                    document.getElementById('toTime').setCustomValidity('');
                    document.getElementById('from-time-invalid-tooltip').innerHTML = "Need input From time.";
                    document.getElementById('to-time-invalid-tooltip').innerHTML = "Need input To time.";
                }
            }
        </script>
        <script>
            render("bot_pagger", ${requestScope.page}, ${requestScope.totalpage}, 2, "${requestScope.url}");
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>
</html>
