<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="EmpAssetMgt.Pages.AddUser" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Employee</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2-bootstrap4-theme@1.0.0/dist/select2-bootstrap4.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="shadow p-3 mb-5 bg-white rounded d-flex align-items-center justify-content-between">
                <span class="mt-2"><i class="fa-solid fa-user mr-2"></i>Add Employee</span>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addEmpModal">
                    <i class="fa-solid fa-plus mr-2"></i>Add
                </button>
            </div>
            <div class="modal fade" id="addEmpModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="addEmpModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addEmpModalLabel"><i class="fa-solid fa-user mr-2"></i>Add Employee</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container-fluid">
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Firstname</span>
                                            </div>
                                            <input type="text" class="form-control" id="fname" placeholder="Enter your firstname" />
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Lastname</span>
                                            </div>
                                            <input type="text" class="form-control" id="lname" placeholder="Enter your lastname" />
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="d-flex align-items-center mb-2">
                                            <span class="mr-3 font-weight-bold text-nowrap">Gender :</span>
                                            <div class="input-group mr-3" style="max-width: 140px">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                        <input type="radio" name="gender" id="genderMale" value="Male" />
                                                    </div>
                                                </div>
                                                <label class="form-control mb-0" for="genderMale">Male</label>
                                            </div>
                                            <div class="input-group" style="max-width: 160px">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">
                                                        <input type="radio" name="gender" id="genderFemale" value="Female" />
                                                    </div>
                                                </div>
                                                <label class="form-control mb-0" for="genderFemale">Female</label>
                                            </div>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">DOB</span>
                                            </div>
                                            <input type="text" class="form-control" id="dob" placeholder="Enter your Date of Birth" />
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Email</span>
                                            </div>
                                            <input type="text" class="form-control" id="email" placeholder="Enter your Email Address" />
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Contact</span>
                                            </div>
                                            <input type="text" class="form-control" id="contact" placeholder="Enter your Contact number" />
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Password</span>
                                            </div>
                                            <input type="password" class="form-control" id="pass" placeholder="Enter your Password" />
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Confirm Password</span>
                                            </div>
                                            <input type="password" class="form-control" id="cpass" placeholder="Confirm your Password" />
                                            <div class="input-group-append">
                                                <button class="btn btn-outline-secondary toggle-password" type="button">
                                                    <i class="fas fa-eye"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="dept">Department</label>
                                            </div>
                                            <select class="custom-select" id="dept">
                                                <option value="">Select Department</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="deptrole">Role</label>
                                            </div>
                                            <select class="custom-select" id="deptrole" disabled="disabled">
                                                <option value="">Select Role</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="location-wrapper mb-2">
                                            <label class="location-label font-weight-bold" for="location">Location :</label>
                                            <select id="location" name="location" style="width: 100%">
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="container d-flex justify-content-center">
                                <button type="button" class="btn btn-secondary mr-3" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success" id="addEmpBtn">Add</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script>
        $(document).ready(() => {
            const deptRoles = {
                "IT": ["Software Engineer", "QA Engineer", "DevOps Engineer", "Frontend Developer", "Backend Developer"],
                "HR": ["HR Manager", "Recruiter", "Payroll Specialist", "HR Coordinator"],
                "Finance": ["Accountant", "Financial Analyst", "Auditor", "Tax Consultant"],
                "Marketing": ["Marketing Manager", "Content Writer", "SEO Specialist", "Brand Strategist"],
                "Operations": ["Operations Manager", "Logistics Coordinator", "Supply Chain Analyst", "Warehouse Supervisor"]
            };
            const locationData = [
                { text: "Tamil Nadu", children: [{ id: "Chennai", text: "Chennai" }, { id: "Coimbatore", text: "Coimbatore" }, { id: "Madurai", text: "Madurai" }, { id: "Salem", text: "Salem" }] },
                { text: "Karnataka", children: [{ id: "Bangalore", text: "Bangalore" }, { id: "Mysore", text: "Mysore" }, { id: "Mangalore", text: "Mangalore" }] },
                { text: "Maharashtra", children: [{ id: "Mumbai", text: "Mumbai" }, { id: "Pune", text: "Pune" }, { id: "Nagpur", text: "Nagpur" }] },
                { text: "Delhi", children: [{ id: "New Delhi", text: "New Delhi" }, { id: "Dwarka", text: "Dwarka" }, { id: "Rohini", text: "Rohini" }] },
                { text: "Telangana", children: [{ id: "Hyderabad", text: "Hyderabad" }, { id: "Warangal", text: "Warangal" }, { id: "Nizamabad", text: "Nizamabad" }] }
            ];
            const successmsg = (message) => Swal.fire({ title: "Success", icon: "success", text: message });
            const showError = (fieldId, msg) => {
                $("#" + fieldId).closest(".input-group").siblings(".error-msg").text(msg);
                $("#" + fieldId).removeClass("is-valid").addClass("is-invalid");
            };
            const clearError = (fieldId) => {
                $("#" + fieldId).closest(".input-group").siblings(".error-msg").text("");
                $("#" + fieldId).removeClass("is-invalid").addClass("is-valid");
            };
            const fnamePattern = /^[A-Za-z]+(['][A-Za-z]+)*'?$/;
            const validateFname = () => {
                const inp = $("#fname");
                const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") { showError("fname", "Firstname is required!"); return false; }
                if (/\s/.test(val)) { showError("fname", "Spaces are not allowed!"); return false; }
                if (!fnamePattern.test(val)) { showError("fname", "Only alphabets and apostrophe are allowed!"); return false; }
                clearError("fname");
                return true;
            };
            $("#fname").on("input", validateFname);
            $("#fname").on("blur", () => { if ($("#fname").val().trim() === "") showError("fname", "Firstname is required!"); });
            const lnamePattern = /^[A-Za-z]+(['][A-Za-z]+)*'?$/;
            const validateLname = () => {
                const inp = $("#lname");
                const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") { showError("lname", "Lastname is required!"); return false; }
                if (/\s/.test(val)) { showError("lname", "Spaces are not allowed!"); return false; }
                if (!lnamePattern.test(val)) { showError("lname", "Only alphabets and apostrophe are allowed!"); return false; }
                clearError("lname");
                return true;
            };
            $("#lname").on("input", validateLname);
            $("#lname").on("blur", () => { if ($("#lname").val().trim() === "") showError("lname", "Lastname is required!"); });
            const validateGender = () => {
                const checked = $("input[name='gender']:checked");
                const errorEl = $("input[name='gender']").closest(".col-md-6").find(".error-msg");
                if (checked.length === 0) { errorEl.text("Please select a gender!"); return false; }
                errorEl.text("");
                return true;
            };
            $("input[name='gender']").on("change", validateGender);
            const validateDob = () => {
                const inp = $("#dob");
                const val = inp.val().trim();
                inp.removeClass("is-valid is-invalid");
                if (val === "") { showError("dob", "Date of Birth is required!"); return false; }
                clearError("dob");
                return true;
            };
            $("#dob").on("input", validateDob);
            $("#dob").on("blur", () => { if ($("#dob").val().trim() === "") showError("dob", "Date of Birth is required!"); });
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const validateEmail = () => {
                const inp = $("#email");
                const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") { showError("email", "Email is required!"); return false; }
                if (/\s/.test(val)) { showError("email", "Spaces are not allowed!"); return false; }
                if (!emailPattern.test(val)) { showError("email", "Enter a valid email address!"); return false; }
                clearError("email");
                return true;
            };
            $("#email").on("input", validateEmail);
            $("#email").on("blur", () => { if ($("#email").val().trim() === "") showError("email", "Email is required!"); });
            const contactPattern = /^[0-9]{10}$/;
            const validateContact = () => {
                const inp = $("#contact");
                const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") { showError("contact", "Contact number is required!"); return false; }
                if (!contactPattern.test(val)) { showError("contact", "Enter a valid 10-digit number!"); return false; }
                clearError("contact");
                return true;
            };
            $("#contact").on("keydown", function (e) {
                const allowed = ["Backspace", "Delete", "ArrowLeft", "ArrowRight", "Tab"];
                if (allowed.includes(e.key)) return;
                if (!/^[0-9]$/.test(e.key)) { e.preventDefault(); showError("contact", "Only numbers are allowed!"); }
            });
            $("#contact").on("input", validateContact);
            $("#contact").on("blur", () => { if ($("#contact").val().trim() === "") showError("contact", "Contact number is required!"); });
            const passPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@!$%&])[A-Za-z\d@!$%&]{8,}$/;
            const validatePass = () => {
                const inp = $("#pass");
                const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") { showError("pass", "Password is required!"); return false; }
                if (/\s/.test(val)) { showError("pass", "Spaces are not allowed!"); return false; }
                if (val.length < 8) { showError("pass", "Password must be at least 8 characters!"); return false; }
                if (!passPattern.test(val)) { showError("pass", "Must contain uppercase, lowercase, number and special character!"); return false; }
                clearError("pass");
                if ($("#cpass").val().trim() !== "") validateCpass();
                return true;
            };
            $("#pass").on("input", validatePass);
            $("#pass").on("blur", () => { if ($("#pass").val().trim() === "") showError("pass", "Password is required!"); });
            const validateCpass = () => {
                const inp = $("#cpass");
                const cval = inp.val();
                const pval = $("#pass").val();
                const errEl = inp.closest(".input-group").siblings(".error-msg");
                inp.removeClass("is-valid is-invalid");
                errEl.removeClass("text-success").addClass("text-danger");
                if (cval.trim() === "") { showError("cpass", "Please confirm your password!"); return false; }
                if (/\s/.test(cval)) { showError("cpass", "Spaces are not allowed!"); return false; }
                if (cval !== pval) { showError("cpass", "Passwords do not match!"); return false; }
                inp.addClass("is-valid");
                errEl.removeClass("text-danger").addClass("text-success").text("Passwords matched!");
                return true;
            };
            $("#cpass").on("input", validateCpass);
            $("#cpass").on("blur", () => { if ($("#cpass").val().trim() === "") showError("cpass", "Please confirm your password!"); });
            const validateDept = () => {
                const val = $("#dept").val();
                const errEl = $("#dept").closest(".input-group").siblings(".error-msg");
                $("#dept").removeClass("is-valid is-invalid");
                if (!val || val === "") { errEl.text("Department is required!"); $("#dept").addClass("is-invalid"); return false; }
                errEl.text("");
                $("#dept").addClass("is-valid");
                return true;
            };
            const validateRole = () => {
                if ($("#deptrole").prop("disabled")) {
                    $("#deptrole").closest(".input-group").siblings(".error-msg").text("Please select a Department first!");
                    return false;
                }
                const val = $("#deptrole").val();
                const errEl = $("#deptrole").closest(".input-group").siblings(".error-msg");
                $("#deptrole").removeClass("is-valid is-invalid");
                if (!val || val === "") { errEl.text("Role is required!"); $("#deptrole").addClass("is-invalid"); return false; }
                errEl.text("");
                $("#deptrole").addClass("is-valid");
                return true;
            };
            const validateLocation = () => {
                const val = $("#location").val();
                const errEl = $("#location").closest(".col-md-12").find(".error-msg");
                $("#location").next(".select2-container--bootstrap4").find(".select2-selection").removeClass("is-valid is-invalid");
                if (!val || val.length === 0) {
                    errEl.text("Location is required!");
                    $("#location").next(".select2-container--bootstrap4").find(".select2-selection").addClass("is-invalid");
                    return false;
                }
                errEl.text("");
                $("#location").next(".select2-container--bootstrap4").find(".select2-selection").addClass("is-valid");
                return true;
            };
            Object.keys(deptRoles).forEach((dept) => {
                $("#dept").append(`<option value="${dept}">${dept}</option>`);
            });
            $("#dept").on("change", function () {
                const selectedDept = $(this).val();
                $("#deptrole").html('<option value="">Select Role</option>').removeClass("is-valid is-invalid").prop("disabled", true);
                $("#deptrole").closest(".input-group").siblings(".error-msg").text("");
                if (selectedDept === "") { validateDept(); return; }
                deptRoles[selectedDept].forEach((role) => {
                    $("#deptrole").append(`<option value="${role}">${role}</option>`);
                });
                $("#deptrole").prop("disabled", false);
                validateDept();
            });
            $("#deptrole").on("change", validateRole);
            $("#location").select2({
                theme: "bootstrap4",
                placeholder: "Select Location",
                allowClear: true,
                data: locationData,
                dropdownParent: $("#addEmpModal"),
                closeOnSelect: false
            });
            $("#location").on("change", validateLocation);
            $(".toggle-password").on("click", function () {
                const inp = $(this).closest(".input-group").find("input");
                const icon = $(this).find("i");
                if (inp.attr("type") === "password") { inp.attr("type", "text"); icon.removeClass("fa-eye").addClass("fa-eye-slash"); }
                else { inp.attr("type", "password"); icon.removeClass("fa-eye-slash").addClass("fa-eye"); }
            });
            $("#addEmpModal").on("hidden.bs.modal", () => {
                $("#fname, #lname, #dob, #email, #contact, #pass, #cpass").val("").removeClass("is-valid is-invalid");
                $("input[name='gender']").prop("checked", false);
                $("#dept").val("").removeClass("is-valid is-invalid");
                $("#deptrole").html('<option value="">Select Role</option>').prop("disabled", true).removeClass("is-valid is-invalid");
                $("#location").val(null).trigger("change");
                $("#location").next(".select2-container--bootstrap4").find(".select2-selection").removeClass("is-valid is-invalid");
                $(".error-msg").text("").removeClass("text-success").addClass("text-danger");
            });
            const generateId = () => {
                const employees = JSON.parse(localStorage.getItem("employees") || "[]");
                const lastId = employees.length > 0 ? employees[employees.length - 1].id : "EMP000";
                const num = parseInt(lastId.replace("EMP", "")) + 1;
                return "EMP" + String(num).padStart(3, "0");
            };

            const saveEmployee = () => {
                const fname = $("#fname").val().trim();
                const lname = $("#lname").val().trim();
                const gender = $("input[name='gender']:checked").val();
                const dob = $("#dob").val().trim();
                const email = $("#email").val().trim();
                const contact = $("#contact").val().trim();
                const password = $("#pass").val().trim();
                const dept = $("#dept").val();
                const role = $("#deptrole").val();
                const location = $("#location").val();
                const joinDate = new Date().toLocaleDateString("en-GB");

                const employee = {
                    id: generateId(),
                    firstname: fname,
                    lastname: lname,
                    fullname: fname + " " + lname,
                    gender: gender,
                    dob: dob,
                    email: email,
                    contact: contact,
                    password: password,
                    department: dept,
                    role: role,
                    location: location,
                    joindate: joinDate,
                    enddate: "",
                    status: "Active"
                };

                const employees = JSON.parse(localStorage.getItem("employees") || "[]");
                employees.push(employee);
                localStorage.setItem("employees", JSON.stringify(employees));
            };
            $("#addEmpBtn").on("click", () => {
                const results = [
                    validateFname(),
                    validateLname(),
                    validateGender(),
                    validateDob(),
                    validateEmail(),
                    validateContact(),
                    validatePass(),
                    validateCpass(),
                    validateDept(),
                    validateRole(),
                    validateLocation()
                ];
                if (results.every(Boolean)) {
                    saveEmployee();
                    successmsg("Employee added successfully!");
                    $("#addEmpModal").modal("hide");
                }
            });
        });
    </script>
</body>
</html>
