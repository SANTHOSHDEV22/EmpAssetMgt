<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EAM_Landing.aspx.cs" Inherits="EmpAssetMgt.Pages.EAM_Landing" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EAM</title>
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <!-- DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap4.min.css" />
    <!-- DataTables Button-->
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.bootstrap4.min.css" />
    <!-- DataTables SearchPanes-->
    <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.3.1/css/searchPanes.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/select/2.0.3/css/select.bootstrap4.min.css" />
    <!-- DataTables State-->
    <link rel="stylesheet" href="https://cdn.datatables.net/staterestore/1.4.3/css/stateRestore.dataTables.min.css" />
    <!-- Select2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
    <!-- datepicker -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
    <style>
        .navbar-collapse {
            position: fixed !important;
            left: -240px;
            top: 0;
            width: 240px;
            height: 100% !important;
            display: block !important;
            z-index: 1050;
            transition: left 300ms ease-in-out !important;
            overflow-y: auto;
        }
        .navbar-collapse.collapsing {
            left: -240px;
            height: 100% !important;
            transition: left 300ms ease-in-out !important;
        }
        .navbar-collapse.show {
            left: 0;
        }
        .sidebar-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.45);
            z-index: 1049;
            display: none;
        }
        .sidebar-overlay.active {
            display: block;
        }
        .dropdown-menu {
            display: none;
            background: #343a40;
            border: none;
            padding-left: 1rem;
            position: static !important;
            float: none !important;
        }
        .dropdown-menu.open {
            display: block;
        }
        .dropdown-menu .dropdown-item {
            color: #adb5bd;
            padding: 0.4rem 0.5rem;
        }
        .dropdown-menu .dropdown-item:hover {
            background: #495057;
            color: #fff;
        }
        .role-badge {
            font-size: 0.7rem;
            padding: 2px 8px;
            border-radius: 12px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        .role-badge.admin {
            background: #28a745;
            color: #fff;
        }
        .role-badge.manager {
            background: #17a2b8;
            color: #fff;
        }
        .dash-table {
            table-layout: fixed;
            width: 100%;
        }
        .dash-table th, .dash-table td {
            width: 50%;
            text-align: center;
            vertical-align: middle;
        }
        .dash-table-4 th, .dash-table-4 td {
            width: 25%;
            text-align: center;
            vertical-align: middle;
        }
        .dash-count {
            font-size: 5rem;
            font-weight: 600;
        }
        .cat-summary-wrap {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 1.5rem;
        }
        .cat-card {
            flex: 1 1 160px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            padding: 14px 18px;
            min-width: 150px;
        }
        .cat-card .cat-name {
            font-weight: 700;
            font-size: 1rem;
            margin-bottom: 6px;
        }
        .cat-card .cat-total {
            font-size: 1.6rem;
            font-weight: 700;
        }
        .cat-card .cat-sub {
            font-size: 0.78rem;
            color: #6c757d;
            margin-top: 4px;
        }
        .status-active {
            color: #28a745;
            font-weight: 600;
        }
        .status-inactive {
            color: #dc3545;
            font-weight: 600;
        }
        .asset-thumb {
            width: 36px;
            height: 36px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid #dee2e6;
            cursor: pointer;
        }
        .location-wrapper {
            display: flex;
            align-items: stretch;
        }
        .location-wrapper .location-label {
            display: flex;
            align-items: center;
            padding: 0 0.75rem;
            font-size: 1rem;
            color: #495057;
            background: #e9ecef;
            border: 1px solid #ced4da;
            border-right: none;
            border-radius: 0.25rem 0 0 0.25rem;
            white-space: nowrap;
            min-height: 34px;
        }
        #location + .select2-container--classic,
        #editLocation + .select2-container--classic {
            flex: 1 1 auto;
            width: 100% !important;
        }
        #location + .select2-container--classic .select2-selection--single,
        #editLocation + .select2-container--classic .select2-selection--single {
            height: 34px !important;
            border: 1px solid #ced4da !important;
            border-left: none !important;
            border-radius: 0 0.25rem 0.25rem 0 !important;
            display: flex !important;
            align-items: center !important;
            background-image: none;
            padding: 0 8px;
        }
        #location + .select2-container--classic .select2-selection__rendered,
        #editLocation + .select2-container--classic .select2-selection__rendered {
            padding-left: 4px;
            color: #495057;
            line-height: normal;
            flex: 1;
        }
        #location + .select2-container--classic .select2-selection__arrow,
        #editLocation + .select2-container--classic .select2-selection__arrow {
            position: relative !important;
            height: 100% !important;
            width: 28px;
            top: 0 !important;
            border-left: 1px solid #ced4da;
            background: #e9ecef;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        #location + .select2-container--classic .select2-selection__arrow b,
        #editLocation + .select2-container--classic .select2-selection__arrow b {
            position: static !important;
            margin: 0 !important;
            border-color: #555 transparent transparent transparent;
            border-style: solid;
            border-width: 5px 4px 0 4px;
        }
        .ui-datepicker {
            z-index: 9999 !important;
        }
        .dt-length select {
            margin-left: 10px !important;
        }
        .dt-button-collection {
            position: absolute !important;
            z-index: 2000 !important;
        }
        .dt-filter-btn .btn, .dt-export-btn .btn,
        .dt-state-btn .btn, .dt-load-btn .btn {
            white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav class="navbar navbar-light bg-dark d-flex align-items-center px-3">
                <a href="#" class="navbar-brand h2 text-light mb-0">EAM</a>

                <div class="ml-auto d-flex align-items-center">
                    <!-- Role toggle switch -->
                    <div class="d-flex align-items-center mr-3">
                        <span id="roleLabel" class="role-badge admin mr-2">ADMIN</span>
                        <div class="custom-control custom-switch mb-0">
                            <input type="checkbox" class="custom-control-input" id="roleToggle" />
                            <label class="custom-control-label text-light" for="roleToggle"></label>
                        </div>
                    </div>
                    <!-- Hamburger -->
                    <button type="button" class="navbar-toggler" id="sidebarToggleBtn"
                        aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
            </nav>

            <!-- Sidebar -->
            <div id="sidenav" class="navbar-collapse bg-dark pt-4">
                <div class="d-flex justify-content-end px-3 mb-2">
                    <button type="button" class="btn btn-sm btn-outline-secondary text-light" id="closeSidebarBtn">
                        <i class="fa-solid fa-xmark"></i>
                    </button>
                </div>
                <ul class="navbar-nav ml-3">
                    <!-- Dashboard -->
                    <li class="nav-item pb-3 pt-1">
                        <a href="#" id="dashboardId" class="nav-link text-light">
                            <i class="fa-solid fa-gauge-high mr-2"></i>Dashboard
                        </a>
                    </li>
                    <!-- Employees dropdown -->
                    <li class="nav-item dropdown pb-3">
                        <a href="#" class="nav-link sideNavToggle text-light">
                            <i class="fa-solid fa-user fa-sm mr-2"></i>Employees
                            <i class="fa-solid fa-chevron-down fa-xs ml-2 toggleIcon"></i>
                        </a>
                        <div class="dropdown-menu">
                            <a href="#" id="addEmployeeId" class="dropdown-item">
                                <i class="fa-solid fa-plus fa-xs mr-2"></i>Add
                            </a>
                            <a href="#" id="viewEmployeeId" class="dropdown-item">
                                <i class="fa-solid fa-eye fa-xs mr-2"></i>View
                            </a>
                        </div>
                    </li>
                    <!-- Assets dropdown -->
                    <li class="nav-item dropdown pb-3">
                        <a href="#" class="nav-link sideNavToggle text-light">
                            <i class="fa-solid fa-suitcase fa-sm mr-2"></i>Assets
                           
                            <i class="fa-solid fa-chevron-down fa-xs ml-2 toggleIcon"></i>
                        </a>
                        <div class="dropdown-menu">
                            <a href="#" id="assetAssignId" class="dropdown-item">
                                <i class="fa-solid fa-user-check fa-xs mr-2"></i>Assign
                            </a>
                            <a href="#" id="assetInventoryId" class="dropdown-item">
                                <i class="fa-solid fa-suitcase fa-xs mr-2"></i>Inventory
                            </a>
                            <a href="#" id="assetHistoryId" class="dropdown-item">
                                <i class="fa-solid fa-clock-rotate-left fa-xs mr-2"></i>History
                            </a>
                        </div>
                    </li>
                    <!-- Reports -->
                    <li class="nav-item pb-3">
                        <a href="#" class="nav-link text-light">
                            <i class="fa-solid fa-file fa-sm mr-2"></i>Reports
                        </a>
                    </li>
                    <!-- Settings -->
                    <li class="nav-item pb-3">
                        <a href="#" class="nav-link text-light">
                            <i class="fa-solid fa-gear fa-sm mr-2"></i>Settings
                        </a>
                    </li>
                </ul>
            </div>
        </header>

        <!-- Sidebar overlay backdrop -->
        <div class="sidebar-overlay" id="sidebarOverlay"></div>
        <div id="pageScreen" class="container-fluid">
            <!-- Dashnoard Section -->
            <div id="section-dashboard" class="page-section mt-4" style="display: none;">
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

            <!-- Add EMployee section -->
            <div id="section-addEmp" class="page-section mt-4" style="display: none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-user mr-2"></i>Add Employee</span>
                    <button type="button" class="btn btn-success admin-only" data-toggle="modal" data-target="#addEmpModal">
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
                                    <!-- Firstname and Lastname -->
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Firstname</span></div>
                                                <input type="text" class="form-control" id="fname" placeholder="Enter firstname" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Lastname</span></div>
                                                <input type="text" class="form-control" id="lname" placeholder="Enter lastname" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                    </div>
                                    <!-- Gender and DOB -->
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
                                                <div class="input-group-prepend"><span class="input-group-text">DOB</span></div>
                                                <input type="text" class="form-control datepicker" id="dob" placeholder="DD/MM/YYYY" autocomplete="off" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                    </div>
                                    <!-- Email and Contact -->
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Email</span></div>
                                                <input type="text" class="form-control" id="email" placeholder="Enter email address" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Contact</span></div>
                                                <input type="text" class="form-control" id="contact" placeholder="Enter 10-digit number" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                    </div>
                                    <!-- Password and Confirm Password -->
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Password</span></div>
                                                <input type="password" class="form-control" id="pass" placeholder="Enter password" />
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-secondary toggle-password" type="button"><i class="fas fa-eye"></i></button>
                                                </div>
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Confirm Password</span></div>
                                                <input type="password" class="form-control" id="cpass" placeholder="Confirm password" />
                                                <div class="input-group-append">
                                                    <button class="btn btn-outline-secondary toggle-password" type="button"><i class="fas fa-eye"></i></button>
                                                </div>
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                    </div>
                                    <!-- Department and Role -->
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
                                    <!-- Location -->
                                    <div class="row mb-2">
                                        <div class="col-md-12">
                                            <div class="location-wrapper mb-2">
                                                <label class="location-label font-weight-bold" for="location">Location :</label>
                                                <select id="location" style="width: 100%"></select>
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

            <!-- View Employee section -->
            <div id="section-viewEmp" class="page-section mt-4" style="display: none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-users mr-2"></i>View Employees</span>
                </div>
                <div class="card">
                    <div class="card-body">
                        <table id="empTable" class="table table-bordered table-striped table-hover" style="width: 100%">
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
                            <!-- Firstname and Lastname -->
                            <div class="row mb-2">
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend"><span class="input-group-text">Firstname</span></div>
                                        <input type="text" class="form-control" id="editFname" />
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend"><span class="input-group-text">Lastname</span></div>
                                        <input type="text" class="form-control" id="editLname" />
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <!-- Gender and DOB -->
                            <div class="row align-items-center mb-2">
                                <div class="col-md-6">
                                    <div class="d-flex align-items-center">
                                        <span class="mr-3 font-weight-bold text-nowrap">Gender :</span>
                                        <div class="input-group mr-3" style="max-width: 140px">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <input type="radio" name="editGender" id="editMale" value="Male" />
                                                </div>
                                            </div>
                                            <label class="form-control mb-0" for="editMale">Male</label>
                                        </div>
                                        <div class="input-group" style="max-width: 160px">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <input type="radio" name="editGender" id="editFemale" value="Female" />
                                                </div>
                                            </div>
                                            <label class="form-control mb-0" for="editFemale">Female</label>
                                        </div>
                                    </div>
                                    <small class="text-danger error-msg d-block mt-1"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend"><span class="input-group-text">DOB</span></div>
                                        <input type="text" class="form-control datepicker" id="editDob" placeholder="DD/MM/YYYY" autocomplete="off" />
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <!-- Email and Contact -->
                            <div class="row mb-2">
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend"><span class="input-group-text">Email</span></div>
                                        <input type="text" class="form-control" id="editEmail" />
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend"><span class="input-group-text">Contact</span></div>
                                        <input type="text" class="form-control" id="editContact" maxlength="10" />
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <!-- Password and Confirm -->
                            <div class="row mb-2">
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend"><span class="input-group-text">Password</span></div>
                                        <input type="password" class="form-control" id="editPassword" /><div class="input-group-append">
                                            <button type="button" class="btn btn-outline-secondary toggle-password"><i class="fas fa-eye"></i></button>
                                        </div>
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend"><span class="input-group-text">Confirm Password</span></div>
                                        <input type="password" class="form-control" id="editCpass" /><div class="input-group-append">
                                            <button type="button" class="btn btn-outline-secondary toggle-password"><i class="fas fa-eye"></i></button>
                                        </div>
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <!-- Department and Role -->
                            <div class="row mb-2">
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" for="editDept">Department</label>
                                        </div>
                                        <select class="custom-select" id="editDept">
                                            <option value="">Select Department</option>
                                        </select>
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" for="editRole">Role</label>
                                        </div>
                                        <select class="custom-select" id="editRole" disabled="disabled">
                                            <option value="">Select Role</option>
                                        </select>
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <!-- Status and Location -->
                            <div class="row mb-2">
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend"><span class="input-group-text">Status</span></div>
                                        <select class="custom-select" id="editStatus">
                                            <option value="Active">Active</option>
                                            <option value="Inactive">Inactive</option>
                                        </select>
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                                <div class="col-md-6">
                                    <div class="location-wrapper mb-2">
                                        <label class="location-label" for="editLocation">Location</label>
                                        <select id="editLocation" style="width: 100%"></select>
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                            <!-- Join and Relieve Date -->
                            <div class="row mb-2">
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend"><span class="input-group-text">Join Date</span></div>
                                        <input type="text" class="form-control" id="editJoinDate" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend"><span class="input-group-text">Relieve Date</span></div>
                                        <input type="text" class="form-control datepicker" id="editEndDate" placeholder="DD/MM/YYYY" autocomplete="off" />
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer border-0">
                            <div class="container d-flex justify-content-center">
                                <button type="button" class="btn btn-secondary mr-2" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-danger mr-2 admin-only" id="deleteEmpBtn">Delete</button>
                                <button type="button" class="btn btn-success admin-only" id="updateEmpBtn">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Asset Assign section -->
            <div id="section-assign" class="page-section mt-4" style="display: none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-user-check mr-2"></i>Asset Assign</span>
                    <button type="button" class="btn btn-success admin-only" data-toggle="modal" data-target="#assignModal">
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
                                <!-- Employee dropdown -->
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="assignEmployee"><i class="fa-solid fa-user mr-2"></i>Employee</label>
                                            </div>
                                            <select class="custom-select" id="assignEmployee">
                                                <option value="">Select Employee</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <!-- Asset Category dropdown -->
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="assignCategory"><i class="fa-solid fa-layer-group mr-2"></i>Category</label>
                                            </div>
                                            <select class="custom-select" id="assignCategory">
                                                <option value="">Select Category</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <!-- Asset Name dropdown -->
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="assignAsset"><i class="fa-solid fa-suitcase mr-2"></i>Asset</label>
                                            </div>
                                            <select class="custom-select" id="assignAsset" disabled="disabled">
                                                <option value="">Select Asset</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <!-- Dates -->
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend"><span class="input-group-text">Start Date</span></div>
                                            <input type="text" class="form-control" id="assignStartDate" readonly="readonly" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend"><span class="input-group-text">Return Date</span></div>
                                            <input type="text" class="form-control datepicker" id="assignReturnDate" placeholder="DD/MM/YYYY" autocomplete="off" />
                                        </div>
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

            <!-- Asset Inventory section -->
            <div id="section-inventory" class="page-section mt-4" style="display: none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-suitcase mr-2"></i>Asset Inventory</span>
                    <button type="button" class="btn btn-success admin-only" data-toggle="modal" data-target="#addAssetModal">
                        <i class="fa-solid fa-plus mr-2"></i>Add Asset
                   
                    </button>
                </div>
                <!-- Category summary cards -->
                <div id="catSummaryWrap" class="cat-summary-wrap"></div>
                <!-- DataTable -->
                <div class="card">
                    <div class="card-body">
                        <table id="assetTable" class="table table-bordered table-striped table-hover" style="width: 100%">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th>ID</th>
                                    <th>Category</th>
                                    <th>Asset Name</th>
                                    <th>Status</th>
                                    <th>Assigned To</th>
                                    <th>Start Date</th>
                                    <th>Return Date</th>
                                    <th>Image</th>
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
                                <!-- Category and Name -->
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="assetCategory">Category</label>
                                            </div>
                                            <select class="custom-select" id="assetCategory">
                                                <option value="">Select Category</option>
                                                <option value="Laptop">Laptop</option>
                                                <option value="Monitor">Monitor</option>
                                                <option value="Keyboard">Keyboard</option>
                                                <option value="Mouse">Mouse</option>
                                                <option value="Headset">Headset</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend"><span class="input-group-text">Asset Name</span></div>
                                            <input type="text" class="form-control" id="assetName" placeholder="Enter asset name" />
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <!-- Status and Image upload -->
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="assetStatus">Status</label>
                                            </div>
                                            <select class="custom-select" id="assetStatus">
                                                <option value="">Select Status</option>
                                                <option value="A">A — Assigned</option>
                                                <option value="NA">NA — Not Assigned</option>
                                                <option value="UM">UM — Under Maintenance</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <!-- Image file upload -->
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa-solid fa-image mr-1"></i>Image</span></div>
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="assetImage" accept="image/*" />
                                                <label class="custom-file-label" for="assetImage">Choose image</label>
                                            </div>
                                        </div>
                                        <!-- Image preview -->
                                        <img id="assetImagePreview" src="" alt="Preview" style="display: none; width: 80px; height: 80px; object-fit: cover; border-radius: 6px; border: 1px solid #dee2e6; margin-top: 6px;" />
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
                <!-- Edit Asset Modal -->
                <div class="modal fade" id="editAssetModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-centered">
                        <div class="modal-content border-0 shadow">
                            <div class="modal-header bg-dark text-white">
                                <h5 class="modal-title"><i class="fa-solid fa-pen-to-square mr-2"></i>Edit Asset</h5>
                                <button type="button" class="close text-white" data-dismiss="modal"><span>&times;</span></button>
                            </div>
                            <div class="modal-body p-4">
                                <input type="hidden" id="editAssetId" />

                                <!-- Category and Name -->
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="editAssetCategory">Category</label>
                                            </div>
                                            <select class="custom-select" id="editAssetCategory">
                                                <option value="">Select Category</option>
                                                <option value="Laptop">Laptop</option>
                                                <option value="Monitor">Monitor</option>
                                                <option value="Keyboard">Keyboard</option>
                                                <option value="Mouse">Mouse</option>
                                                <option value="Headset">Headset</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Asset Name</span>
                                            </div>
                                            <input type="text" class="form-control" id="editAssetName" placeholder="Enter asset name" />
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>

                                <!-- Status and Assigned To -->
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="editAssetStatus">Status</label>
                                            </div>
                                            <select class="custom-select" id="editAssetStatus">
                                                <option value="A">A — Assigned</option>
                                                <option value="NA">NA — Not Assigned</option>
                                                <option value="UM">UM — Under Maintenance</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="editAssetAssignedTo">Assigned To</label>
                                            </div>
                                            <select class="custom-select" id="editAssetAssignedTo">
                                                <option value="">— Not Assigned —</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>

                                <!-- Return Date only -->
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">Return Date</span>
                                            </div>
                                            <input type="text" class="form-control datepicker" id="editAssetReturnDate" placeholder="DD/MM/YYYY" autocomplete="off" />
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>

                                <!-- Multiple Image Upload -->
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fa-solid fa-images mr-1"></i>Images</span>
                                            </div>
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="editAssetImages" accept="image/*" multiple />
                                                <label class="custom-file-label" for="editAssetImages">Choose images (multiple allowed)</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="editAssetImagePreviewWrap" class="d-flex flex-wrap" style="gap: 8px; margin-top: 6px;"></div>

                            </div>
                            <div class="modal-footer border-0">
                                <div class="container d-flex justify-content-center">
                                    <button type="button" class="btn btn-secondary mr-2" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-success admin-only" id="updateAssetBtn">
                                        <i class="fa-solid fa-check mr-2"></i>Update
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="assetCarouselModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-xl">
                        <div class="modal-content border-0 shadow">
                            <div class="modal-header bg-dark text-white">
                                <h5 class="modal-title"><i class="fa-solid fa-images mr-2"></i>Asset Images</h5>
                                <button type="button" class="close text-white" data-dismiss="modal"><span>&times;</span></button>
                            </div>
                            <div class="modal-body p-3">
                                <div id="assetCarousel" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner" id="carouselInner"></div>
                                    <a class="carousel-control-prev" href="#assetCarousel" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon"></span>
                                    </a>
                                    <a class="carousel-control-next" href="#assetCarousel" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Asset History Modal -->
            <div id="section-history" class="page-section mt-4" style="display: none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-clock-rotate-left mr-2"></i>Asset History</span>
                </div>
                <div class="card">
                    <div class="card-body">
                        <table class="table table-bordered table-striped table-hover" id="historyTable">
                            <thead class="thead-dark text-center">
                                <tr>
                                    <th style="width: 80px">S.No</th>
                                    <th>Message</th>
                                </tr>
                            </thead>
                            <tbody id="historyBody" class="text-center"></tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>

    </form>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- datepicker -->
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <!-- Bootstrap 4 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- JSZip and pdfMake for DataTables export -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <!-- DataTables core and Bootstrap4 theme -->
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap4.min.js"></script>
    <!-- DataTables Buttons -->
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.colVis.min.js"></script>
    <!-- DataTables Select -->
    <script src="https://cdn.datatables.net/select/2.0.3/js/dataTables.select.min.js"></script>
    <script src="https://cdn.datatables.net/select/2.0.3/js/select.bootstrap4.min.js"></script>
    <!-- DataTables SearchPanes -->
    <script src="https://cdn.datatables.net/searchpanes/2.3.1/js/dataTables.searchPanes.min.js"></script>
    <script src="https://cdn.datatables.net/searchpanes/2.3.1/js/searchPanes.bootstrap4.min.js"></script>
    <!-- DataTables StateRestore -->
    <script src="https://cdn.datatables.net/staterestore/1.4.3/js/dataTables.stateRestore.min.js"></script>
    <!-- Select2 -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script>
        $(document).ready(function () {
            // ------------ Data Definied ----------
            // Data for depaatment and role
            const deptRoles = {
                "IT": ["Software Engineer", "QA Engineer", "DevOps Engineer", "Frontend Developer", "Backend Developer"],
                "HR": ["HR Manager", "Recruiter", "Payroll Specialist", "HR Coordinator"],
                "Finance": ["Accountant", "Financial Analyst", "Auditor", "Tax Consultant"],
                "Marketing": ["Marketing Manager", "Content Writer", "SEO Specialist", "Brand Strategist"],
                "Operations": ["Operations Manager", "Logistics Coordinator", "Supply Chain Analyst", "Warehouse Supervisor"]
            };

            // Location dropdown 
            const locationData = [
                {
                    text: "Tamil Nadu",
                    children: [
                        {
                            id: "Chennai",
                            text: "Chennai"
                        },
                        {
                            id: "Coimbatore",
                            text: "Coimbatore"
                        },
                        {
                            id: "Madurai",
                            text: "Madurai"
                        },
                        {
                            id: "Salem",
                            text: "Salem"
                        }
                    ]
                },
                {
                    text: "Karnataka",
                    children: [
                        {
                            id: "Bangalore",
                            text: "Bangalore"
                        },
                        {
                            id: "Mysore",
                            text: "Mysore"
                        },
                        {
                            id: "Mangalore",
                            text: "Mangalore"
                        }
                    ]
                },
                {
                    text: "Maharashtra",
                    children: [
                        {
                            id: "Mumbai",
                            text: "Mumbai"
                        },
                        {
                            id: "Pune",
                            text: "Pune"
                        },
                        {
                            id: "Nagpur",
                            text: "Nagpur"
                        }
                    ]
                },
                {
                    text: "Delhi",
                    children: [
                        {
                            id: "New Delhi",
                            text: "New Delhi"
                        },
                        {
                            id: "Dwarka",
                            text: "Dwarka"
                        },
                        {
                            id: "Rohini",
                            text: "Rohini"
                        }
                    ]
                },
                {
                    text: "Telangana",
                    children: [
                        {
                            id: "Hyderabad",
                            text: "Hyderabad"
                        },
                        {
                            id: "Warangal",
                            text: "Warangal"
                        },
                        {
                            id: "Nizamabad",
                            text: "Nizamabad"
                        }
                    ]
                }
            ];

            // localStorage functions
            const getEmployees = () => JSON.parse(localStorage.getItem("employees") || "[]");
            const saveEmployees = (d) => localStorage.setItem("employees", JSON.stringify(d));
            const getAssets = () => JSON.parse(localStorage.getItem("assets") || "[]");
            const saveAssets = (d) => localStorage.setItem("assets", JSON.stringify(d));
            const getHistory = () => JSON.parse(localStorage.getItem("assetHistory") || "[]");
            const saveHistory = (d) => localStorage.setItem("assetHistory", JSON.stringify(d));

            // asset data 
            const seedAssets = [
                { id: "AST001", category: "Laptop", name: "Dell Inspiron 15", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST002", category: "Laptop", name: "HP EliteBook 840", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST003", category: "Laptop", name: "Lenovo ThinkPad E14", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST004", category: "Laptop", name: "Apple MacBook Air M2", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST005", category: "Laptop", name: "Asus VivoBook 15", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST006", category: "Monitor", name: "LG 24\" Full HD", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST007", category: "Monitor", name: "Dell UltraSharp 27\"", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST008", category: "Monitor", name: "Samsung 32\" Curved", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST009", category: "Monitor", name: "Acer Nitro 24\" FHD", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST010", category: "Monitor", name: "BenQ GW2480 24\"", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST011", category: "Keyboard", name: "Logitech MK270 Wireless", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST012", category: "Keyboard", name: "HP K1000 Wired", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST013", category: "Keyboard", name: "Dell KB216 Wired", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST014", category: "Keyboard", name: "Redragon K552 Mechanical", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST015", category: "Keyboard", name: "Logitech K380 Bluetooth", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST016", category: "Mouse", name: "HP X200 Wireless", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST017", category: "Mouse", name: "Logitech M185 Wireless", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST018", category: "Mouse", name: "Dell MS116 Wired", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST019", category: "Mouse", name: "Redragon M711 Gaming", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST020", category: "Mouse", name: "Razer DeathAdder V2", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST021", category: "Headset", name: "Jabra Evolve2 30", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST022", category: "Headset", name: "Sony WH-1000XM5", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST023", category: "Headset", name: "Logitech H390 USB", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST024", category: "Headset", name: "HP DHE-8009 Gaming", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" },
                { id: "AST025", category: "Headset", name: "JBL Quantum 100", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "" }
            ];
            if (!localStorage.getItem("assets")) saveAssets(seedAssets);

            // ------------ Nav and Side bar and Role change ----------
            // Role — Admin and Manager
            let isAdmin = true;
            const applyRole = () => {
                if (isAdmin) {
                    $(".admin-only").show();
                    $("#roleLabel").text("ADMIN").removeClass("manager").addClass("admin");
                } else {
                    $(".admin-only").hide();
                    $("#roleLabel").text("MANAGER").removeClass("admin").addClass("manager");
                }
            };
            $("#roleToggle").on("change", function () {
                isAdmin = !$(this).prop("checked");
                applyRole();
            });
            applyRole();

            // side nav
            const overlay = $("#sidebarOverlay");
            $("#sidebarToggleBtn").on("click", function () {
                $("#sidenav").addClass("show");
                overlay.addClass("active");
            });
            $("#closeSidebarBtn").on("click", function () {
                $("#sidenav").removeClass("show");
                overlay.removeClass("active");
            });
            overlay.on("click", function () {
                $("#sidenav").removeClass("show");
                overlay.removeClass("active");
            });

            // nav dropdown items
            $(".sideNavToggle").on("click", function (e) {
                e.preventDefault();
                const menu = $(this).closest(".nav-item").find(".dropdown-menu");
                const isOpen = menu.hasClass("open");
                $(".dropdown-menu").removeClass("open");
                if (!isOpen) menu.addClass("open");
            });

            // display each page section
            const allNavLinks = [
                $("#dashboardId"), $("#addEmployeeId"), $("#viewEmployeeId"),
                $("#assetAssignId"), $("#assetInventoryId"), $("#assetHistoryId")
            ];
            const hideSidebar = () => {
                $("#sidenav").removeClass("show");
                overlay.removeClass("active");
            };
            const showSection = (activeLink, sectionId, onShow) => {
                allNavLinks.forEach(l => l.removeClass("text-muted").addClass("text-light"));
                activeLink.removeClass("text-light").addClass("text-muted");
                $(".page-section").hide();
                $("#" + sectionId).show();
                hideSidebar();
                if (onShow) onShow();
            };
            $("#dashboardId").on("click",
                () => showSection($("#dashboardId"), "section-dashboard", loadDashboard));
            $("#addEmployeeId").on("click",
                () => showSection($("#addEmployeeId"), "section-addEmp"));
            $("#viewEmployeeId").on("click",
                () => showSection($("#viewEmployeeId"), "section-viewEmp", loadTable));
            $("#assetAssignId").on("click",
                () => showSection($("#assetAssignId"), "section-assign"));
            $("#assetInventoryId").on("click",
                () => showSection($("#assetInventoryId"), "section-inventory", loadAssetTable));
            $("#assetHistoryId").on("click",
                () => showSection($("#assetHistoryId"), "section-history", loadHistory));
            showSection($("#dashboardId"), "section-dashboard", loadDashboard);

            // ------------ Datapicker for all input fields with date ----------
            // datepicker
            const initDatepickers = () => {
                $(".datepicker").not(".hasDatepicker").datepicker({
                    dateFormat: "dd/mm/yy",
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "1950:+0"
                });
            };
            $(document).on("shown.bs.modal", function () {
                initDatepickers();
            });
            initDatepickers();

            // ------------ Error messagage for employee sections input fields ----------
            //validation error show/hide function
            const showError = (fieldId, msg) => {
                $("#" + fieldId).closest(".input-group").siblings(".error-msg").text(msg);
                $("#" + fieldId).removeClass("is-valid").addClass("is-invalid");
            };
            const clearError = (fieldId) => {
                $("#" + fieldId).closest(".input-group").siblings(".error-msg").text("");
                $("#" + fieldId).removeClass("is-invalid").addClass("is-valid");
            };

            // ------------ Dashboard section ----------
            //dashboard page
            function loadDashboard() {
                const employees = getEmployees();
                const assets = getAssets();
                $("#totalEmp").text(employees.length);
                $("#totalAssets").text(assets.length);
                $("#activeEmp").text(employees.filter(e => e.status === "Active").length);
                $("#inactiveEmp").text(employees.filter(e => e.status === "Inactive").length);
                $("#assignedAssets").text(assets.filter(a => a.status === "A").length);
                $("#unassignedAssets").text(assets.filter(a => a.status === "NA").length);
            }

            // ------------ addEmployee section ----------
            //validation on input
            const fnamePattern = /^[A-Za-z]+(['][A-Za-z]+)*'?$/;
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const passPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@!$%&])[A-Za-z\d@!$%&]{8,}$/;
            const validateFname = () => {
                const v = $("#fname").val();
                $("#fname").removeClass("is-valid is-invalid");
                if (!v.trim()) {
                    showError("fname", "Firstname is required!");
                    return false;
                }
                if (/\s/.test(v)) {
                    showError("fname", "Spaces not allowed!");
                    return false;
                }
                if (!fnamePattern.test(v)) {
                    showError("fname", "Only letters and apostrophe allowed!");
                    return false;
                }
                clearError("fname");
                return true;
            };
            const validateLname = () => {
                const v = $("#lname").val();
                $("#lname").removeClass("is-valid is-invalid");
                if (!v.trim()) {
                    showError("lname", "Lastname is required!");
                    return false;
                }
                if (/\s/.test(v)) {
                    showError("lname", "Spaces not allowed!");
                    return false;
                }
                if (!fnamePattern.test(v)) {
                    showError("lname", "Only letters and apostrophe allowed!");
                    return false;
                }
                clearError("lname");
                return true;
            };
            const validateGender = () => {
                const errEl = $("input[name='gender']").closest(".col-md-6").find(".error-msg");
                if (!$("input[name='gender']:checked").val()) {
                    errEl.text("Please select a gender!");
                    return false;
                }
                errEl.text("");
                return true;
            };
            const validateDob = () => {
                const v = $("#dob").val().trim(); $("#dob").removeClass("is-valid is-invalid");
                if (!v) {
                    showError("dob", "Date of Birth is required!");
                    return false;
                }
                clearError("dob");
                return true;
            };
            const validateEmail = () => {
                const v = $("#email").val(); $("#email").removeClass("is-valid is-invalid");
                if (!v.trim()) {
                    showError("email", "Email is required!");
                    return false;
                }
                if (!emailPattern.test(v)) {
                    showError("email", "Enter a valid email!");
                    return false;
                }
                clearError("email");
                return true;
            };
            const validateContact = () => {
                const v = $("#contact").val(); $("#contact").removeClass("is-valid is-invalid");
                if (!v.trim()) {
                    showError("contact", "Contact is required!");
                    return false;
                }
                if (!/^[0-9]{10}$/.test(v)) {
                    showError("contact", "Enter a valid 10-digit number!");
                    return false;
                }
                clearError("contact"); return true;
            };
            const validatePass = () => {
                const v = $("#pass").val(); $("#pass").removeClass("is-valid is-invalid");
                if (!v.trim()) {
                    showError("pass", "Password is required!");
                    return false;
                }
                if (v.length < 8) {
                    showError("pass", "Minimum 8 characters!");
                    return false;
                }
                if (!passPattern.test(v)) {
                    showError("pass", "Need uppercase, lowercase, number and @!$%&");
                    return false;
                }
                clearError("pass");
                if ($("#cpass").val().trim()) validateCpass();
                return true;
            };
            const validateCpass = () => {
                const inp = $("#cpass");
                const cval = inp.val();
                const errEl = inp.closest(".input-group").siblings(".error-msg");
                inp.removeClass("is-valid is-invalid");
                errEl.removeClass("text-success").addClass("text-danger");
                if (!cval.trim()) {
                    showError("cpass", "Please confirm password!");
                    return false;
                }
                if (cval !== $("#pass").val()) {
                    showError("cpass", "Passwords do not match!");
                    return false;
                }
                inp.addClass("is-valid");
                errEl.removeClass("text-danger").addClass("text-success").text("Passwords matched!");
                return true;
            };
            const validateDept = () => {
                const v = $("#dept").val();
                const errEl = $("#dept").closest(".input-group").siblings(".error-msg");
                $("#dept").removeClass("is-valid is-invalid");
                if (!v) {
                    errEl.text("Department is required!"); $("#dept").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#dept").addClass("is-valid");
                return true;
            };
            const validateRole = () => {
                if ($("#deptrole").prop("disabled")) {
                    $("#deptrole").closest(".input-group").siblings(".error-msg").text("Select a department first!");
                    return false;
                }
                const v = $("#deptrole").val(); const errEl = $("#deptrole").closest(".input-group").siblings(".error-msg");
                $("#deptrole").removeClass("is-valid is-invalid");
                if (!v) {
                    errEl.text("Role is required!"); $("#deptrole").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#deptrole").addClass("is-valid");
                return true;
            };
            const validateLocation = () => {
                const v = $("#location").val();
                const errEl = $("#location").closest(".col-md-12").find(".error-msg");
                if (!v) {
                    errEl.text("Location is required!");
                    return false;
                }
                errEl.text(""); return true;
            };
            $("#fname").on("input", validateFname);
            $("#lname").on("input", validateLname);
            $("input[name='gender']").on("change", validateGender);
            $("#dob").on("change", validateDob);
            $("#email").on("input", validateEmail);
            $("#contact").on("keydown", function (e) {
                const ok = ["Backspace", "Delete", "ArrowLeft", "ArrowRight", "Tab"];
                if (!ok.includes(e.key) && !/^[0-9]$/.test(e.key)) e.preventDefault();
            }).on("input", validateContact);
            $("#pass").on("input", validatePass);
            $("#cpass").on("input", validateCpass);
            $("#location").on("change", validateLocation);

            // ------------ Department and role Multilevel dropdown ----------
            // department dropdown
            Object.keys(deptRoles).forEach(d => $("#dept").append(`<option value="${d}">${d}</option>`));
            // role dropdown
            $("#dept").on("change", function () {
                const sel = $(this).val();
                $("#deptrole").html('<option value="">Select Role</option>').prop("disabled", true).removeClass("is-valid is-invalid");
                if (!sel) {
                    validateDept();
                    return;
                }
                deptRoles[sel].forEach(r => $("#deptrole").append(`<option value="${r}">${r}</option>`));
                $("#deptrole").prop("disabled", false);
                validateDept();
            });
            $("#deptrole").on("change", validateRole);

            // ------------ select2 ----------
            // Select2 for location dropdown
            $("#location").select2({
                theme: "classic",
                placeholder: "Select Location",
                allowClear: true,
                data: locationData,
                dropdownParent: $("#addEmpModal")
            });

            // toggle for password
            $(document).on("click", ".toggle-password", function () {
                const inp = $(this).closest(".input-group").find("input");
                const ico = $(this).find("i");
                if (inp.attr("type") === "password") {
                    inp.attr("type", "text");
                    ico.removeClass("fa-eye").addClass("fa-eye-slash");
                }
                else {
                    inp.attr("type", "password");
                    ico.removeClass("fa-eye-slash").addClass("fa-eye");
                }
            });

            // ------------ Generate ID asset ----------
            // id function for emp
            const generateEmpId = () => {
                const emps = getEmployees();
                const last = emps.length > 0 ? emps[emps.length - 1].id : "EMP000";
                return "EMP" + String(parseInt(last.replace("EMP", "")) + 1).padStart(3, "0");
            };

            // addUser submit
            $("#addEmpBtn").on("click", function () {
                const ok = [
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
                if (!ok.every(Boolean)) return;
                const emp = {
                    id: generateEmpId(),
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
                const emps = getEmployees();
                emps.push(emp);
                saveEmployees(emps);
                Swal.fire({
                    title: "Success",
                    icon: "success",
                    text: `${emp.fullname} added successfully!`
                });
                $("#addEmpModal").modal("hide");
            });

            // reset input fields on modal close
            $("#addEmpModal").on("hidden.bs.modal", function () {
                $("#fname,#lname,#dob,#email,#contact,#pass,#cpass").val("").removeClass("is-valid is-invalid");
                $("input[name='gender']").prop("checked", false);
                $("#dept").val("").removeClass("is-valid is-invalid");
                $("#deptrole").html('<option value="">Select Role</option>').prop("disabled", true).removeClass("is-valid is-invalid");
                $("#location").val(null).trigger("change");
                $(".error-msg").text("").removeClass("text-success").addClass("text-danger");
            });

            //view employee section
            let table = null;

            // validate edit error show/hide function
            const showEditError = (id, msg) => {
                $("#" + id).closest(".input-group").siblings(".error-msg").text(msg);
                $("#" + id).removeClass("is-valid").addClass("is-invalid");
            };
            const clearEditError = (id) => {
                $("#" + id).closest(".input-group").siblings(".error-msg").text("");
                $("#" + id).removeClass("is-invalid").addClass("is-valid");
            };

            //validate edit form
            const validateEditFname = () => {
                const v = $("#editFname").val();
                if (!v.trim()) {
                    showEditError("editFname", "Firstname required!");
                    return false;
                }
                if (/\s/.test(v)) {
                    showEditError("editFname", "No spaces!");
                    return false;
                }
                if (!fnamePattern.test(v)) {
                    showEditError("editFname", "Only letters and apostrophe allowed!");
                    return false;
                }
                clearEditError("editFname");
                return true;
            };

            const validateEditLname = () => {
                const v = $("#editLname").val();
                if (!v.trim()) {
                    showEditError("editLname", "Lastname required!");
                    return false;
                }
                if (/\s/.test(v)) {
                    showEditError("editLname", "No spaces!");
                    return false;
                }
                if (!fnamePattern.test(v)) {
                    showEditError("editLname", "Only letters and apostrophe allowed!");
                    return false;
                }
                clearEditError("editLname");
                return true;
            };
            const validateEditGender = () => {
                const errEl = $("input[name='editGender']").closest(".col-md-6").find(".error-msg");
                if (!$("input[name='editGender']:checked").val()) {
                    errEl.text("Select gender!");
                    return false;
                }
                errEl.text("");
                return true;
            };
            const validateEditDob = () => {
                const v = $("#editDob").val().trim();
                if (!v) {
                    showEditError("editDob", "DOB required!");
                    return false;
                }
                clearEditError("editDob");
                return true;
            };
            const validateEditEmail = () => {
                const v = $("#editEmail").val();
                if (!v.trim()) {
                    showEditError("editEmail", "Email required!");
                    return false;
                }
                if (!emailPattern.test(v)) {
                    showEditError("editEmail", "Invalid email!");
                    return false;
                }
                clearEditError("editEmail");
                return true;
            };
            const validateEditContact = () => {
                const v = $("#editContact").val();
                if (!v.trim()) {
                    showEditError("editContact", "Contact required!");
                    return false;
                }
                if (!/^[0-9]{10}$/.test(v)) {
                    showEditError("editContact", "Enter 10 digits!");
                    return false;
                }
                clearEditError("editContact");
                return true;
            };
            const validateEditPass = () => {
                const v = $("#editPassword").val();
                if (!v.trim()) {
                    showEditError("editPassword", "Password required!");
                    return false;
                }
                if (!passPattern.test(v)) {
                    showEditError("editPassword", "Check password rules!");
                    return false;
                }
                clearEditError("editPassword");
                if ($("#editCpass").val().trim()) validateEditCpass();
                return true;
            };
            const validateEditCpass = () => {
                const inp = $("#editCpass");
                const errEl = inp.closest(".input-group").siblings(".error-msg");
                inp.removeClass("is-valid is-invalid");
                errEl.removeClass("text-success").addClass("text-danger");
                if (!inp.val().trim()) {
                    showEditError("editCpass", "Confirm password!");
                    return false;
                }
                if (inp.val() !== $("#editPassword").val()) {
                    showEditError("editCpass", "Passwords don't match!");
                    return false;
                }
                inp.addClass("is-valid");
                errEl.removeClass("text-danger").addClass("text-success").text("Passwords matched!");
                return true;
            };
            const validateEditDept = () => {
                const v = $("#editDept").val();
                const errEl = $("#editDept").closest(".input-group").siblings(".error-msg");
                $("#editDept").removeClass("is-valid is-invalid");
                if (!v) {
                    errEl.text("Department required!"); $("#editDept").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#editDept").addClass("is-valid");
                return true;
            };
            const validateEditRole = () => {
                if ($("#editRole").prop("disabled")) {
                    $("#editRole").closest(".input-group").siblings(".error-msg").text("Select department first!");
                    return false;
                }
                const v = $("#editRole").val();
                const errEl = $("#editRole").closest(".input-group").siblings(".error-msg");
                $("#editRole").removeClass("is-valid is-invalid");
                if (!v) {
                    errEl.text("Role required!"); $("#editRole").addClass("is-invalid");
                    return false;
                }
                errEl.text(""); $("#editRole").addClass("is-valid");
                return true;
            };
            const validateEditLoc = () => {
                const v = $("#editLocation").val();
                const errEl = $("#editLocation").closest(".col-md-6").find(".error-msg");
                if (!v) {
                    errEl.text("Location required!");
                    return false;
                }
                errEl.text("");
                return true;
            };
            $("#editFname").on("input", validateEditFname);
            $("#editLname").on("input", validateEditLname);
            $("input[name='editGender']").on("change", validateEditGender);
            $("#editDob").on("change", validateEditDob);
            $("#editEmail").on("input", validateEditEmail);
            $("#editContact").on("keydown", function (e) {
                const ok = ["Backspace", "Delete", "ArrowLeft", "ArrowRight", "Tab"];
                if (!ok.includes(e.key) && !/^[0-9]$/.test(e.key)) e.preventDefault();
            }).on("input", validateEditContact);
            $("#editPassword").on("input", validateEditPass);
            $("#editCpass").on("input", validateEditCpass);
            $("#editLocation").on("change", validateEditLoc);

            // Select2 for edit location dropdown
            Object.keys(deptRoles).forEach(d => $("#editDept").append(`<option value="${d}">${d}</option>`));
            $("#editDept").on("change", function () {
                validateEditDept();
                const sel = $(this).val();
                $("#editRole").html('<option value="">Select Role</option>').prop("disabled", true);
                if (!sel) return;
                deptRoles[sel].forEach(r => $("#editRole").append(`<option value="${r}">${r}</option>`));
                $("#editRole").prop("disabled", false);
            });
            $("#editRole").on("change", validateEditRole);
            $("#editLocation").select2({
                theme: "classic",
                placeholder: "Select Location",
                allowClear: true,
                data: locationData,
                dropdownParent: $("#editEmpModal")
            });

            // fill edit form with data
            const populateEditModal = (emp, mode) => {
                $("#editEmpId").val(emp.id); $("#editMode").val(mode);
                const isChild = mode === "child";
                const isParent = mode === "parent";
                $("#editFname").val(emp.firstname || "").prop("disabled", isChild);
                $("#editLname").val(emp.lastname || "").prop("disabled", isChild);
                $("input[name='editGender']").prop("disabled", isChild);
                if ((emp.gender || "").toLowerCase() === "male") $("#editMale").prop("checked", true);
                else if ((emp.gender || "").toLowerCase() === "female") $("#editFemale").prop("checked", true);
                else $("input[name='editGender']").prop("checked", false);
                $("#editDob").val(emp.dob || "").prop("disabled", isChild);
                $("#editEmail").val(emp.email || "").prop("disabled", isChild);
                $("#editContact").val(emp.contact || "").prop("disabled", isChild);
                $("#editPassword").val(emp.password || "").prop("disabled", isChild);
                $("#editCpass").val(emp.password || "").prop("disabled", isChild);
                $(".toggle-password").prop("disabled", isChild);
                $("#editStatus").val(emp.status || "Active").prop("disabled", isChild);
                $("#editDept").val(emp.department || "").prop("disabled", isParent);
                if (emp.department && deptRoles[emp.department]) {
                    $("#editRole").html('<option value="">Select Role</option>');
                    deptRoles[emp.department].forEach(r => $("#editRole").append(`<option value="${r}">${r}</option>`));
                    $("#editRole").val(emp.role || "").prop("disabled", isParent);
                } else {
                    $("#editRole").html('<option value="">Select Role</option>').prop("disabled", true);
                }
                const loc = Array.isArray(emp.location) ? emp.location[0] || "" : (emp.location || "");
                $("#editLocation").val(loc).trigger("change").prop("disabled", isParent);
                $("#editJoinDate").val(emp.joindate || "");
                $("#editEndDate").val(emp.enddate || "").prop("disabled", isParent);
                if (isParent) {
                    $("#editDept,#editRole").addClass("opacity-50");
                    $("#editLocation + .select2-container").css("opacity", "0.5");
                    $("#editJoinDate,#editEndDate").prop("disabled", true);
                } else {
                    $("#editDept,#editRole").removeClass("opacity-50");
                    $("#editLocation + .select2-container").css("opacity", "1");
                    $("#editFname,#editLname,#editDob,#editEmail,#editContact,#editPassword,#editCpass").closest(".input-group").css("opacity", "0.6");
                    $("input[name='editGender']").closest(".row").css("opacity", "0.6");
                    $("#editEndDate").prop("disabled", false);
                }
            };

            // reset input fields on modal close
            $("#editEmpModal").on("hidden.bs.modal", function () {
                $("#editFname,#editLname,#editDob,#editEmail,#editContact,#editPassword,#editCpass,#editJoinDate,#editEndDate").val("").prop("disabled", false);
                $("input[name='editGender']").prop("checked", false).prop("disabled", false);
                $("#editDept").val("").prop("disabled", false);
                $("#editRole").html('<option value="">Select Role</option>').prop("disabled", true);
                $("#editLocation").val(null).trigger("change").prop("disabled", false);
                $(".error-msg").text("");
                $("#editFname,#editLname,#editDob,#editEmail,#editContact,#editPassword,#editCpass").closest(".input-group").css("opacity", "1");
                $("input[name='editGender']").closest(".row").css("opacity", "1");
                $("#editDept,#editRole").removeClass("opacity-50");
                $("#editLocation + .select2-container").css("opacity", "1");
                $("#editPassword,#editCpass").attr("type", "password");
                $(".toggle-password i").removeClass("fa-eye-slash").addClass("fa-eye");
                $("#editStatus").val("Active").prop("disabled", false);
            });

            // format for child row
            const childFormat = (d) => {
                const loc = Array.isArray(d.location) ? d.location[0] || "—" : (d.location || "—");
                return `<table class="table table-sm table-bordered table-striped child-table">
                    <thead class="thead-dark text-center">
                        <tr>
                            <th rowspan="2" class="text-center align-middle">Location</th>
                            <th colspan="2" class="text-center align-middle">Position</th>
                            <th rowspan="2" class="text-center align-middle">Join Date</th>
                            <th rowspan="2" class="text-center align-middle">Relieve Date</th>
                            <th rowspan="2" class="text-center align-middle">Action</th>
                        </tr>
                        <tr>
                            <th class="text-center align-middle">Department</th>
                            <th class="text-center align-middle">Role</th>
                        </tr>
                    </thead>
                    <tbody><tr class="text-center">
                        <td>${loc}</td><td>${d.department || "—"}</td><td>${d.role || "—"}</td>
                        <td>${d.joindate || "—"}</td><td>${d.enddate || "—"}</td>
                        <td><button type="button" class="btn btn-sm btn-outline-primary childEditBtn" data-id="${d.id}"><i class="fa-solid fa-pen-to-square"></i></button></td>
                    </tr></tbody>
                </table>`;
            };

            // table re draw
            const rebuildTableHeader = () => {
                $("#empTable thead").empty().append(`
                    <tr class="text-center">
                        <th style="width:40px"></th>
                        <th rowspan="2">Full Name</th><th rowspan="2">Gender</th><th rowspan="2">DOB</th>
                        <th rowspan="2">Email</th><th rowspan="2">Contact</th>
                        <th rowspan="2">Status</th><th rowspan="2">Action</th><th rowspan="2">Profile</th>
                    </tr>`);
                $("#empTable thead").addClass("thead-dark");
            };

            // DT top control allignment
            const dtDom =
                '<"row"<"col-12"<"dt-filter-btn">>>' +
                '<"row"<"col-md-12 mb-2"P>>' +
                '<"row align-items-center mb-2"<"col-md-2 mt-n3"l><"col-md-1"<"dt-state-btn">><"col-md-1"<"dt-load-btn">><"col-md-8 d-flex justify-content-end"<"dt-export-btn">f>>' +
                '<"d-none"B>t<"d-flex justify-content-between align-items-center pt-2"ip>';

            //DT button 
            const dtButtons = [
                {
                    text: '<i class="fa-solid fa-filter mr-1"></i> Filters',
                    className: "btn btn-sm mb-2",
                    action: function () {
                        $(".dtsp-panesContainer").slideToggle(200);
                    }
                },
                {
                    extend: "collection",
                    text: '<i class="fa-solid fa-bars" style="color: rgb(255, 255, 255);"></i> Export',
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

            // Load employee DT
            function loadTable() {
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
                        zeroRecords: "No matching records",
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
                    columnDefs: [
                        {
                            targets: [0, 7, 8],
                            searchPanes: { show: false }
                        }
                    ],
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
                            defaultContent: "—",
                            orderable: false,
                            searchPanes: { show: false },
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "status",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            searchPanes: { show: true },
                            render: function (d) {
                                const cls = d === "Active" ? "status-active" : "status-inactive";
                                const ico = d === "Active" ? '<i class="fa-solid fa-circle-check mr-1"></i>'
                                    : '<i class="fa-solid fa-circle-xmark mr-1"></i>';
                                return `<span class="${cls}">${ico}${d || "—"}</span>`;
                            }
                        },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            searchPanes: { show: false },
                            className: "text-center align-middle",
                            render: function (d) {
                                return `<button type="button" class="btn btn-sm btn-outline-primary parentEditBtn" data-id="${d.id}">
                                <i class="fa-solid fa-pen-to-square"></i></button>`;
                            }
                        },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            searchPanes: { show: false },
                            className: "text-center align-middle",
                            render: function (d) {
                                return `<button type="button" class="btn btn-sm btn-outline-info profileBtn" data-id="${d.id}">
                                <i class="fa-solid fa-user"></i></button>`;
                            }
                        }
                    ],
                    initComplete: function () {
                        rebuildTableHeader();
                        const c = $(this.api().table().container());
                        const b = c.find(".dt-buttons button");
                        c.find(".dt-filter-btn").append(b.eq(0).detach());
                        c.find(".dt-export-btn").append(b.eq(1).detach());
                        c.find(".dt-state-btn").append(b.eq(2).detach());
                        c.find(".dt-load-btn").append(b.eq(3).detach());
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
            }

            //prent row edit
            $("#empTable").on("click", ".parentEditBtn", function () {
                const emp = getEmployees().find(e => e.id === $(this).data("id"));
                if (!emp) return;
                populateEditModal(emp, "parent"); $("#editEmpModal").modal("show");
            });

            // child row edit
            $(document).on("click", ".childEditBtn", function () {
                const emp = getEmployees().find(e => e.id === $(this).data("id"));
                if (!emp) return;
                populateEditModal(emp, "child"); $("#editEmpModal").modal("show");
            });

            // Update employee
            $("#updateEmpBtn").on("click", function () {
                const id = $("#editEmpId").val();
                const mode = $("#editMode").val();
                const emps = getEmployees();
                const idx = emps.findIndex(e => e.id === id);
                if (idx === -1) return;
                if (mode === "parent") {
                    const ok = [
                        validateEditFname(),
                        validateEditLname(),
                        validateEditGender(),
                        validateEditDob(),
                        validateEditEmail(),
                        validateEditContact(),
                        validateEditPass(),
                        validateEditCpass()
                    ];
                    if (!ok.every(Boolean)) return;
                    emps[idx].firstname = $("#editFname").val().trim();
                    emps[idx].lastname = $("#editLname").val().trim();
                    emps[idx].fullname = `${emps[idx].firstname} ${emps[idx].lastname}`;
                    emps[idx].gender = $("input[name='editGender']:checked").val();
                    emps[idx].dob = $("#editDob").val().trim();
                    emps[idx].email = $("#editEmail").val().trim();
                    emps[idx].contact = $("#editContact").val().trim();
                    emps[idx].password = $("#editPassword").val().trim();
                    emps[idx].status = $("#editStatus").val();
                } else {
                    const ok = [
                        validateEditDept(),
                        validateEditRole(),
                        validateEditLoc()];
                    if (!ok.every(Boolean)) return;
                    emps[idx].department = $("#editDept").val();
                    emps[idx].role = $("#editRole").val();
                    emps[idx].location = $("#editLocation").val() || "";
                    emps[idx].enddate = $("#editEndDate").val().trim();
                    emps[idx].status = $("#editStatus").val();
                }
                saveEmployees(emps);
                $("#editEmpModal").modal("hide"); loadTable();
                Swal.fire({
                    icon: "success",
                    title: "Updated!",
                    text: `${emps[idx].fullname}'s updated successfully.`
                });
            });

            // Delete employee
            $("#deleteEmpBtn").on("click", function () {
                const id = $("#editEmpId").val();
                const emps = getEmployees();
                const emp = emps.find(e => e.id === id);
                if (!emp) return;
                Swal.fire({
                    title: "Delete Employee?",
                    text: `Delete ${emp.fullname}?`,
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#dc3545",
                    confirmButtonText: "Delete"
                })
                    .then(function (r) {
                        if (r.isConfirmed) {
                            saveEmployees(emps.filter(e => e.id !== id));
                            $("#editEmpModal").modal("hide"); loadTable();
                            Swal.fire({
                                icon: "success",
                                title: "Deleted!",
                                text: `${emp.fullname} removed.`
                            });
                        }
                    });
            });

            // Asset assign Section
            //load employee and asset details
            $("#assignModal").on("show.bs.modal", function () {
                const emps = getEmployees();
                const assets = getAssets();

                $("#assignEmployee").html('<option value="">Select Employee</option>');
                emps.filter(e => e.status === "Active").forEach(function (emp) {
                    $("#assignEmployee").append(`<option value="${emp.id}">${emp.fullname} — ${emp.department} (${emp.id})</option>`);
                });

                const cats = [...new Set(assets.filter(a => a.status === "NA").map(a => a.category))];
                $("#assignCategory").html('<option value="">Select Category</option>');
                cats.forEach(c => $("#assignCategory").append(`<option value="${c}">${c}</option>`));
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
                if (!filtered.length) {
                    $("#assignCategory").closest(".input-group").siblings(".error-msg").text("No available assets in this category!");
                    return;
                }
                filtered.forEach(a => $("#assignAsset").append(`<option value="${a.id}">${a.name} (${a.id})</option>`));
                $("#assignAsset").prop("disabled", false);
            });

            // validate assign asset
            const validateAssignEmp = () => {
                const v = $("#assignEmployee").val();
                const err = $("#assignEmployee").closest(".input-group").siblings(".error-msg");
                $("#assignEmployee").removeClass("is-valid is-invalid");
                if (!v) {
                    err.text("Select an employee!");
                    $("#assignEmployee").addClass("is-invalid");
                    return false;
                }
                err.text("");
                $("#assignEmployee").addClass("is-valid");
                return true;
            };
            const validateAssignCat = () => {
                const v = $("#assignCategory").val();
                const err = $("#assignCategory").closest(".input-group").siblings(".error-msg"); $("#assignCategory").removeClass("is-valid is-invalid");
                if (!v) {
                    err.text("Select a category!"); $("#assignCategory").addClass("is-invalid");
                    return false;
                }
                err.text(""); $("#assignCategory").addClass("is-valid");
                return true;
            };
            const validateAssignAst = () => {
                if ($("#assignAsset").prop("disabled")) {
                    $("#assignAsset").closest(".input-group").siblings(".error-msg").text("Select category first!");
                    return false;
                }
                const v = $("#assignAsset").val();
                const err = $("#assignAsset").closest(".input-group").siblings(".error-msg");
                $("#assignAsset").removeClass("is-valid is-invalid");
                if (!v) {
                    err.text("Select an asset!"); $("#assignAsset").addClass("is-invalid");
                    return false;
                }
                err.text(""); $("#assignAsset").addClass("is-valid");
                return true;
            };
            $("#assignEmployee").on("change", validateAssignEmp);
            $("#assignCategory").on("change", validateAssignCat);
            $("#assignAsset").on("change", validateAssignAst);

            //assign btn
            $("#confirmAssignBtn").on("click", function () {
                const ok = [
                    validateAssignEmp(),
                    validateAssignCat(),
                    validateAssignAst()
                ];
                if (!ok.every(Boolean)) return;
                const empId = $("#assignEmployee").val();
                const assetId = $("#assignAsset").val();
                const emp = getEmployees().find(e => e.id === empId);
                const assets = getAssets();
                const idx = assets.findIndex(a => a.id === assetId);
                if (idx === -1 || !emp) return;
                assets[idx].status = "A";
                assets[idx].assignedTo = emp.fullname;
                assets[idx].startDate = $("#assignStartDate").val().trim();
                assets[idx].returnDate = $("#assignReturnDate").val().trim() || "—";
                saveAssets(assets);
                const hist = getHistory();
                const today = new Date().toLocaleDateString("en-GB");
                hist.push({
                    msg: `${assets[idx].name} assigned to ${emp.fullname} on ${today}`
                });
                saveHistory(hist);

                $("#assignModal").modal("hide");
                Swal.fire({
                    icon: "success",
                    title: "Assigned!",
                    html: `<b>${assets[idx].name}</b> assigned to <b>${emp.fullname}</b> successfully.`
                });
            });

            // Reset assign form on close
            $("#assignModal").on("hidden.bs.modal", function () {
                $("#assignEmployee,#assignCategory").val("");
                $("#assignAsset").html('<option value="">Select Asset</option>').prop("disabled", true);
                $("#assignReturnDate").val("");
                $("#assignStartDate").val(new Date().toLocaleDateString("en-GB"));
                $("#assignEmployee,#assignCategory,#assignAsset").removeClass("is-valid is-invalid");
                $(".error-msg").text("");
            });

            // asset inventory section
            let assetTable = null;
            const renderStatus = (s) => {
                if (s === "A") return `<span class="status-active"><i class="fa-solid fa-circle-check mr-1"></i>A</span>`;
                if (s === "NA") return `<span class="status-inactive"><i class="fa-solid fa-circle-xmark mr-1"></i>NA</span>`;
                if (s === "UM") return `<span class="text-warning font-weight-bold"><i class="fa-solid fa-triangle-exclamation mr-1"></i>UM</span>`;
                return s || "—";
            };

            //asset id generation
            const generateAssetId = () => {
                const assets = getAssets();
                const last = assets.length > 0 ? assets[assets.length - 1].id : "AST000";
                return "AST" + String(parseInt(last.replace("AST", "")) + 1).padStart(3, "0");
            };

            // asset details
            const buildCatSummary = () => {
                const assets = getAssets();
                const cats = [...new Set(assets.map(a => a.category))];
                let html = "";
                cats.forEach(function (cat) {
                    const catAssets = assets.filter(a => a.category === cat);
                    const total = catAssets.length;
                    const assigned = catAssets.filter(a => a.status === "A").length;
                    const notAssigned = catAssets.filter(a => a.status === "NA").length;
                    const underMaint = catAssets.filter(a => a.status === "UM").length;
                    html += `<div class="cat-card">
                        <div class="cat-name">${cat}</div>
                        <div class="cat-total">${total}</div>
                        <div class="cat-sub">
                            <span class="text-success mr-2"><i class="fa-solid fa-circle-check mr-1"></i>${assigned} Assigned</span>
                            <span class="text-danger mr-2"><i class="fa-solid fa-circle-xmark mr-1"></i>${notAssigned} Not Assigned</span>
                            <span class="text-warning"><i class="fa-solid fa-triangle-exclamation mr-1"></i>${underMaint} UM</span>
                        </div>
                    </div>`;
                });
                $("#catSummaryWrap").html(html);
            };

            // asset DT
            function loadAssetTable() {
                buildCatSummary();
                const assets = getAssets();
                if (assetTable && $.fn.DataTable.isDataTable("#assetTable")) {
                    assetTable.clear().rows.add(assets).draw();
                    buildCatSummary();
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
                        zeroRecords: "No matching assets",
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
                    dom: dtDom,
                    buttons: dtButtons,
                    columnDefs: [
                        {
                            targets: [0, 7, 8],
                            searchPanes: { show: false }
                        }
                    ],
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
                            render: function (d) {
                                return renderStatus(d);
                            }
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
                            data: "image",
                            orderable: false,
                            searchable: false,
                            searchPanes: { show: false },
                            className: "text-center align-middle",
                            render: function (d, type, row) {

                                return `<button type="button" class="btn btn-sm btn-outline-secondary viewImgBtn" data-id="${row.id}">
                                            <i class="fa-solid fa-image"></i>
                                        </button>`;
                            }
                        },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            searchPanes: { show: false },
                            className: "text-center align-middle",
                            render: function (d) {
                                return `<button type="button" class="btn btn-sm btn-outline-primary editAssetBtn" data-id="${d.id}">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </button>`;
                            }
                        }
                    ],
                    initComplete: function () {
                        rebuildTableHeader();
                        const c = $(this.api().table().container());
                        const b = c.find(".dt-buttons button");
                        c.find(".dt-filter-btn").append(b.eq(0).detach());
                        c.find(".dt-export-btn").append(b.eq(1).detach());
                        c.find(".dt-state-btn").append(b.eq(2).detach());
                        c.find(".dt-load-btn").append(b.eq(3).detach());
                        $(".dtsp-panesContainer").hide();
                    }
                });
            }

            //image carousel for asset
            $("#assetTable").on("click", ".viewImgBtn", function () {
                const id = $(this).data("id");
                const asset = getAssets().find(a => a.id === id);
                if (!asset) return;

                const imgs = Array.isArray(asset.images)
                    ? asset.images.filter(s => s && s !== "")
                    : (asset.image ? [asset.image] : []);

                let slides = "";

                if (imgs.length > 0) {
                    imgs.forEach(function (src, i) {
                        slides += `
                        <div class="carousel-item ${i === 0 ? "active" : ""}">
                            <img src="${src}"
                                 class="d-block w-100"
                                 alt="${asset.name} image ${i + 1}"
                                 style="max-height:400px; object-fit:contain;" />
                            <div class="carousel-caption d-none d-md-block" style="background:rgba(0,0,0,0.4); border-radius:4px;">
                                <small>${i + 1} / ${imgs.length}</small>
                            </div>
                        </div>`;
                    });
                }
                else {
                    slides = `
                        <div class="carousel-item active text-center py-5">
                            <i class="fa-solid fa-image fa-5x text-muted"></i>
                            <p class="mt-3 text-muted">No image available for ${asset.name}</p>
                        </div>`;
                }

                $("#carouselInner").html(slides);
                $("#assetCarouselModal").modal("show");
            });

            //validate asset details
            const validateAssetCat = () => {
                const v = $("#assetCategory").val();
                const err = $("#assetCategory").closest(".input-group").siblings(".error-msg");
                $("#assetCategory").removeClass("is-valid is-invalid");
                if (!v) {
                    err.text("Category required!"); $("#assetCategory").addClass("is-invalid");
                    return false;
                }
                err.text(""); $("#assetCategory").addClass("is-valid");
                return true;
            };
            const validateAssetName = () => {
                const v = $("#assetName").val().trim();
                if (!v) {
                    showError("assetName", "Asset name required!");
                    return false;
                }
                clearError("assetName");
                return true;
            };
            const validateAssetStat = () => {
                const v = $("#assetStatus").val();
                const err = $("#assetStatus").closest(".input-group").siblings(".error-msg");
                $("#assetStatus").removeClass("is-valid is-invalid");
                if (!v) {
                    err.text("Status required!");
                    $("#assetStatus").addClass("is-invalid");
                    return false;
                }
                err.text(""); $("#assetStatus").addClass("is-valid");
                return true;
            };
            const validateEditAssetCat = () => {
                const v = $("#editAssetCategory").val();
                const err = $("#editAssetCategory").closest(".input-group").siblings(".error-msg");
                $("#editAssetCategory").removeClass("is-valid is-invalid");
                if (!v) {
                    err.text("Category required!");
                    $("#editAssetCategory").addClass("is-invalid");
                    return false;
                }
                err.text("");
                $("#editAssetCategory").addClass("is-valid");
                return true;
            };

            const validateEditAssetName = () => {
                const v = $("#editAssetName").val().trim();
                if (!v) {
                    showError("editAssetName", "Asset name required!");
                    return false;
                }
                clearError("editAssetName");
                return true;
            };
            $("#assetCategory").on("change", validateAssetCat);
            $("#assetName").on("input", validateAssetName);
            $("#assetStatus").on("change", validateAssetStat);
            $("#editAssetCategory").on("change", validateEditAssetCat);
            $("#editAssetName").on("input", validateEditAssetName);

            //image carousel apply
            $("#assetImage").on("change", function () {
                const file = this.files[0];
                const label = $(this).siblings(".custom-file-label");
                if (!file) { label.text("Choose image"); $("#assetImagePreview").hide().attr("src", ""); return; }
                label.text(file.name);
                const reader = new FileReader();
                reader.onload = (e) => { $("#assetImagePreview").attr("src", e.target.result).show(); };
                reader.readAsDataURL(file);
            });

            // add asset
            $("#saveAssetBtn").on("click", function () {
                const ok = [
                    validateAssetCat(),
                    validateAssetName(),
                    validateAssetStat()
                ];
                if (!ok.every(Boolean)) return;
                const file = $("#assetImage")[0].files[0];
                const doSave = (img) => {
                    const asset = {
                        id: generateAssetId(),
                        category: $("#assetCategory").val(),
                        name: $("#assetName").val().trim(),
                        status: $("#assetStatus").val(),
                        assignedTo: "—",
                        startDate: "—",
                        returnDate: "—",
                        image: img
                    };
                    const assets = getAssets();
                    assets.push(asset);
                    saveAssets(assets);
                    loadAssetTable();
                    $("#addAssetModal").modal("hide");
                    Swal.fire({
                        icon: "success",
                        title: "Added!",
                        text: `${asset.name} added successfully.`
                    });
                };
                if (file) {
                    const r = new FileReader();
                    r.onload = (e) => doSave(e.target.result);
                    r.readAsDataURL(file);
                }
                else doSave("");
            });

            // Reset add asset form on close
            $("#addAssetModal").on("hidden.bs.modal", function () {
                $("#assetCategory,#assetStatus").val("");
                $("#assetName").val("");
                $("#assetCategory,#assetStatus,#assetName").removeClass("is-valid is-invalid");
                $("#assetImage").val(""); $(".custom-file-label").text("Choose image");
                $("#assetImagePreview").hide().attr("src", "");
                $(".error-msg").text("");
            });

            // edit asset button
            $("#assetTable").on("click", ".editAssetBtn", function () {
                const asset = getAssets().find(a => a.id === $(this).data("id"));
                if (!asset) return;

                $("#editAssetId").val(asset.id);
                $("#editAssetCategory").val(asset.category);
                $("#editAssetName").val(asset.name);
                $("#editAssetStatus").val(asset.status);
                $("#editAssetReturnDate").val(asset.returnDate === "—" ? "" : asset.returnDate);
                const empDropdown = $("#editAssetAssignedTo");
                empDropdown.html('<option value="">— Not Assigned —</option>');

                getEmployees().forEach(function (emp) {
                    empDropdown.append(
                        `<option value="${emp.fullname}">${emp.fullname} — ${emp.department} (${emp.id})</option>`
                    );
                });
                const currentAssigned = asset.assignedTo === "—" ? "" : asset.assignedTo;
                empDropdown.val(currentAssigned);
                const editPreviewWrap = $("#editAssetImagePreviewWrap");
                editPreviewWrap.empty();

                const imgs = Array.isArray(asset.images) ? asset.images : (asset.image ? [asset.image] : []);

                imgs.forEach(function (src, i) {
                    if (!src) return;
                    editPreviewWrap.append(`
                    <div class="position-relative" style="display:inline-block;">
                        <img src="${src}"
                             style="width:70px; height:70px; object-fit:cover;
                                    border-radius:4px; border:1px solid #dee2e6;" />
                        <button type="button"
                                class="btn btn-danger btn-sm position-absolute removeEditImgBtn"
                                data-index="${i}"
                                style="top:-6px; right:-6px; padding:1px 5px; font-size:0.65rem; line-height:1;">
                            &times;
                        </button>
                    </div>`);
                });

                $("#editAssetModal").modal("show");
            });

            $("#editAssetImages").on("change", function () {
                const files = Array.from(this.files);
                const label = $(this).siblings(".custom-file-label");
                label.text(files.length > 0 ? `${files.length} image(s) selected` : "Choose images");

                if (!files.length) return;
                const wrap = $("#editAssetImagePreviewWrap");
                files.forEach(function (file) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        const totalImgs = wrap.find("img").length;
                        wrap.append(`
                            <div class="position-relative" style="display:inline-block;">
                                <img src="${e.target.result}"
                                     style="width:70px; height:70px; object-fit:cover;
                                            border-radius:4px; border:1px solid #dee2e6;" />
                                <button type="button"
                                        class="btn btn-danger btn-sm position-absolute removeEditImgBtn"
                                        data-index="${totalImgs}"
                                        style="top:-6px; right:-6px; padding:1px 5px; font-size:0.65rem; line-height:1;">
                                    &times;
                                </button>
                            </div>
                        `);
                    };
                    reader.readAsDataURL(file);
                });
            });

            $(document).on("click", ".removeEditImgBtn", function () {
                $(this).closest("div").remove();
                $("#editAssetImagePreviewWrap > div").each(function (i) {
                    $(this).find(".removeEditImgBtn").attr("data-index", i);
                });
            });

            $("#updateAssetBtn").on("click", function () {
                const ok = [
                    validateEditAssetCat(),
                    validateEditAssetName()
                ];
                if (!ok.every(Boolean)) return;

                const id = $("#editAssetId").val();
                const assets = getAssets();
                const idx = assets.findIndex(a => a.id === id);
                if (idx === -1) return;
                const finalImages = [];
                $("#editAssetImagePreviewWrap img").each(function () {
                    finalImages.push($(this).attr("src"));
                });
                assets[idx].category = $("#editAssetCategory").val();
                assets[idx].name = $("#editAssetName").val().trim();
                assets[idx].status = $("#editAssetStatus").val();
                assets[idx].assignedTo = $("#editAssetAssignedTo").val().trim() || "—";
                assets[idx].returnDate = $("#editAssetReturnDate").val().trim() || "—";
                assets[idx].images = finalImages;
                assets[idx].image = finalImages.length > 0 ? finalImages[0] : "";
                saveAssets(assets);
                $("#editAssetModal").modal("hide");
                loadAssetTable();

                Swal.fire({
                    icon: "success",
                    title: "Updated!",
                    text: `${assets[idx].name} updated successfully.`
                });
            });

            $("#editAssetModal").on("hidden.bs.modal", function () {
                $("#editAssetId").val("");
                $("#editAssetCategory").val("");
                $("#editAssetName").val("");
                $("#editAssetStatus").val("A");

                $("#editAssetAssignedTo").html('<option value="">— Not Assigned —</option>');

                $("#editAssetReturnDate").val("");
                $("#editAssetImages").val("");
                $(".custom-file-label").text("Choose images");
                $("#editAssetImagePreviewWrap").empty();
                $("#editAssetCategory,#editAssetName").removeClass("is-valid is-invalid");
                $(".error-msg").text("");
            });

            // assest history section
            // load asset history
            function loadHistory() {
                const hist = getHistory();
                $("#historyBody").empty();
                if (!hist.length) {
                    $("#historyBody").html('<tr><td colspan="2" class="text-muted text-center">No history yet. Assign an asset to see records here.</td></tr>');
                    return;
                }
                hist.forEach(function (item, i) {
                    $("#historyBody").append(`<tr><td>${i + 1}</td><td>${item.msg}</td></tr>`);
                });
            }
        });
    </script>
</body>
</html>
