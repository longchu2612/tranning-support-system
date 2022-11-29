<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - SB Admin</title>
        <link href="css/style-dashboard.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                                    <div class="card-body">
                                        <form  action="login" method="Post">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" name="firstname" onkeydown="validateFirstName()"/>
                                                        <label for="inputFirstName">First name</label>
                                                        <span id="text_firstname"></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputLastName" type="text" name="lastname" placeholder="Enter your last name" />
                                                        <label for="inputLastName">Last name</label>
                                                        <span id="text_lastname"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputEmail" type="email" name="email" placeholder="name@example.com" onkeydown="validationEmail()"/>
                                                <label for="inputEmail">Email address</label>
                                                <span id="text_email"></span>
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPassword" name="password"type="password" placeholder="Create a password" onkeydown="validatePassword()" />
                                                        <label for="inputPassword">Password</label>
                                                        <span id="text_password"></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPasswordConfirm" name="confirmpassword" type="password" placeholder="Confirm password" onkeydown="validateConfirmPassword()" />
                                                        <label for="inputPasswordConfirm">Confirm Password</label>
                                                        <span id="text_confirmpassword"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><input type="submit" class="btn btn-primary btn-block" value="Create Account"/></div>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="login.jsp">Have an account? Go to login</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
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
        <script type="text/javascript">
                                                            function validationEmail() {
                                                                var email = document.getElementById("inputEmail").value;
                                                                var text = document.getElementById("text_email");
                                                                var pattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
                                                                if (email.match(pattern)) {
                                                                    text.innerHTML = "Your Email Address in Valid";
                                                                    text.style.color = "#00ff00";
                                                                } else {
                                                                    text.innerHTML = "Please Enter Valid Email Address ";
                                                                    text.style.color = "#00ff00";
                                                                }

                                                            }
                                                            function validatePassword() {
                                                                var pass = document.getElementById("inputPassword").value;
                                                                var text = document.getElementById("text_password");
                                                                if (!pass.match(/[0-9]/)) {
                                                                    text.innerHTML = "You must enter at least one number";
                                                                    text.style.color = "#00ff00";
                                                                } else if (!pass.match(/[A-Z]/)) {
                                                                    text.innerHTML = "You must enter at least one uppercase";
                                                                    text.style.color = "#00ff00";
                                                                } else if (pass < 6) {
                                                                    text.innerHTML = "You must enter at lease 6 character";
                                                                    text.style.color = "#00ff00";
                                                                } else {
                                                                    text.innerHTML = "";
                                                                }
//                

                                                            }
                                                            function validateConfirmPassword() {
                                                                var pass = document.getElementById("inputPassword").value;
                                                                var confirm_pass = document.getElementById("inputPasswordConfirm").value;
                                                                var text = document.getElementById("text_confirmpassword");
                                                                if (pass == confirm_pass) {
                                                                    text.innerHTML = "Confirm Password is correct";
                                                                    text.style.color = "#00ff00";
                                                                } else {
                                                                    text.innerHTML = "Confirm Password is not correct";
                                                                    text.style.color = "#00ff00";
                                                                }
                                                            }
                                                            function validateFirstName() {
                                                                var firstname = document.getElementById("inputFirstName").value;
                                                                var text = document.getElementById("text_firstname");
                                                                if (firstname == "") {
                                                                    text.innerHTML = "First Name is not empty";
                                                                    text.style.color = "#00ff00";
                                                                } else {
                                                                    text.innerHTML = "";
                                                                }
                                                            }
                                                            function validateLastName() {
                                                                var lastname = document.getElementById("inputLastName").value;
                                                                var text = document.getElementById("text_lastname");
                                                                if (lastname == "") {
                                                                    text.innerHTML = "Last Name is not empty";
                                                                    text.style.color = "#00ff00";
                                                                } else {
                                                                    text.innerHTML = "";
                                                                }
                                                            }
        </script>
    </body>
</html>
