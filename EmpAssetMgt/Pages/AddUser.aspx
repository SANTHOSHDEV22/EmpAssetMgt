<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="EmpAssetMgt.Pages.AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Employee</title>
    <!---Bootstrap4--->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <!---Fontawesome--->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="shadow p-3 mb-5 bg-white rounded d-flex algin-items-center justify-content-between">
                <span class="mt-2"><i class="fa-solid fa-user mr-2"></i>Add Employee</span>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addEmpmodal">
                    <i class="fa-solid fa-plus mr-2"></i>Add
                </button>
            </div>
            <div class="modal fade" id="addEmpmodal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="addEmpModallabel" aria-hidden="true">
                <div class="modal-dialog modal-xl modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addEmpModallabel"><i class="fa-solid fa-user mr-2"></i>Add Employess</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Firstname</span>
                                            </div>
                                            <input type="text" class="form-control" name="firstname" placeholder="Enter your firstname" id="fname" />
                                        </div>
                                        <small class="error-msg text-danger"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Lastname</span>
                                            </div>
                                            <input type="text" class="form-control" name="firstname" placeholder="Enter your lastname" id="lname" />
                                        </div>
                                        <small class="error-msg text-danger"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6 d-flex justify-content-between">
                                        <span class="mt-2">Gender</span>
                                        <div class="input-group mb-3" style="max-width: 200px">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <input type="radio" aria-label="gender" />
                                                </div>
                                            </div>
                                            <input type="text" class="form-control" aria-label="Male" value="Male" disabled="disabled" />
                                        </div>
                                        <div class="input-group mb-3" style="max-width: 200px">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <input type="radio" aria-label="gender" />
                                                </div>
                                            </div>
                                            <input type="text" class="form-control" aria-label="Female" value="Female" disabled="disabled" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">DOB</span>
                                            </div>
                                            <input type="text" class="form-control" name="dob" placeholder="Enter your Date of Birth" id="dob" />
                                        </div>
                                        <small class="error-msg text-danger"></small>
                                    </div>

                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Email</span>
                                            </div>
                                            <input type="text" class="form-control" name="email" placeholder="Enter your Email Address" id="email" />
                                        </div>
                                        <small class="error-msg text-danger"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Contact</span>
                                            </div>
                                            <input type="text" class="form-control" name="contact" placeholder="Enter your Contact number" id="contact" />
                                        </div>
                                        <small class="error-msg text-danger"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Password</span>
                                            </div>
                                            <input type="password" class="form-control" name="pass" placeholder="Enter your Password" id="pass" />
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <small class="error-msg text-danger"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Confirm Password</span>
                                            </div>
                                            <input type="password" class="form-control" name="cpass" placeholder="Confirm your Password" id="cpass" />
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <small class="error-msg text-danger"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="inputGroupSelect01">Department</label>
                                            </div>
                                            <select class="custom-select" id="dept">
                                                <option selected="selected">select department</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="inputGroupSelect01">Department</label>
                                            </div>
                                            <select class="custom-select" id="deptrole">
                                                <option selected="selected">Select role</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="inputGroupSelect01">Location</label>
                                            </div>
                                            <select class="custom-select" id="location">
                                                <option selected="selected">Select Location</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="container d-flex justify-content-center">
                                <button type="button" class="btn btn-secondary mr-3" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success">Add</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- 1. jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- 2. Bootstrap 4 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 3. SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        $(document).ready(() => {
            const successmsg = (message) =>{
                Swal.fire({
                    title: "Success",
                    icon: "success",
                    text: message
                });
            }
            const errormsg = (message) => {
                Swal.fire({
                    title: "error",
                    icon: "error",
                    text: message
                });
            }
            //validation objext
            const validateRule = {
                fname: {
                    required: "Firstname is required!",
                    errmsg: "Only Alphabets are allowed!",
                    regexp: /^[a-zA-Z]+[']$/,
                },
                lname: {
                    required: "Lastname is required!",
                    errmsg: "Only Alphabets are allowed!",
                    regexp: /^[a-zA-Z]+[']$/,
                },
                gender: {
                    required: "Gender is required!",
                },
                dob: {
                    required: "Date of birth is required!",
                },
                email: {
                    required: "Email is required!",
                    errmsg:"Enter the valid Email address",
                    regexp: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$/,
                },
                contact: {
                    required: "Contact is required!",
                    errmsg: "Enter the valid Contact address",
                    regexp: /^\d{10}$/,
                },
                pass: {
                    required: "Password is required!",
                    errmsg: "Enter the valid Password",
                    regexp: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/,
                },
                cpass: {
                    matchmsg: "Password match",
                    nomatchmsg: "Password doesn't match"
                }
            }
            const groupValidateRule = {
                dept: {
                    required:"Department is required",
                },
                deptrole: {
                    required:"Role is required",
                },
                location: {
                    required:"Location is required",
                }
            }

            const validateFunc = (field) => {
                const fields = $(this).attr("id");
                const val = field.val();
                if (val.trim() === "") {
                    field.closest(".mb-3").siblings(".error-msg").text(validateRule[field].required);
                }
                if (!val.test(validateRule[field].regexp)) {
                    field.closest(".mb-3").siblings(".error-msg").text(validateRule[field].errmsg);
                }
                if()
            }

            $("fname","lname").on('input blur', () => {
                validateFunc($(this))
            });

        });
    </script>
</body>
</html>
