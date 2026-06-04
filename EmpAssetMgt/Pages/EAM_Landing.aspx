<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EAM_Landing.aspx.cs" Inherits="EmpAssetMgt.Pages.EAM_Landing" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EAM</title>
    <link href="/EAM.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <!--DataTables-->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.3.1/css/searchPanes.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/select/2.0.3/css/select.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/staterestore/1.4.3/css/stateRestore.dataTables.min.css" />
    <!--Select2-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
    <style>
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav class="navbar navbar-light bg-dark">
                <a href="#" class="navbar-brand h2 text-light">EAM</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav"
                    aria-controls="sidenav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
            <div id="sidenav" class="collapse navbar-collapse bg-dark">
                <div class="navbar-nav bg-dark">
                    <ul class="navbar-nav mr-auto ml-4">
                        <li class="nav-item pb-3 pt-3">
                            <a href="#" id="dashboardId" class="nav-link text-light">
                                <i class="fa-solid fa-gauge-high mr-2"></i>Dashboard
                            </a>
                        </li>
                        <li class="nav-item dropdown pb-3">
                            <a href="#" class="nav-link sideNavToggle text-light">
                                <i class="fa-solid fa-user fa-sm mr-2"></i>Employees
                                <i class="fa-solid fa-chevron-down fa-xs ml-2 toggleIcon"></i>
                            </a>
                            <div class="dropdown-menu">
                                <a href="#" id="addEmployeeId" class="dropdown-item nav-link">
                                    <i class="fa-solid fa-plus fa-xs mr-2"></i>Add
                                </a>
                                <a href="#" id="viewEmployeeId" class="dropdown-item nav-link">
                                    <i class="fa-solid fa-eye fa-xs mr-2"></i>View
                                </a>
                            </div>
                        </li>
                        <li class="nav-item dropdown pb-3">
                            <a href="#" class="nav-link sideNavToggle text-light">
                                <i class="fa-solid fa-suitcase fa-sm mr-2"></i>Assets
                                <i class="fa-solid fa-chevron-down fa-xs ml-2 toggleIcon"></i>
                            </a>
                            <div class="dropdown-menu">
                                <a href="#" id="assetAssignId" class="dropdown-item nav-link">
                                    <i class="fa-solid fa-user-check fa-xs mr-2"></i>Assign
                                </a>
                                <a href="#" id="assetInventoryId" class="dropdown-item nav-link">
                                    <i class="fa-solid fa-suitcase fa-xs mr-2"></i>Inventory
                                </a>
                                <a href="#" class="dropdown-item nav-link">
                                    <i class="fa-solid fa-clipboard fa-xs mr-2"></i>History
                                </a>
                            </div>
                        </li>
                        <li class="nav-item pb-3">
                            <a href="#" class="nav-link text-light">
                                <i class="fa-solid fa-file fa-sm mr-2"></i>Reports
                            </a>
                        </li>
                        <li class="nav-item pb-3">
                            <a href="#" class="nav-link text-light">
                                <i class="fa-solid fa-gear fa-sm mr-2"></i>Settings
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="sidebar-overlay" id="sidebarOverlay"></div>

        <div id="pageScreen" class="container-fluid">

            <!--Dashboard-->
            <div id="section-dashboard" class="page-section mt-4" style="display:none;">
                <div class="shadow p-3 mb-4 bg-white rounded">
                    <h3><i class="fa-solid fa-gauge-high mr-2"></i>Dashboard</h3>
                </div>
                <table class="table table-bordered table-striped dash-table">
                    <thead class="thead-dark text-center">
                        <tr>
                            <th>Total Employees</th>
                            <th>Total Assets</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <tr>
                            <td id="totalEmp" class="dash-count">0</td>
                            <td id="totalAssets" class="dash-count">0</td>
                        </tr>
                    </tbody>
                </table>
                <table class="table table-bordered table-striped dash-table dash-table-4 mt-3">
                    <thead class="thead-dark text-center">
                        <tr>
                            <th colspan="2">Employees</th>
                            <th colspan="2">Assets</th>
                        </tr>
                        <tr>
                            <th>Active</th>
                            <th>Inactive</th>
                            <th>Assigned</th>
                            <th>Not Assigned</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <tr>
                            <td id="activeEmp" class="dash-count">0</td>
                            <td id="inactiveEmp" class="dash-count">0</td>
                            <td id="assignedAssets" class="dash-count">0</td>
                            <td id="unassignedAssets" class="dash-count">0</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!--Add Employee-->
            <div id="section-addEmp" class="page-section mt-4" style="display:none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-user mr-2"></i>Add Employee</span>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addEmpModal">
                        <i class="fa-solid fa-plus mr-2"></i>Add
                    </button>
                </div>
                <div class="modal fade" id="addEmpModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title"><i class="fa-solid fa-user mr-2"></i>Add Employee</h5>
                                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Firstname</span></div>
                                                <input type="text" class="form-control" id="fname" placeholder="Enter your firstname" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Lastname</span></div>
                                                <input type="text" class="form-control" id="lname" placeholder="Enter your lastname" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <div class="d-flex align-items-center mb-2">
                                                <span class="mr-3 font-weight-bold text-nowrap">Gender :</span>
                                                <div class="input-group mr-3" style="max-width:140px">
                                                    <div class="input-group-prepend"><div class="input-group-text"><input type="radio" name="gender" id="genderMale" value="Male" /></div></div>
                                                    <label class="form-control mb-0" for="genderMale">Male</label>
                                                </div>
                                                <div class="input-group" style="max-width:160px">
                                                    <div class="input-group-prepend"><div class="input-group-text"><input type="radio" name="gender" id="genderFemale" value="Female" /></div></div>
                                                    <label class="form-control mb-0" for="genderFemale">Female</label>
                                                </div>
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">DOB</span></div>
                                                <input type="text" class="form-control" id="dob" placeholder="Enter your Date of Birth" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Email</span></div>
                                                <input type="text" class="form-control" id="email" placeholder="Enter your Email Address" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Contact</span></div>
                                                <input type="text" class="form-control" id="contact" placeholder="Enter your Contact number" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Password</span></div>
                                                <input type="password" class="form-control" id="pass" placeholder="Enter your Password" />
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-secondary toggle-password" type="button"><i class="fas fa-eye"></i></button>
                                                </div>
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Confirm Password</span></div>
                                                <input type="password" class="form-control" id="cpass" placeholder="Confirm your Password" />
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-secondary toggle-password" type="button"><i class="fas fa-eye"></i></button>
                                                </div>
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><label class="input-group-text" for="dept">Department</label></div>
                                                <select class="custom-select" id="dept"><option value="">Select Department</option></select>
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><label class="input-group-text" for="deptrole">Role</label></div>
                                                <select class="custom-select" id="deptrole" disabled="disabled"><option value="">Select Role</option></select>
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="location-wrapper mb-2">
                                                <label class="location-label font-weight-bold" for="location">Location :</label>
                                                <select id="location" name="location" style="width:100%"></select>
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

            <!--View Employee-->
            <div id="section-viewEmp" class="page-section mt-4" style="display:none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-users mr-2"></i>View Employees</span>
                </div>
                <div class="card">
                    <div class="card-body">
                        <table id="empTable" class="table table-bordered table-striped table-hover" style="width:100%">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th></th>
                                    <th>Full Name</th>
                                    <th>Gender</th>
                                    <th>DOB</th>
                                    <th>Email</th>
                                    <th>Contact</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                    <th>Profile</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!--Edit Employee Modal-->
            <div class="modal fade" id="editEmpModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-xl modal-dialog-centered">
                    <div class="modal-content border-0 shadow">
                        <div class="modal-header bg-dark text-white">
                            <h5 class="modal-title"><i class="fa-solid fa-pen-to-square mr-2"></i>Edit Employee</h5>
                            <button type="button" class="close text-white" data-dismiss="modal"><span>&times;</span></button>
                        </div>
                        <div class="modal-body p-4">
                            <input type="hidden" id="editEmpId" />
                            <input type="hidden" id="editMode" />
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Firstname</span></div><input type="text" class="form-control" id="editFname" placeholder="Enter firstname" /></div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Lastname</span></div><input type="text" class="form-control" id="editLname" placeholder="Enter lastname" /></div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <div class="row align-items-center mb-2">
                                <div class="col-md-6">
                                    <div class="d-flex align-items-center">
                                        <span class="mr-3 font-weight-bold text-nowrap">Gender :</span>
                                        <div class="input-group mr-3" style="max-width:140px"><div class="input-group-prepend"><div class="input-group-text"><input type="radio" name="editGender" id="editMale" value="Male" /></div></div><label class="form-control mb-0" for="editMale">Male</label></div>
                                        <div class="input-group" style="max-width:160px"><div class="input-group-prepend"><div class="input-group-text"><input type="radio" name="editGender" id="editFemale" value="Female" /></div></div><label class="form-control mb-0" for="editFemale">Female</label></div>
                                    </div>
                                    <small class="text-danger error-msg d-block mt-1"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">DOB</span></div><input type="text" class="form-control" id="editDob" placeholder="Enter Date of Birth" /></div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Email</span></div><input type="text" class="form-control" id="editEmail" placeholder="Enter email address" /></div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Contact</span></div><input type="text" class="form-control" id="editContact" placeholder="Enter contact number" maxlength="10" /></div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Password</span></div><input type="password" class="form-control" id="editPassword" placeholder="Enter password" /><div class="input-group-append"><button type="button" class="btn btn-outline-secondary toggle-password"><i class="fas fa-eye"></i></button></div></div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Confirm Password</span></div><input type="password" class="form-control" id="editCpass" placeholder="Confirm password" /><div class="input-group-append"><button type="button" class="btn btn-outline-secondary toggle-password"><i class="fas fa-eye"></i></button></div></div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><label class="input-group-text" for="editDept">Department</label></div><select class="custom-select" id="editDept"><option value="">Select Department</option></select></div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><label class="input-group-text" for="editRole">Role</label></div><select class="custom-select" id="editRole" disabled="disabled"><option value="">Select Role</option></select></div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Status</span></div><select class="custom-select" id="editStatus"><option value="Active">Active</option><option value="Inactive">Inactive</option></select></div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="location-wrapper mb-2">
                                        <label class="location-label" for="editLocation">Location</label>
                                        <select id="editLocation" name="editLocation" style="width:100%"></select>
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Join Date</span></div><input type="text" class="form-control" id="editJoinDate" placeholder="Join Date" readonly="readonly" /></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Relieve Date</span></div><input type="text" class="form-control" id="editEndDate" placeholder="Relieve Date" /></div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer border-0">
                            <div class="container d-flex justify-content-center">
                                <button type="button" class="btn btn-secondary mr-2" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-danger mr-2" id="deleteEmpBtn">Delete</button>
                                <button type="button" class="btn btn-success" id="updateEmpBtn">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Asset Assign-->
            <div id="section-assign" class="page-section mt-4" style="display:none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-user-check mr-2"></i>Asset Assign</span>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#assignModal">
                        <i class="fa-solid fa-plus mr-2"></i>Assign
                    </button>
                </div>
                <div class="modal fade" id="assignModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-centered">
                        <div class="modal-content border-0 shadow">
                            <div class="modal-header bg-dark text-white">
                                <h5 class="modal-title"><i class="fa-solid fa-user-check mr-2"></i>Assign Asset to Employee</h5>
                                <button type="button" class="close text-white" data-dismiss="modal"><span>&times;</span></button>
                            </div>
                            <div class="modal-body p-4">
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><label class="input-group-text" for="assignEmployee"><i class="fa-solid fa-user mr-2"></i>Employee</label></div><select class="custom-select" id="assignEmployee"><option value="">Select Employee</option></select></div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><label class="input-group-text" for="assignCategory"><i class="fa-solid fa-layer-group mr-2"></i>Category</label></div><select class="custom-select" id="assignCategory"><option value="">Select Category</option></select></div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><label class="input-group-text" for="assignAsset"><i class="fa-solid fa-suitcase mr-2"></i>Asset</label></div><select class="custom-select" id="assignAsset" disabled="disabled"><option value="">Select Asset</option></select></div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Start Date</span></div><input type="text" class="form-control" id="assignStartDate" readonly="readonly" /></div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Return Date</span></div><input type="text" class="form-control" id="assignReturnDate" placeholder="DD/MM/YYYY" /></div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer border-0">
                                <div class="container d-flex justify-content-center">
                                    <button type="button" class="btn btn-secondary mr-2" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-success" id="confirmAssignBtn"><i class="fa-solid fa-check mr-2"></i>Assign</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Asset Inventory-->
            <div id="section-inventory" class="page-section mt-4" style="display:none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-suitcase mr-2"></i>Asset Inventory</span>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addAssetModal">
                        <i class="fa-solid fa-plus mr-2"></i>Add Asset
                    </button>
                </div>
                <div class="card">
                    <div class="card-body">
                        <table id="assetTable" class="table table-bordered table-striped table-hover" style="width:100%">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th>ID</th>
                                    <th>Category</th>
                                    <th>Asset Name</th>
                                    <th>Status</th>
                                    <th>Assigned To</th>
                                    <th>Start Date</th>
                                    <th>Return Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
                <div class="modal fade" id="addAssetModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-centered">
                        <div class="modal-content border-0 shadow">
                            <div class="modal-header bg-dark text-white">
                                <h5 class="modal-title"><i class="fa-solid fa-plus mr-2"></i>Add Asset</h5>
                                <button type="button" class="close text-white" data-dismiss="modal"><span>&times;</span></button>
                            </div>
                            <div class="modal-body p-4">
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><label class="input-group-text" for="assetCategory">Category</label></div><select class="custom-select" id="assetCategory"><option value="">Select Category</option><option value="Laptop">Laptop</option><option value="Monitor">Monitor</option><option value="Keyboard">Keyboard</option><option value="Mouse">Mouse</option><option value="Headset">Headset</option></select></div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Asset Name</span></div><input type="text" class="form-control" id="assetName" placeholder="Enter asset name" /></div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><label class="input-group-text" for="assetStatus">Status</label></div><select class="custom-select" id="assetStatus"><option value="">Select Status</option><option value="A">A — Assigned</option><option value="NA">NA — Not Assigned</option><option value="UM">UM — Under Maintenance</option></select></div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Assigned To</span></div><input type="text" class="form-control" id="assetAssignedTo" placeholder="Enter employee name" /></div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Start Date</span></div><input type="text" class="form-control" id="assetStartDate" placeholder="DD/MM/YYYY" /></div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Return Date</span></div><input type="text" class="form-control" id="assetReturnDate" placeholder="DD/MM/YYYY" /></div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer border-0">
                                <div class="container d-flex justify-content-center">
                                    <button type="button" class="btn btn-secondary mr-2" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-success" id="saveAssetBtn">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="editAssetModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content border-0 shadow">
                            <div class="modal-header bg-dark text-white">
                                <h5 class="modal-title"><i class="fa-solid fa-pen-to-square mr-2"></i>Edit Asset</h5>
                                <button type="button" class="close text-white" data-dismiss="modal"><span>&times;</span></button>
                            </div>
                            <div class="modal-body p-4">
                                <input type="hidden" id="editAssetId" />
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><label class="input-group-text" for="editAssetStatus">Status</label></div><select class="custom-select" id="editAssetStatus"><option value="A">A — Assigned</option><option value="NA">NA — Not Assigned</option><option value="UM">UM — Under Maintenance</option></select></div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2"><div class="input-group-prepend"><span class="input-group-text">Return Date</span></div><input type="text" class="form-control" id="editAssetReturnDate" placeholder="DD/MM/YYYY" /></div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer border-0">
                                <div class="container d-flex justify-content-center">
                                    <button type="button" class="btn btn-secondary mr-2" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-success" id="updateAssetBtn"><i class="fa-solid fa-check mr-2"></i>Update</button>
                                </div>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/select/2.0.3/js/dataTables.select.min.js"></script>
    <script src="https://cdn.datatables.net/select/2.0.3/js/select.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/searchpanes/2.3.1/js/dataTables.searchPanes.min.js"></script>
    <script src="https://cdn.datatables.net/searchpanes/2.3.1/js/searchPanes.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/staterestore/1.4.3/js/dataTables.stateRestore.min.js"></script>
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

            const getEmployees = () => JSON.parse(localStorage.getItem("employees") || "[]");
            const saveEmployees = (data) => localStorage.setItem("employees", JSON.stringify(data));
            const getAssets = () => JSON.parse(localStorage.getItem("assets") || "[]");
            const saveAssets = (data) => localStorage.setItem("assets", JSON.stringify(data));
            const seedAssets = [
                { id: "AST001", category: "Laptop", name: "Dell Inspiron 15", status: "A", assignedTo: "Santhoshkumar D", startDate: "01/01/2024", returnDate: "01/01/2025" },
                { id: "AST002", category: "Laptop", name: "HP EliteBook 840", status: "A", assignedTo: "Arun Kumar", startDate: "15/02/2024", returnDate: "15/02/2025" },
                { id: "AST003", category: "Laptop", name: "Lenovo ThinkPad E14", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST004", category: "Laptop", name: "Apple MacBook Air M2", status: "A", assignedTo: "Priya Sharma", startDate: "10/03/2024", returnDate: "10/03/2025" },
                { id: "AST005", category: "Laptop", name: "Asus VivoBook 15", status: "UM", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST006", category: "Monitor", name: "LG 24\" Full HD", status: "A", assignedTo: "Vignesh R", startDate: "05/01/2024", returnDate: "05/01/2025" },
                { id: "AST007", category: "Monitor", name: "Dell UltraSharp 27\"", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST008", category: "Monitor", name: "Samsung 32\" Curved", status: "A", assignedTo: "Anjali Devi", startDate: "20/02/2024", returnDate: "20/02/2025" },
                { id: "AST009", category: "Monitor", name: "Acer Nitro 24\" FHD", status: "UM", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST010", category: "Monitor", name: "BenQ GW2480 24\"", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST011", category: "Keyboard", name: "Logitech MK270 Wireless", status: "A", assignedTo: "Karthik S", startDate: "12/01/2024", returnDate: "12/01/2025" },
                { id: "AST012", category: "Keyboard", name: "HP K1000 Wired", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST013", category: "Keyboard", name: "Dell KB216 Wired", status: "A", assignedTo: "Meena Lakshmi", startDate: "25/02/2024", returnDate: "25/02/2025" },
                { id: "AST014", category: "Keyboard", name: "Redragon K552 Mechanical", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST015", category: "Keyboard", name: "Logitech K380 Bluetooth", status: "UM", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST016", category: "Mouse", name: "HP X200 Wireless", status: "A", assignedTo: "Rohit Verma", startDate: "08/01/2024", returnDate: "08/01/2025" },
                { id: "AST017", category: "Mouse", name: "Logitech M185 Wireless", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST018", category: "Mouse", name: "Dell MS116 Wired", status: "A", assignedTo: "Divya R", startDate: "18/03/2024", returnDate: "18/03/2025" },
                { id: "AST019", category: "Mouse", name: "Redragon M711 Gaming", status: "UM", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST020", category: "Mouse", name: "Razer DeathAdder V2", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST021", category: "Headset", name: "Jabra Evolve2 30", status: "A", assignedTo: "Suresh Babu", startDate: "03/01/2024", returnDate: "03/01/2025" },
                { id: "AST022", category: "Headset", name: "Sony WH-1000XM5", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST023", category: "Headset", name: "Logitech H390 USB", status: "A", assignedTo: "Kavya N", startDate: "22/02/2024", returnDate: "22/02/2025" },
                { id: "AST024", category: "Headset", name: "HP DHE-8009 Gaming", status: "UM", assignedTo: "—", startDate: "—", returnDate: "—" },
                { id: "AST025", category: "Headset", name: "JBL Quantum 100", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—" }
            ];
            if (!localStorage.getItem("assets")) saveAssets(seedAssets);

            const overlay = $("#sidebarOverlay");
            const allNavLinks = [$("#dashboardId"), $("#addEmployeeId"), $("#viewEmployeeId"), $("#assetAssignId"), $("#assetInventoryId")];

            $(".sideNavToggle").on("click", function (e) {
                e.preventDefault();
                const menu = $(this).closest(".nav-item").find(".dropdown-menu");
                const isOpen = menu.hasClass("open");
                $(".dropdown-menu").removeClass("open");
                $(".sideNavToggle").removeClass("active");
                if (!isOpen) { menu.addClass("open"); $(this).addClass("active"); }
            });
            $(".navbar-toggler").on("click", () => overlay.toggleClass("active"));
            overlay.on("click", () => {
                overlay.removeClass("active"); $("#sidenav").collapse("hide");
            });

            const resetNavLinks = () => allNavLinks.forEach(l => l.removeClass("text-muted").addClass("text-light"));
            const hideSidebar = () => {
                $("#sidenav").collapse("hide"); overlay.removeClass("active");
            };

            const showSection = (activeLink, sectionId, onShow) => {
                resetNavLinks();
                activeLink.removeClass("text-light").addClass("text-muted");
                $(".page-section").hide();
                $("#" + sectionId).show();
                hideSidebar();
                if (onShow) onShow();
            };

            $("#dashboardId").on("click", () => showSection($("#dashboardId"), "section-dashboard", loadDashboard));
            $("#addEmployeeId").on("click", () => showSection($("#addEmployeeId"), "section-addEmp"));
            $("#viewEmployeeId").on("click", () => showSection($("#viewEmployeeId"), "section-viewEmp", loadTable));
            $("#assetAssignId").on("click", () => showSection($("#assetAssignId"), "section-assign"));
            $("#assetInventoryId").on("click", () => showSection($("#assetInventoryId"), "section-inventory", loadAssetTable));

            const loadDashboard = () => {
                const employees = getEmployees();
                const assets = getAssets();
                $("#totalEmp").text(employees.length);
                $("#totalAssets").text(assets.length);
                $("#activeEmp").text(employees.filter(e => e.status === "Active").length);
                $("#inactiveEmp").text(employees.filter(e => e.status === "Inactive").length);
                $("#assignedAssets").text(assets.filter(a => a.status === "A").length);
                $("#unassignedAssets").text(assets.filter(a => a.status === "NA").length);
            };

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
                const inp = $("#fname"); const val = inp.val(); inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") {
                    showError("fname", "Firstname is required!");
                    return false;
                }
                if (/\s/.test(val)) {
                    showError("fname", "Spaces are not allowed!");
                    return false;
                }
                if (!fnamePattern.test(val)) {
                    showError("fname", "Only alphabets and apostrophe are allowed!");
                    return false;
                }
                clearError("fname");
                return true;
            };
            const lnamePattern = /^[A-Za-z]+(['][A-Za-z]+)*'?$/;
            const validateLname = () => {
                const inp = $("#lname"); const val = inp.val(); inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") {
                    showError("lname", "Lastname is required!");
                    return false;
                }
                if (/\s/.test(val)) {
                    showError("lname", "Spaces are not allowed!");
                    return false;
                }
                if (!lnamePattern.test(val)) {
                    showError("lname", "Only alphabets and apostrophe are allowed!");
                    return false;
                }
                clearError("lname");
                return true;
            };
            const validateGender = () => {
                const checked = $("input[name='gender']:checked");
                const errorEl = $("input[name='gender']").closest(".col-md-6").find(".error-msg");
                if (checked.length === 0) {
                    errorEl.text("Please select a gender!");
                    return false;
                }
                errorEl.text("");
                return true;
            };
            const validateDob = () => {
                const inp = $("#dob"); const val = inp.val().trim(); inp.removeClass("is-valid is-invalid");
                if (val === "") {
                    showError("dob", "Date of Birth is required!");
                    return false;
                }
                clearError("dob");
                return true;
            };
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const validateEmail = () => {
                const inp = $("#email"); const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") {
                    showError("email", "Email is required!");
                    return false;
                }
                if (/\s/.test(val)) {
                    showError("email", "Spaces are not allowed!");
                    return false;
                }
                if (!emailPattern.test(val)) {
                    showError("email", "Enter a valid email address!");
                    return false;
                }
                clearError("email"); return true;
            };
            const contactPattern = /^[0-9]{10}$/;
            const validateContact = () => {
                const inp = $("#contact"); const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") {
                    showError("contact", "Contact number is required!");
                    return false;
                }
                if (!contactPattern.test(val)) {
                    showError("contact", "Enter a valid 10-digit number!");
                    return false;
                }
                clearError("contact");
                return true;
            };
            const passPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@!$%&])[A-Za-z\d@!$%&]{8,}$/;
            const validatePass = () => {
                const inp = $("#pass"); const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") {
                    showError("pass", "Password is required!");
                    return false;
                }
                if (/\s/.test(val)) {
                    showError("pass", "Spaces are not allowed!");
                    return false;
                }
                if (val.length < 8) {
                    showError("pass", "Password must be at least 8 characters!");
                    return false;
                }
                if (!passPattern.test(val)) {
                    showError("pass", "Must contain uppercase, lowercase, number and special character!");
                    return false;
                }
                clearError("pass");
                if ($("#cpass").val().trim() !== "") validateCpass();
                return true;
            };
            const validateCpass = () => {
                const inp = $("#cpass"); const cval = inp.val();
                const pval = $("#pass").val();
                const errEl = inp.closest(".input-group").siblings(".error-msg");
                inp.removeClass("is-valid is-invalid"); errEl.removeClass("text-success").addClass("text-danger");
                if (cval.trim() === "") {
                    showError("cpass", "Please confirm your password!");
                    return false;
                }
                if (/\s/.test(cval)) {
                    showError("cpass", "Spaces are not allowed!");
                    return false;
                }
                if (cval !== pval) {
                    showError("cpass", "Passwords do not match!");
                    return false;
                }
                inp.addClass("is-valid");
                errEl.removeClass("text-danger").addClass("text-success").text("Passwords matched!");
                return true;
            };
            const validateDept = () => {
                const val = $("#dept").val();
                const errEl = $("#dept").closest(".input-group").siblings(".error-msg");
                $("#dept").removeClass("is-valid is-invalid");
                if (!val || val === "") {
                    errEl.text("Department is required!"); $("#dept").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#dept").addClass("is-valid");
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
                if (!val || val === "") {
                    errEl.text("Role is required!"); $("#deptrole").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#deptrole").addClass("is-valid");
                return true;
            };
            const validateLocation = () => {
                const val = $("#location").val();
                const errEl = $("#location").closest(".col-md-12").find(".error-msg");
                $("#location").next(".select2-container--classic").find(".select2-selection").removeClass("is-valid is-invalid");
                if (!val || val === "") {
                    errEl.text("Location is required!"); $("#location").next(".select2-container--classic").find(".select2-selection").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#location").next(".select2-container--classic").find(".select2-selection").addClass("is-valid");
                return true;
            };

            $("#fname").on("input", validateFname).on("blur", () => {
                if ($("#fname").val().trim() === "") showError("fname", "Firstname is required!");
            });
            $("#lname").on("input", validateLname).on("blur", () => {
                if ($("#lname").val().trim() === "") showError("lname", "Lastname is required!");
            });
            $("input[name='gender']").on("change", validateGender);
            $("#dob").on("input", validateDob).on("blur", () => {
                if ($("#dob").val().trim() === "") showError("dob", "Date of Birth is required!");
            });
            $("#email").on("input", validateEmail).on("blur", () => {
                if ($("#email").val().trim() === "") showError("email", "Email is required!");
            });
            $("#contact").on("keydown", function (e) {
                const allowed = ["Backspace", "Delete", "ArrowLeft", "ArrowRight", "Tab"];
                if (allowed.includes(e.key)) return;
                if (!/^[0-9]$/.test(e.key)) {
                    e.preventDefault();
                    showError("contact", "Only numbers are allowed!");
                }
            }).on("input", validateContact).on("blur", () => {
                if ($("#contact").val().trim() === "") showError("contact", "Contact number is required!");
            });
            $("#pass").on("input", validatePass).on("blur", () => {
                if ($("#pass").val().trim() === "") showError("pass", "Password is required!");
            });
            $("#cpass").on("input", validateCpass).on("blur", () => {
                if ($("#cpass").val().trim() === "") showError("cpass", "Please confirm your password!");
            });
            $("#deptrole").on("change", validateRole);
            $("#location").on("change", validateLocation);

            Object.keys(deptRoles).forEach(dept => $("#dept").append(`<option value="${dept}">${dept}</option>`));
            $("#dept").on("change", function () {
                const sel = $(this).val();
                $("#deptrole").html('<option value="">Select Role</option>').removeClass("is-valid is-invalid").prop("disabled", true);
                $("#deptrole").closest(".input-group").siblings(".error-msg").text("");
                if (sel === "") {
                    validateDept();
                    return;
                }
                deptRoles[sel].forEach(r => $("#deptrole").append(`<option value="${r}">${r}</option>`));
                $("#deptrole").prop("disabled", false); validateDept();
            });

            $("#location").select2({
                theme: "classic",
                placeholder: "Select Location",
                allowClear: true,
                data: locationData,
                dropdownParent: $("#addEmpModal")
            });

            $(".toggle-password").on("click", function () {
                const inp = $(this).closest(".input-group").find("input");
                const icon = $(this).find("i");
                if (inp.attr("type") === "password") {
                    inp.attr("type", "text");
                    icon.removeClass("fa-eye").addClass("fa-eye-slash");
                }
                else {
                    inp.attr("type", "password");
                    icon.removeClass("fa-eye-slash").addClass("fa-eye");
                }
            });

            const generateId = () => {
                const employees = getEmployees();
                const lastId = employees.length > 0 ? employees[employees.length - 1].id : "EMP000";
                const num = parseInt(lastId.replace("EMP", "")) + 1;
                return "EMP" + String(num).padStart(3, "0");
            };

            $("#addEmpBtn").on("click", () => {
                const results = [validateFname(), validateLname(), validateGender(), validateDob(), validateEmail(), validateContact(), validatePass(), validateCpass(), validateDept(), validateRole(), validateLocation()];
                if (!results.every(Boolean)) return;
                const employee = {
                    id: generateId(),
                    firstname: $("#fname").val().trim(),
                    lastname: $("#lname").val().trim(),
                    fullname: `${$("#fname").val().trim()} ${$("#lname").val().trim()}`,
                    gender: $("input[name='gender']:checked").val(),
                    dob: $("#dob").val().trim(),
                    email: $("#email").val().trim(),
                    contact: $("#contact").val().trim(),
                    password: $("#pass").val().trim(),
                    department: $("#dept").val(),
                    role: $("#deptrole").val(),
                    location: $("#location").val() || "",
                    joindate: new Date().toLocaleDateString("en-GB"),
                    enddate: "",
                    status: "Active"
                };
                const employees = getEmployees();
                employees.push(employee);
                saveEmployees(employees);
                Swal.fire({
                    title: "Success",
                    icon: "success",
                    text: "Employee added successfully!"
                });
                $("#addEmpModal").modal("hide");
            });

            $("#addEmpModal").on("hidden.bs.modal", () => {
                $("#fname, #lname, #dob, #email, #contact, #pass, #cpass").val("").removeClass("is-valid is-invalid");
                $("input[name='gender']").prop("checked", false);
                $("#dept").val("").removeClass("is-valid is-invalid");
                $("#deptrole").html('<option value="">Select Role</option>').prop("disabled", true).removeClass("is-valid is-invalid");
                $("#location").val(null).trigger("change");
                $("#location").next(".select2-container--classic").find(".select2-selection").removeClass("is-valid is-invalid");
                $(".error-msg").text("").removeClass("text-success").addClass("text-danger");
            });
            
            let table = null;
            const showEditError = (fieldId, msg) => {
                $("#" + fieldId).closest(".input-group").siblings(".error-msg").text(msg);
                $("#" + fieldId).removeClass("is-valid").addClass("is-invalid");
            };
            const clearEditError = (fieldId) => {
                $("#" + fieldId).closest(".input-group").siblings(".error-msg").text("");
                $("#" + fieldId).removeClass("is-invalid").addClass("is-valid");
            };

            const fnameEditPattern = /^[A-Za-z]+(['][A-Za-z]+)*'?$/;
            const validateEditFname = () => {
                const inp = $("#editFname");
                const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") {
                    showEditError("editFname", "Firstname is required!");
                    return false;
                }
                if (/\s/.test(val)) {
                    showEditError("editFname", "Spaces are not allowed!");
                    return false;
                }
                if (!fnameEditPattern.test(val)) { showEditError("editFname", "Only alphabets and apostrophe are allowed!"); return false; }
                clearEditError("editFname");
                return true;
            };
            const lnameEditPattern = /^[A-Za-z]+(['][A-Za-z]+)*'?$/;
            const validateEditLname = () => {
                const inp = $("#editLname");
                const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") {
                    showEditError("editLname", "Lastname is required!");
                    return false;
                }
                if (/\s/.test(val)) {
                    showEditError("editLname", "Spaces are not allowed!");
                    return false;
                }
                if (!lnameEditPattern.test(val)) {
                    showEditError("editLname", "Only alphabets and apostrophe are allowed!");
                    return false;
                }
                clearEditError("editLname");
                return true;
            };
            const validateEditGender = () => {
                const checked = $("input[name='editGender']:checked");
                const errorEl = $("input[name='editGender']").closest(".col-md-6").find(".error-msg");
                if (checked.length === 0) {
                    errorEl.text("Please select a gender!");
                    return false;
                }
                errorEl.text("");
                return true;
            };
            const validateEditDob = () => {
                const inp = $("#editDob");
                const val = inp.val().trim();
                inp.removeClass("is-valid is-invalid");
                if (val === "") {
                    showEditError("editDob", "Date of Birth is required!");
                    return false;
                }
                clearEditError("editDob");
                return true;
            };
            const emailEditPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const validateEditEmail = () => {
                const inp = $("#editEmail");
                const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") {
                    showEditError("editEmail", "Email is required!");
                    return false;
                }
                if (/\s/.test(val)) {
                    showEditError("editEmail", "Spaces are not allowed!");
                    return false;
                }
                if (!emailEditPattern.test(val)) {
                    showEditError("editEmail", "Enter a valid email address!");
                    return false;
                }
                clearEditError("editEmail");
                return true;
            };
            const contactEditPattern = /^[0-9]{10}$/;
            const validateEditContact = () => {
                const inp = $("#editContact");
                const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") {
                    showEditError("editContact", "Contact number is required!");
                    return false;
                }
                if (!contactEditPattern.test(val)) {
                    showEditError("editContact", "Enter a valid 10-digit number!");
                    return false;
                }
                clearEditError("editContact");
                return true;
            };
            const passEditPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@!$%&])[A-Za-z\d@!$%&]{8,}$/;
            const validateEditPass = () => {
                const inp = $("#editPassword");
                const val = inp.val();
                inp.removeClass("is-valid is-invalid");
                if (val.trim() === "") {
                    showEditError("editPassword", "Password is required!");
                    return false;
                }
                if (/\s/.test(val)) {
                    showEditError("editPassword", "Spaces are not allowed!");
                    return false;
                }
                if (val.length < 8) {
                    showEditError("editPassword", "Password must be at least 8 characters!");
                    return false;
                }
                if (!passEditPattern.test(val)) { showEditError("editPassword", "Must contain uppercase, lowercase, number and special character!"); return false; }
                clearEditError("editPassword");
                if ($("#editCpass").val().trim() !== "") validateEditCpass();
                return true;
            };
            const validateEditCpass = () => {
                const inp = $("#editCpass");
                const cval = inp.val();
                const pval = $("#editPassword").val();
                const errEl = inp.closest(".input-group").siblings(".error-msg");
                inp.removeClass("is-valid is-invalid");
                errEl.removeClass("text-success").addClass("text-danger");
                if (cval.trim() === "") {
                    showEditError("editCpass", "Please confirm your password!");
                    return false;
                }
                if (/\s/.test(cval)) {
                    showEditError("editCpass", "Spaces are not allowed!");
                    return false;
                }
                if (cval !== pval) {
                    showEditError("editCpass", "Passwords do not match!");
                    return false;
                }
                inp.addClass("is-valid");
                errEl.removeClass("text-danger").addClass("text-success").text("Passwords matched!");
                return true;
            };
            const validateEditDept = () => {
                const val = $("#editDept").val();
                const errEl = $("#editDept").closest(".input-group").siblings(".error-msg");
                $("#editDept").removeClass("is-valid is-invalid");
                if (!val || val === "") {
                    errEl.text("Department is required!"); $("#editDept").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#editDept").addClass("is-valid");
                return true;
            };
            const validateEditRole = () => {
                if ($("#editRole").prop("disabled")) {
                    $("#editRole").closest(".input-group").siblings(".error-msg").text("Please select a Department first!");
                    return false;
                }
                const val = $("#editRole").val();
                const errEl = $("#editRole").closest(".input-group").siblings(".error-msg");
                $("#editRole").removeClass("is-valid is-invalid");
                if (!val || val === "") {
                    errEl.text("Role is required!"); $("#editRole").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#editRole").addClass("is-valid");
                return true;
            };
            const validateEditLocation = () => {
                const val = $("#editLocation").val();
                const errEl = $("#editLocation").closest(".col-md-6").find(".error-msg");
                $("#editLocation").next(".select2-container--classic").find(".select2-selection").removeClass("is-valid is-invalid");
                if (!val || val === "") {
                    errEl.text("Location is required!");
                    $("#editLocation").next(".select2-container--classic").find(".select2-selection").addClass("is-invalid");
                    return false;
                }
                errEl.text("");
                $("#editLocation").next(".select2-container--classic").find(".select2-selection").addClass("is-valid");
                return true;
            };
            const validateEditStatus = () => {
                const val = $("#editStatus").val();
                const errEl = $("#editStatus").closest(".input-group").siblings(".error-msg");
                $("#editStatus").removeClass("is-valid is-invalid");
                if (!val || val === "") {
                    errEl.text("Status is required!"); $("#editStatus").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#editStatus").addClass("is-valid");
                return true;
            };

            $("#editFname").on("input", validateEditFname).on("blur", () => {
                if ($("#editFname").val().trim() === "") showEditError("editFname", "Firstname is required!");
            });
            $("#editLname").on("input", validateEditLname).on("blur", () => {
                if ($("#editLname").val().trim() === "") showEditError("editLname", "Lastname is required!");
            });
            $("input[name='editGender']").on("change", validateEditGender);
            $("#editDob").on("input", validateEditDob).on("blur", () => {
                if ($("#editDob").val().trim() === "") showEditError("editDob", "Date of Birth is required!");
            });
            $("#editEmail").on("input", validateEditEmail).on("blur", () => {
                if ($("#editEmail").val().trim() === "") showEditError("editEmail", "Email is required!");
            });
            $("#editContact").on("keydown", function (e) {
                const allowed = ["Backspace", "Delete", "ArrowLeft", "ArrowRight", "Tab"];
                if (allowed.includes(e.key)) return;
                if (!/^[0-9]$/.test(e.key)) { e.preventDefault(); showEditError("editContact", "Only numbers are allowed!"); }
            }).on("input", validateEditContact).on("blur", () => {
                if ($("#editContact").val().trim() === "") showEditError("editContact", "Contact number is required!");
            });
            $("#editPassword").on("input", validateEditPass).on("blur", () => {
                if ($("#editPassword").val().trim() === "") showEditError("editPassword", "Password is required!");
            });
            $("#editCpass").on("input", validateEditCpass).on("blur", () => {
                if ($("#editCpass").val().trim() === "") showEditError("editCpass", "Please confirm your password!");
            });
            $("#editDept").on("change", function () {
                validateEditDept();
                const sel = $(this).val();
                $("#editRole").html('<option value="">Select Role</option>').prop("disabled", true);
                if (!sel) return;
                deptRoles[sel].forEach(r => $("#editRole").append(`<option value="${r}">${r}</option>`));
                $("#editRole").prop("disabled", false);
            });
            $("#editRole").on("change", validateEditRole);
            $("#editLocation").on("change", validateEditLocation);
            $("#editStatus").on("change", validateEditStatus);

            Object.keys(deptRoles).forEach(dept => $("#editDept").append(`<option value="${dept}">${dept}</option>`));
            $("#editLocation").select2({
                theme: "classic",
                placeholder: "Select Location",
                allowClear: true,
                data: locationData,
                dropdownParent: $("#editEmpModal")
            });

            $("#editEmpModal").on("click", ".toggle-password", function () {
                const inp = $(this).closest(".input-group").find("input");
                const icon = $(this).find("i");
                if (inp.attr("type") === "password") {
                    inp.attr("type", "text");
                    icon.removeClass("fa-eye").addClass("fa-eye-slash");
                }
                else {
                    inp.attr("type", "password");
                    icon.removeClass("fa-eye-slash").addClass("fa-eye");
                }
            });

            const populateEditModal = (emp, mode) => {
                $("#editEmpId").val(emp.id); $("#editMode").val(mode);
                $("#editFname").val(emp.firstname || "").prop("disabled", mode === "child");
                $("#editLname").val(emp.lastname || "").prop("disabled", mode === "child");
                $("input[name='editGender']").prop("disabled", mode === "child");
                const gender = (emp.gender || "").toLowerCase();
                if (gender === "male") $("#editMale").prop("checked", true);
                else if (gender === "female") $("#editFemale").prop("checked", true);
                else $("input[name='editGender']").prop("checked", false);
                $("#editDob").val(emp.dob || "").prop("disabled", mode === "child");
                $("#editEmail").val(emp.email || "").prop("disabled", mode === "child");
                $("#editContact").val(emp.contact || "").prop("disabled", mode === "child");
                $("#editPassword").val(emp.password || "").prop("disabled", mode === "child");
                $("#editCpass").val(emp.password || "").prop("disabled", mode === "child");
                $(".toggle-password").prop("disabled", mode === "child");
                $("#editStatus").val(emp.status || "Active").prop("disabled", mode === "child");
                $("#editDept").val(emp.department || "").prop("disabled", mode === "parent");
                if (emp.department && deptRoles[emp.department]) {
                    $("#editRole").html('<option value="">Select Role</option>');
                    deptRoles[emp.department].forEach(r => $("#editRole").append(`<option value="${r}">${r}</option>`));
                    $("#editRole").val(emp.role || "").prop("disabled", mode === "parent");
                } else {
                    $("#editRole").html('<option value="">Select Role</option>').prop("disabled", true);
                }
                const savedLocation = Array.isArray(emp.location) ? emp.location[0] || "" : (emp.location || "");
                $("#editLocation").val(savedLocation).trigger("change").prop("disabled", mode === "parent");
                $("#editJoinDate").val(emp.joindate || "");
                $("#editEndDate").val(emp.enddate || "").prop("disabled", mode === "parent");
                if (mode === "parent") {
                    $("#editDept, #editRole").addClass("opacity-50");
                    $("#editLocation + .select2-container").css("opacity", "0.5");
                    $("#editJoinDate, #editEndDate").prop("disabled", true);
                } else {
                    $("#editDept, #editRole").removeClass("opacity-50");
                    $("#editLocation + .select2-container").css("opacity", "1");
                    $("#editFname, #editLname, #editDob, #editEmail, #editContact, #editPassword, #editCpass").closest(".input-group").css("opacity", "0.6");
                    $("input[name='editGender']").closest(".row").css("opacity", "0.6");
                    $("#editEndDate").prop("disabled", false);
                }
            };

            $("#editEmpModal").on("hidden.bs.modal", function () {
                $("#editFname, #editLname, #editDob, #editEmail, #editContact, #editPassword, #editCpass, #editJoinDate, #editEndDate").val("").prop("disabled", false);
                $("input[name='editGender']").prop("checked", false).prop("disabled", false);
                $("#editDept").val("").prop("disabled", false);
                $("#editRole").html('<option value="">Select Role</option>').prop("disabled", true);
                $("#editLocation").val(null).trigger("change").prop("disabled", false);
                $("#editLocation").next(".select2-container--classic").find(".select2-selection").removeClass("is-valid is-invalid");
                $(".error-msg").text("");
                $("#editFname, #editLname, #editDob, #editEmail, #editContact, #editPassword, #editCpass").closest(".input-group").css("opacity", "1");
                $("input[name='editGender']").closest(".row").css("opacity", "1");
                $("#editDept, #editRole").removeClass("opacity-50");
                $("#editLocation + .select2-container").css("opacity", "1");
                $("#editPassword, #editCpass").attr("type", "password");
                $(".toggle-password i").removeClass("fa-eye-slash").addClass("fa-eye");
                $("#editStatus").val("Active").prop("disabled", false);
            });

            const childFormat = (d) => {
                const location = Array.isArray(d.location) ? d.location[0] || "—" : (d.location || "—");
                return `<table class="table table-sm table-bordered table-striped table-hover child-table">
                    <thead class="thead-dark text-center">
                        <tr>
                            <th rowspan="2" class="text-center align-middle">Location</th>
                            <th colspan="2" class="text-center align-middle">Position</th>
                            <th rowspan="2" class="text-center align-middle">Join Date</th>
                            <th rowspan="2" class="text-center align-middle">Relieve Date</th>
                            <th rowspan="2" class="text-center align-middle">Action</th>
                        </tr>
                        <tr><th class="text-center align-middle">Department</th><th class="text-center align-middle">Role</th></tr>
                    </thead>
                    <tbody>
                        <tr class="text-center">
                            <td>${location}</td><td>${d.department || "—"}</td><td>${d.role || "—"}</td>
                            <td>${d.joindate || "—"}</td><td>${d.enddate || "—"}</td>
                            <td><button type="button" class="btn btn-sm btn-outline-primary childEditBtn" data-id="${d.id}" title="Edit"><i class="fa-solid fa-pen-to-square"></i></button></td>
                        </tr>
                    </tbody>
                </table>`;
            };

            const rebuildTableHeader = () => {
                $("#empTable thead").empty().append(`
                    <tr class="text-center">
                        <th class="text-center align-middle" style="width:40px"></th>
                        <th rowspan="2" class="text-center align-middle">Full Name</th>
                        <th rowspan="2" class="text-center align-middle">Gender</th>
                        <th rowspan="2" class="text-center align-middle">DOB</th>
                        <th rowspan="2" class="text-center align-middle">Email</th>
                        <th rowspan="2" class="text-center align-middle">Contact</th>
                        <th rowspan="2" class="text-center align-middle">Status</th>
                        <th rowspan="2" class="text-center align-middle">Action</th>
                        <th rowspan="2" class="text-center align-middle">Profile</th>
                    </tr>`);
                $("#empTable thead").addClass("thead-dark");
            };

            const dtButtons = [
                {
                    text: '<i class="fa-solid fa-filter mr-1"></i> Filters',
                    className: "btn btn-sm mb-2", action: function () { $(".dtsp-panesContainer").slideToggle(200); }
                },
                {
                    extend: "collection",
                    text: '<i class="fa-solid fa-download mr-1"></i> Export',
                    className: "btn btn-sm mb-3",
                    buttons: [
                        {
                            extend: "copyHtml5",
                            text: '<i class="fa-solid fa-copy mr-1"></i> Copy',
                            className: "btn btn-sm"
                        },
                        {
                            extend: "excelHtml5",
                            text: '<i class="fa-solid fa-file-excel mr-1"></i> Excel',
                            className: "btn btn-sm"
                        },
                        {
                            extend: "pdfHtml5",
                            text: '<i class="fa-solid fa-file-pdf mr-1"></i> PDF',
                            className: "btn btn-sm"
                        },
                        {
                            extend: "csvHtml5",
                            text: '<i class="fa-solid fa-file-csv mr-1"></i> CSV',
                            className: "btn btn-sm"
                        },
                        {
                            extend: "print",
                            text: '<i class="fa-solid fa-print mr-1"></i> Print',
                            className: "btn btn-sm"
                        }
                    ]
                },
                {
                    extend: "createState",
                    text: "Save Filter",
                    className: "btn btn-sm mb-3"
                },
                {
                    extend: "savedStates",
                    text: "Load Filters",
                    className: "btn btn-sm mb-3 btn-secondary"
                }
            ];

            const dtDom =
                '<"row"<"col-12"<"dt-filter-btn">>>' +
                '<"row"<"col-md-12 mb-2"P>>' +
                '<"row align-items-center mb-2"<"col-md-2 mt-n3"l><"col-md-1"<"dt-state-btn">><"col-md-1"<"dt-load-btn">><"col-md-8 d-flex justify-content-end"<"dt-export-btn">f>>' +
                '<"d-none"B>t<"d-flex justify-content-between align-items-center pt-2"ip>';

            const dtInitComplete = function () {
                const btnContainer = $(this.api().table().container());
                const allBtns = btnContainer.find(".dt-buttons button");
                btnContainer.find(".dt-filter-btn").append(allBtns.eq(0).detach());
                btnContainer.find(".dt-export-btn").append(allBtns.eq(1).detach());
                btnContainer.find(".dt-state-btn").append(allBtns.eq(2).detach());
                btnContainer.find(".dt-load-btn").append(allBtns.eq(3).detach());
                $(".dtsp-panesContainer").hide();
            };  
            const loadTable = () => {
                const employees = getEmployees();
                if (table && $.fn.DataTable.isDataTable("#empTable")) {
                    table.clear().rows.add(employees).draw();
                    rebuildTableHeader();
                    return;
                }
                if ($.fn.DataTable.isDataTable("#empTable")) {
                    $("#empTable").DataTable().destroy();
                    $("#empTable tbody").empty();
                }
                table = $("#empTable").DataTable({
                    data: employees,
                    pageLength: 10,
                    ordering: true,
                    stateSave: false,
                    searching: true,
                    info: true,
                    autoWidth: true,
                    language: {
                        search: "",
                        searchPlaceholder: "Search employees...",
                        emptyTable: "No employees found",
                        zeroRecords: "No matching employees found",
                        info: "Showing _START_ to _END_ of _TOTAL_ employees",
                        lengthMenu: "Show _MENU_"
                    },
                    searchPanes: {
                        viewCount: true,
                        cascadePanes: true,
                        layout: "columns-3",
                        orderable: false,
                        clear: false,
                        initCollapsed: true
                    },
                    dom: dtDom,
                    buttons: dtButtons,
                    columnDefs: [{
                        targets: [0, 7, 8],
                        searchPanes: { show: false }
                    }],
                    columns: [
                        {
                            className: "dt-control text-center align-middle",
                            orderable: false,
                            data: null,
                            defaultContent: "",
                            width: "40px"
                        },
                        {
                            data: "fullname",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            searchPanes: { show: true },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "gender",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            orderable: false,
                            searchPanes: { show: true },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "dob",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            orderable: false,
                            searchPanes: { show: false },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "email",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            orderable: false,
                            searchPanes: { show: false },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "contact",
                            className: "text-center align-middle",
                            defaultContent: "—", orderable: false,
                            searchPanes: { show: false },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "status",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            searchPanes: { show: true },
                            render: function (data) {
                                const cls = data === "Active" ? "status-active" : "status-inactive";
                                const icon = data === "Active" ? '<i class="fa-solid fa-circle-check mr-1"></i>' : '<i class="fa-solid fa-circle-xmark mr-1"></i>';
                                return `<span class="${cls}">${icon}${data || "—"}</span>`;
                            }
                        },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            searchPanes: { show: false },
                            className: "text-center align-middle",
                            render: function (data) { return `<button type="button" class="btn btn-sm btn-outline-primary parentEditBtn" data-id="${data.id}" title="Edit"><i class="fa-solid fa-pen-to-square"></i></button>`; }
                        },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            searchPanes: { show: false },
                            className: "text-center align-middle",
                            render: function (data) { return `<button type="button" class="btn btn-sm btn-outline-info profileBtn" data-id="${data.id}" title="View Profile"><i class="fa-solid fa-user"></i></button>`; }
                        }
                    ],
                    initComplete: function () {
                        rebuildTableHeader();
                        const btnContainer = $(this.api().table().container());
                        const allBtns = btnContainer.find(".dt-buttons button");
                        btnContainer.find(".dt-filter-btn").append(allBtns.eq(0).detach());
                        btnContainer.find(".dt-export-btn").append(allBtns.eq(1).detach());
                        btnContainer.find(".dt-state-btn").append(allBtns.eq(2).detach());
                        btnContainer.find(".dt-load-btn").append(allBtns.eq(3).detach());
                        $(".dtsp-panesContainer").hide();
                    }
                });
                table.on("click", "tbody td.dt-control", function (e) {
                    const tr = e.target.closest("tr");
                    const row = table.row(tr);
                    if (row.child.isShown()) {
                        row.child.hide();
                        $(tr).removeClass("shown");
                    }
                    else {
                        row.child(childFormat(row.data())).show();
                        $(tr).addClass("shown");
                    }
                });
            };

            $("#empTable").on("click", ".parentEditBtn", function () {
                const emp = getEmployees().find(e => e.id === $(this).data("id"));
                if (!emp) return;
                populateEditModal(emp, "parent");
                $("#editEmpModal").modal("show");
            });
            $(document).on("click", ".childEditBtn", function () {
                const emp = getEmployees().find(e => e.id === $(this).data("id"));
                if (!emp) return;
                populateEditModal(emp, "child");
                $("#editEmpModal").modal("show");
            });
            $("#updateEmpBtn").on("click", function () {
                const id = $("#editEmpId").val();
                const mode = $("#editMode").val();
                const employees = getEmployees();
                const idx = employees.findIndex(e => e.id === id);
                if (idx === -1) return;
                if (mode === "parent") {
                    const results = [validateEditFname(), validateEditLname(), validateEditGender(), validateEditDob(), validateEditEmail(), validateEditContact(), validateEditPass(), validateEditCpass()];
                    if (!results.every(Boolean)) return;
                    employees[idx].firstname = $("#editFname").val().trim();
                    employees[idx].lastname = $("#editLname").val().trim();
                    employees[idx].fullname = `${employees[idx].firstname} ${employees[idx].lastname}`;
                    employees[idx].gender = $("input[name='editGender']:checked").val();
                    employees[idx].dob = $("#editDob").val().trim();
                    employees[idx].email = $("#editEmail").val().trim();
                    employees[idx].contact = $("#editContact").val().trim();
                    employees[idx].password = $("#editPassword").val().trim();
                    employees[idx].status = $("#editStatus").val();
                } else {
                    const results = [validateEditDept(), validateEditRole(), validateEditLocation()];
                    if (!results.every(Boolean)) return;
                    employees[idx].department = $("#editDept").val();
                    employees[idx].role = $("#editRole").val();
                    employees[idx].location = $("#editLocation").val() || "";
                    employees[idx].enddate = $("#editEndDate").val().trim();
                    employees[idx].status = $("#editStatus").val();
                }
                saveEmployees(employees);
                $("#editEmpModal").modal("hide"); loadTable();
                Swal.fire({
                    icon: "success",
                    title: "Updated!",
                    text: "Employee updated successfully."
                });
            });
            $("#deleteEmpBtn").on("click", function () {
                const id = $("#editEmpId").val();
                const employees = getEmployees();
                const emp = employees.find(e => e.id === id);
                if (!emp) return;
                Swal.fire({
                    title: "Delete Employee?",
                    text: `Are you sure you want to delete ${emp.fullname}?`,
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#dc3545",
                    confirmButtonText: "Delete"
                })
                    .then(function (result) {
                        if (result.isConfirmed) {
                            saveEmployees(employees.filter(e => e.id !== id));
                            $("#editEmpModal").modal("hide"); loadTable();
                            Swal.fire({
                                icon: "success",
                                title: "Deleted!",
                                text: `${emp.fullname} removed.`
                            });
                        }
                    });
            });

            $("#assignModal").on("show.bs.modal", function () {
                const employees = getEmployees();
                const assets = getAssets();
                $("#assignEmployee").html('<option value="">Select Employee</option>');
                employees.filter(e => e.status === "Active").forEach(function (emp) {
                    $("#assignEmployee").append(`<option value="${emp.id}">${emp.fullname} — ${emp.department} (${emp.id})</option>`);
                });
                const categories = [...new Set(assets.filter(a => a.status === "NA").map(a => a.category))];
                $("#assignCategory").html('<option value="">Select Category</option>');
                categories.forEach(cat => $("#assignCategory").append(`<option value="${cat}">${cat}</option>`));
                $("#assignAsset").html('<option value="">Select Asset</option>').prop("disabled", true);
                $("#assignStartDate").val(new Date().toLocaleDateString("en-GB"));
            });
            $("#assignCategory").on("change", function () {
                const sel = $(this).val();
                const assets = getAssets();
                $("#assignAsset").html('<option value="">Select Asset</option>').prop("disabled", true).removeClass("is-valid is-invalid");
                $("#assignAsset").closest(".input-group").siblings(".error-msg").text("");
                if (!sel) return;
                const filtered = assets.filter(a => a.category === sel && a.status === "NA");
                if (filtered.length === 0) {
                    $("#assignCategory").closest(".input-group").siblings(".error-msg").text("No available assets in this category!");
                    return;
                }
                filtered.forEach(asset => $("#assignAsset").append(`<option value="${asset.id}">${asset.name} (${asset.id})</option>`));
                $("#assignAsset").prop("disabled", false);
            });
            const validateAssignEmployee = () => {
                const val = $("#assignEmployee").val();
                const errEl = $("#assignEmployee").closest(".input-group").siblings(".error-msg");
                $("#assignEmployee").removeClass("is-valid is-invalid");
                if (!val || val === "") {
                    errEl.text("Please select an employee!"); $("#assignEmployee").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#assignEmployee").addClass("is-valid");
                return true;
            };
            const validateAssignCategory = () => {
                const val = $("#assignCategory").val();
                const errEl = $("#assignCategory").closest(".input-group").siblings(".error-msg");
                $("#assignCategory").removeClass("is-valid is-invalid");
                if (!val || val === "") {
                    errEl.text("Please select a category!"); $("#assignCategory").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#assignCategory").addClass("is-valid");
                return true;
            };
            const validateAssignAsset = () => {
                if ($("#assignAsset").prop("disabled")) {
                    $("#assignAsset").closest(".input-group").siblings(".error-msg").text("Please select a category first!");
                    return false;
                }
                const val = $("#assignAsset").val();
                const errEl = $("#assignAsset").closest(".input-group").siblings(".error-msg");
                $("#assignAsset").removeClass("is-valid is-invalid");
                if (!val || val === "") {
                    errEl.text("Please select an asset!"); $("#assignAsset").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#assignAsset").addClass("is-valid");
                return true;
            };
            $("#assignEmployee").on("change", validateAssignEmployee);
            $("#assignCategory").on("change", validateAssignCategory);
            $("#assignAsset").on("change", validateAssignAsset);
            $("#confirmAssignBtn").on("click", function () {
                const results = [validateAssignEmployee(), validateAssignCategory(), validateAssignAsset()];
                if (!results.every(Boolean)) return;
                const empId = $("#assignEmployee").val();
                const assetId = $("#assignAsset").val();
                const emp = getEmployees().find(e => e.id === empId);
                const assets = getAssets();
                const assetIdx = assets.findIndex(a => a.id === assetId);
                if (assetIdx === -1 || !emp) return;
                assets[assetIdx].status = "A";
                assets[assetIdx].assignedTo = emp.fullname;
                assets[assetIdx].startDate = $("#assignStartDate").val().trim();
                assets[assetIdx].returnDate = $("#assignReturnDate").val().trim() || "—";
                saveAssets(assets); $("#assignModal").modal("hide");
                Swal.fire({
                    icon: "success",
                    title: "Assigned!",
                    html: `<b>${assets[assetIdx].name}</b> assigned to <b>${emp.fullname}</b> successfully.`
                });
            });
            $("#assignModal").on("hidden.bs.modal", function () {
                $("#assignEmployee, #assignCategory").val("");
                $("#assignAsset").html('<option value="">Select Asset</option>').prop("disabled", true);
                $("#assignReturnDate").val(""); $("#assignStartDate").val(new Date().toLocaleDateString("en-GB"));
                $("#assignEmployee, #assignCategory, #assignAsset").removeClass("is-valid is-invalid");
                $(".error-msg").text("");
            });

            let assetTable = null;

            const renderStatus = (status) => {
                if (status === "A") return `<span class="status-active"><i class="fa-solid fa-circle-check mr-1"></i>A</span>`;
                if (status === "NA") return `<span class="status-inactive"><i class="fa-solid fa-circle-xmark mr-1"></i>NA</span>`;
                if (status === "UM") return `<span class="text-warning font-weight-bold"><i class="fa-solid fa-triangle-exclamation mr-1"></i>UM</span>`;
                return status || "—";
            };

            const generateAssetId = () => {
                const assets = getAssets();
                const lastId = assets.length > 0 ? assets[assets.length - 1].id : "AST000";
                const num = parseInt(lastId.replace("AST", "")) + 1;
                return "AST" + String(num).padStart(3, "0");
            };

            const loadAssetTable = () => {
                const assets = getAssets();
                if (assetTable && $.fn.DataTable.isDataTable("#assetTable")) {
                    assetTable.clear().rows.add(assets).draw();
                    return;
                }
                if ($.fn.DataTable.isDataTable("#assetTable")) {
                    $("#assetTable").DataTable().destroy();
                    $("#assetTable tbody").empty();
                }
                assetTable = $("#assetTable").DataTable({
                    data: assets,
                    pageLength: 10,
                    ordering: true,
                    stateSave: false,
                    searching: true,
                    info: true,
                    autoWidth: true,
                    language: {
                        search: "",
                        searchPlaceholder: "Search assets...",
                        emptyTable: "No assets found",
                        zeroRecords: "No matching assets found",
                        info: "Showing _START_ to _END_ of _TOTAL_ assets",
                        lengthMenu: "Show _MENU_"
                    },
                    searchPanes: {
                        viewCount: true,
                        cascadePanes: true,
                        layout: "columns-3",
                        orderable: false,
                        clear: false,
                        initCollapsed: true
                    },
                    dom: dtDom, buttons: dtButtons,
                    columnDefs: [{ targets: [0, 7], searchPanes: { show: false } }],
                    columns: [
                        {
                            data: "id",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            searchPanes: { show: false },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "category",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            searchPanes: { show: true },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "name",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            searchPanes: { show: true },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "status",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            searchPanes: { show: true },
                            render: function (data) { return renderStatus(data); }
                        },
                        {
                            data: "assignedTo",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            searchPanes: { show: true },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "startDate",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            searchPanes: { show: false },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "returnDate",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            searchPanes: { show: false },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            searchPanes: { show: false },
                            className: "text-center align-middle",
                            render: function (data) { return `<button type="button" class="btn btn-sm btn-outline-primary editAssetBtn" data-id="${data.id}" title="Edit"><i class="fa-solid fa-pen-to-square"></i></button>`; }
                        }
                    ],
                    initComplete: function () {
                        const btnContainer = $(this.api().table().container());
                        const allBtns = btnContainer.find(".dt-buttons button");
                        btnContainer.find(".dt-filter-btn").append(allBtns.eq(0).detach());
                        btnContainer.find(".dt-export-btn").append(allBtns.eq(1).detach());
                        btnContainer.find(".dt-state-btn").append(allBtns.eq(2).detach());
                        btnContainer.find(".dt-load-btn").append(allBtns.eq(3).detach());
                        $(".dtsp-panesContainer").hide();
                    }
                });
            };

            const validateAssetCategory = () => {
                const val = $("#assetCategory").val();
                const errEl = $("#assetCategory").closest(".input-group").siblings(".error-msg");
                $("#assetCategory").removeClass("is-valid is-invalid");
                if (!val || val === "") {
                    errEl.text("Category is required!"); $("#assetCategory").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#assetCategory").addClass("is-valid");
                return true;
            };
            const validateAssetName = () => {
                const val = $("#assetName").val().trim();
                if (val === "") {
                    showError("assetName", "Asset name is required!");
                    return false;
                }
                clearError("assetName");
                return true;
            };
            const validateAssetStatus = () => {
                const val = $("#assetStatus").val();
                const errEl = $("#assetStatus").closest(".input-group").siblings(".error-msg");
                $("#assetStatus").removeClass("is-valid is-invalid");
                if (!val || val === "") {
                    errEl.text("Status is required!"); $("#assetStatus").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#assetStatus").addClass("is-valid");
                return true;
            };
            $("#assetCategory").on("change", validateAssetCategory);
            $("#assetName").on("input", validateAssetName);
            $("#assetStatus").on("change", validateAssetStatus);

            $("#saveAssetBtn").on("click", function () {
                const results = [validateAssetCategory(), validateAssetName(), validateAssetStatus()];
                if (!results.every(Boolean)) return;
                const asset = {
                    id: generateAssetId(),
                    category: $("#assetCategory").val(),
                    name: $("#assetName").val().trim(),
                    status: $("#assetStatus").val(),
                    assignedTo: $("#assetAssignedTo").val().trim() || "—",
                    startDate: $("#assetStartDate").val().trim() || "—",
                    returnDate: $("#assetReturnDate").val().trim() || "—"
                };
                const assets = getAssets();
                assets.push(asset);
                saveAssets(assets);
                loadAssetTable();
                $("#addAssetModal").modal("hide");
                Swal.fire({
                    icon: "success",
                    title: "Added!",
                    text: "Asset added successfully."
                });
            });
            $("#addAssetModal").on("hidden.bs.modal", function () {
                $("#assetCategory, #assetStatus").val("");
                $("#assetName, #assetAssignedTo, #assetStartDate, #assetReturnDate").val("");
                $("#assetCategory, #assetStatus, #assetName").removeClass("is-valid is-invalid");
                $(".error-msg").text("");
            });

            $("#assetTable").on("click", ".editAssetBtn", function () {
                const asset = getAssets().find(a => a.id === $(this).data("id"));
                if (!asset) return;
                $("#editAssetId").val(asset.id); $("#editAssetStatus").val(asset.status);
                $("#editAssetReturnDate").val(asset.returnDate === "—" ? "" : asset.returnDate);
                $("#editAssetModal").modal("show");
            });
            $("#updateAssetBtn").on("click", function () {
                const id = $("#editAssetId").val();
                const assets = getAssets();
                const idx = assets.findIndex(a => a.id === id);
                if (idx === -1) return;
                assets[idx].status = $("#editAssetStatus").val();
                assets[idx].returnDate = $("#editAssetReturnDate").val().trim() || "—";
                saveAssets(assets); $("#editAssetModal").modal("hide"); loadAssetTable();
                Swal.fire({
                    icon: "success",
                    title: "Updated!",
                    text: "Asset updated successfully."
                });
            });
            $("#editAssetModal").on("hidden.bs.modal", function () {
                $("#editAssetId").val(""); $("#editAssetStatus").val("A"); $("#editAssetReturnDate").val(""); $(".error-msg").text("");
            });

            showSection($("#dashboardId"), "section-dashboard", loadDashboard);
        });
    </script>
</body>
</html>