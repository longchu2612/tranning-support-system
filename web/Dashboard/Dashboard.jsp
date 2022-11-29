<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="../css/style-dashboard.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link href="../css/styles.css" rel="stylesheet" />

        <script type="text/javascript">
            function doDelete(id, name) {
                if (confirm("Are you sure delete Account " + name)) {
                    window.location = "deleteAcc?id=" + id;
                }
            }
        </script>
    </head>
    <body class="sb-nav-fixed">

        <div id="layoutSidenav">
            <jsp:include page="SideBarAndNavBar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Ca nhiễm trong ngày</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">12.021 | Chi tiết</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Ca nhiễm trong tuần</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">752.785 | Chi tiết</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Ca nhiễm trong tháng</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">2.021.212 | Chi tiết</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Ca nhiễm trong năm</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">7.544.525 | Chi tiết</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Chart world
                                        <canvas id="chart_world"></canvas>
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>

                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Area epidemic chart 
                                        <canvas id="chart_area"></canvas>
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <!--                        <form action="search_subject">
                                                    <input name="search" type="text" /> comment 
                                                    <input type="submit" value="Search"/>
                                                </form>-->
                        <c:if test="${requestScope.option == null}">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    Thống kê
                                </div>
                                <div class="card-body">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>Country</th>
                                                <th>Total case</th>
                                                <th>Death</th>
                                                <th>Recovered</th>
                                                <th>Active</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>

                                        <tbody id="table_body">


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </main>
                <jsp:include page="../Footter.jsp"/> 
            </div>
        </div>
        <script src="js/scripts_1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../assets/demo/chart-area-demo.js"></script>
        <script src="../assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
        <script src="../js/fetchAPI.js"></script>
    </body>
    <script>
                var bienx = ['Th2', 'Th3', 'Th4', 'Th5', 'Th6', 'Th7', 'CN'];
                var bieny = [1111242, 1112452, 2115251, 2121114, 1211142, 2311152, 1555545];
                var CHART = document.getElementById('chart_world').getContext('2d');
                var line_chart = new Chart(CHART, {
                    type: 'line',
                    data: {
                        labels: bienx,
                        datasets: [{
                                label: 'Biểu đồ thống kê tuần này',
                                data: bieny
                            }]
                    }
                });

                var bienx = ['Th2', 'Th3', 'Th4', 'Th5', 'Th6', 'Th7', 'CN'];
                var bieny = [111113242, 111241352, 211521351, 212111314, 31211142, 132311152, 15355545];
                var CHART = document.getElementById('chart_area').getContext('2d');
                var line_chart = new Chart(CHART, {
                    type: 'line',
                    data: {
                        labels: bienx,
                        datasets: [{
                                label: 'Biểu đồ thống kê tuần trước',
                                data: bieny
                            }]
                    }
                });
    </script>
</html>
