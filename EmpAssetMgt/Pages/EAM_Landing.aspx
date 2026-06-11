<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EAM_Landing.aspx.cs" Inherits="EmpAssetMgt.Pages.EAM_Landing" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EAM</title>
    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <!-- DataTables Bootstrap 4 -->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.8/css/dataTables.bootstrap4.min.css" />
    <!-- Buttons Bootstrap 4 -->
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.0.2/css/buttons.bootstrap4.min.css" />
    <!-- SearchPanes Bootstrap 4 -->
    <link rel="stylesheet" href="https://cdn.datatables.net/searchpanes/2.3.1/css/searchPanes.bootstrap4.min.css" />
    <!-- SearchBuilder Bootstrap 4 -->
    <link rel="stylesheet" href="https://cdn.datatables.net/searchbuilder/1.7.1/css/searchBuilder.bootstrap4.min.css" />
    <!-- Select Bootstrap 4 -->
    <link rel="stylesheet" href="https://cdn.datatables.net/select/2.0.3/css/select.bootstrap4.min.css" />

    <!-- StateRestore -->
    <link rel="stylesheet" href="https://cdn.datatables.net/staterestore/1.4.3/css/stateRestore.dataTables.min.css" />
    <!-- Select2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
    <!-- jQuery UI -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
    <style>
        .navbar-toggler {
            border-color: rgba(255, 255, 255, 0.3);
            padding: 2px 6px;
            font-size: 0.85rem;
            line-height: 1;
        }

        .navbar-toggler-icon {
            width: 18px;
            height: 18px;
        }

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

        #roleToggle, #roleToggle + .custom-control-label {
            cursor: pointer;
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
            flex: 1 1 200px;
            min-width: 180px;
            background: #fff;
            border: 1px solid #ced4da;
            border-radius: 8px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.06);
            padding: 12px 14px;
            box-sizing: border-box;
        }

            .cat-card .cat-name {
                font-size: 0.95rem;
                font-weight: 700;
                color: #212529;
                margin: 0 0 8px 0;
                padding-bottom: 6px;
                border-bottom: 2px solid #343a40;
                letter-spacing: 0.2px;
            }

        .cat-stat-header {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            margin-bottom: 2px;
        }

        .cat-stat-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            margin-bottom: 4px;
        }

        .cat-sh-cell {
            font-size: 0.68rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.4px;
            color: #6c757d;
            text-align: center;
        }

        .cat-sv-cell {
            font-size: 1.75rem;
            font-weight: 700;
            color: #212529;
            text-align: center;
            line-height: 1.1;
        }

        .cat-card .cat-divider {
            border: none;
            border-top: 1px solid #dee2e6;
            margin: 6px 0 8px;
        }

        .cat-card .cat-detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 2px 0;
        }

        .cat-card .cat-detail-label {
            font-size: 0.76rem;
            color: #495057;
            white-space: nowrap;
            padding-right: 10px;
        }

        .cat-card .cat-detail-val {
            font-size: 0.82rem;
            font-weight: 700;
            color: #212529;
            min-width: 20px;
            text-align: right;
        }

        .status-active {
            color: #28a745;
            font-weight: 600;
        }

        .status-inactive {
            color: #dc3545;
            font-weight: 600;
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

        #location + .select2-container--classic, #editLocation + .select2-container--classic {
            flex: 1 1 auto;
            width: 100% !important;
        }

            #location + .select2-container--classic .select2-selection--multiple,
            #editLocation + .select2-container--classic .select2-selection--multiple {
                min-height: 34px !important;
                border: 1px solid #ced4da !important;
                border-left: none !important;
                border-radius: 0 0.25rem 0.25rem 0 !important;
                background-image: none;
                padding: 2px 4px;
            }

            #location + .select2-container--classic .select2-selection__choice,
            #editLocation + .select2-container--classic .select2-selection__choice {
                background-color: #343a40;
                color: #fff;
                border: none;
                border-radius: 3px;
                padding: 1px 6px;
                font-size: 0.8rem;
            }

            #location + .select2-container--classic .select2-selection__choice__remove,
            #editLocation + .select2-container--classic .select2-selection__choice__remove {
                color: #adb5bd;
                margin-right: 4px;
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

        .dt-filter-btn .btn, .dt-export-btn .btn, .dt-state-btn .btn, .dt-load-btn .btn {
            white-space: nowrap;
        }

        .inline-date-wrap {
            display: flex;
            align-items: center;
            border: 1px solid #ced4da;
            border-radius: 4px;
            background: #fff;
            padding: 2px 6px;
            min-width: 130px;
        }

            .inline-date-wrap input {
                border: none;
                outline: none;
                background: transparent;
                font-size: 0.85rem;
                width: 100%;
                cursor: pointer;
            }

            .inline-date-wrap .inline-cal-icon {
                color: #6c757d;
                font-size: 0.85rem;
                cursor: pointer;
                margin-left: 4px;
            }

            .inline-date-wrap input:read-only {
                cursor: default;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav class="navbar navbar-light bg-dark d-flex align-items-center px-3">
                <button type="button" class="navbar-toggler mr-3" id="sidebarToggleBtn" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a href="#" class="navbar-brand h2 text-light mb-0">EAM</a>
                <div class="ml-auto d-flex align-items-center">
                    <div class="d-flex align-items-center">
                        <span id="roleLabel" class="role-badge admin mr-2">ADMIN</span>
                        <div class="custom-control custom-switch mb-0">
                            <input type="checkbox" class="custom-control-input" id="roleToggle" />
                            <label class="custom-control-label text-light" for="roleToggle"></label>
                        </div>
                    </div>
                </div>
            </nav>
            <div id="sidenav" class="navbar-collapse bg-dark pt-4">
                <div class="d-flex justify-content-between align-items-center px-3 mb-2">
                    <span class="h5 text-light mb-0 font-weight-bold">EAM</span>
                    <button type="button" class="btn btn-sm btn-outline-secondary text-light" id="closeSidebarBtn"><i class="fa-solid fa-xmark"></i></button>
                </div>
                <ul class="navbar-nav ml-3">
                    <li class="nav-item pb-3 pt-1"><a href="#" id="dashboardId" class="nav-link text-light"><i class="fa-solid fa-gauge-high mr-2"></i>Dashboard</a></li>
                    <li class="nav-item dropdown pb-3">
                        <a href="#" class="nav-link sideNavToggle text-light"><i class="fa-solid fa-user fa-sm mr-2"></i>Employees<i class="fa-solid fa-chevron-down fa-xs ml-2 toggleIcon"></i></a>
                        <div class="dropdown-menu">
                            <a href="#" id="addEmployeeId" class="dropdown-item"><i class="fa-solid fa-plus fa-xs mr-2"></i>Add</a>
                            <a href="#" id="viewEmployeeId" class="dropdown-item"><i class="fa-solid fa-eye fa-xs mr-2"></i>View</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown pb-3">
                        <a href="#" class="nav-link sideNavToggle text-light"><i class="fa-solid fa-suitcase fa-sm mr-2"></i>Assets<i class="fa-solid fa-chevron-down fa-xs ml-2 toggleIcon"></i></a>
                        <div class="dropdown-menu">
                            <a href="#" id="assetAssignId" class="dropdown-item"><i class="fa-solid fa-user-check fa-xs mr-2"></i>Assign</a>
                            <a href="#" id="assetInventoryId" class="dropdown-item"><i class="fa-solid fa-suitcase fa-xs mr-2"></i>Inventory</a>
                            <a href="#" id="assetHistoryId" class="dropdown-item"><i class="fa-solid fa-clock-rotate-left fa-xs mr-2"></i>History</a>
                        </div>
                    </li>
                    <li class="nav-item pb-3"><a href="#" class="nav-link text-light"><i class="fa-solid fa-file fa-sm mr-2"></i>Reports</a></li>
                    <li class="nav-item pb-3"><a href="#" class="nav-link text-light"><i class="fa-solid fa-gear fa-sm mr-2"></i>Settings</a></li>
                </ul>
            </div>
        </header>
        <div class="sidebar-overlay" id="sidebarOverlay"></div>
        <div id="pageScreen" class="container-fluid">

            <!-- Dashboard -->
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

            <!-- Add Employee -->
            <div id="section-addEmp" class="page-section mt-4" style="display: none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-user mr-2"></i>Add Employee</span>
                    <button type="button" class="btn btn-success admin-only" data-toggle="modal" data-target="#addEmpModal"><i class="fa-solid fa-plus mr-2"></i>Add</button>
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
                                                <input type="text" class="form-control" id="fname" placeholder="First NAME" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Lastname</span></div>
                                                <input type="text" class="form-control" id="lname" placeholder="Last NAME" />
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
                                                <div class="input-group-prepend"><span class="input-group-text">DOB</span></div>
                                                <input type="text" class="form-control datepicker" id="dob" placeholder="DD/MM/YYYY" autocomplete="off" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                    </div>
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
                                                <input type="text" class="form-control" id="contact" placeholder="Enter 10-digit number" minlength="10" maxlength="10" />
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Password</span></div>
                                                <input type="password" class="form-control" id="pass" placeholder="Enter password" /><div class="input-group-append">
                                                    <button class="btn btn-outline-secondary toggle-password" type="button"><i class="fas fa-eye"></i></button>
                                                </div>
                                            </div>
                                            <small class="text-danger error-msg d-block"></small>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group mb-2">
                                                <div class="input-group-prepend"><span class="input-group-text">Confirm Password</span></div>
                                                <input type="password" class="form-control" id="cpass" placeholder="Confirm password" /><div class="input-group-append">
                                                    <button class="btn btn-outline-secondary toggle-password" type="button"><i class="fas fa-eye"></i></button>
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
                                                <label class="location-label font-weight-bold" for="location">Location :</label><select id="location" style="width: 100%" multiple="multiple"></select>
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

            <!-- View Employee -->
            <div id="section-viewEmp" class="page-section mt-4" style="display: none;">
                <div class="shadow p-3 mb-4 bg-white rounded"><span><i class="fa-solid fa-users mr-2"></i>View Employees</span></div>
                <div class="card">
                    <div class="card-body">
                        <table id="empTable" class="table table-bordered table-striped table-hover" style="width: 100%">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th class="no-export"></th>
                                    <th>Full Name</th>
                                    <th>Gender</th>
                                    <th>DOB</th>
                                    <th>Email</th>
                                    <th>Contact</th>
                                    <th>Status</th>
                                    <th class="emp-action-col no-export">Action</th>
                                    <th class="no-export">Profile</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Edit Employee Modal -->
            <div class="modal fade" id="editEmpModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-xl modal-dialog-centered">
                    <div class="modal-content border-0 shadow">
                        <div class="modal-header bg-dark text-white">
                            <h5 class="modal-title"><i class="fa-solid fa-pen-to-square mr-2"></i>Edit Employee</h5>
                            <button type="button" class="close text-white" data-dismiss="modal"><span>&times;</span></button>
                        </div>
                        <div class="modal-body p-4">
                            <input type="hidden" id="editEmpId" /><input type="hidden" id="editMode" />
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
                                        <input type="text" class="form-control" id="editContact" minlength="10" maxlength="10" />
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
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
                                        <label class="location-label" for="editLocation">Location</label><select id="editLocation" style="width: 100%" multiple="multiple"></select>
                                    </div>
                                    <small class="text-danger error-msg d-block"></small>
                                </div>
                            </div>
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

            <!-- Asset Assign -->
            <div id="section-assign" class="page-section mt-4" style="display: none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-user-check mr-2"></i>Asset Assign</span>
                    <button type="button" class="btn btn-success admin-only" data-toggle="modal" data-target="#assignModal"><i class="fa-solid fa-plus mr-2"></i>Assign</button>
                </div>
                <!-- Assigned Assets DataTable -->
                <div class="card mb-4">
                    <div class="card-header bg-dark text-white"><i class="fa-solid fa-list mr-2"></i>Currently Assigned Assets</div>
                    <div class="card-body">
                        <table id="assignedTable" class="table table-bordered table-striped table-hover" style="width: 100%">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th>Asset Name</th>
                                    <th>Employee Name</th>
                                    <th>Start Date</th>
                                    <th>Return Date</th>
                                    <th>Return</th>
                                </tr>
                            </thead>
                            <tbody id="assignedBody"></tbody>
                        </table>
                    </div>
                </div>
                <!-- Assign Modal -->
                <div class="modal fade" id="assignModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content border-0 shadow">
                            <div class="modal-header bg-dark text-white">
                                <h5 class="modal-title"><i class="fa-solid fa-user-check mr-2"></i>Assign Asset to Employee</h5>
                                <button type="button" class="close text-white" data-dismiss="modal"><span>&times;</span></button>
                            </div>
                            <div class="modal-body p-4">
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend" id="assetId">
                                                <label class="input-group-text" for="assignEmployee"><i class="fa-solid fa-user mr-2"></i>Employee</label>
                                            </div>
                                            <select class="custom-select" id="assignEmployee">
                                                <option value="">Select Employee</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
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

            <!-- Asset Inventory -->
            <div id="section-inventory" class="page-section mt-4" style="display: none;">
                <div class="shadow p-3 mb-4 bg-white rounded d-flex align-items-center justify-content-between">
                    <span><i class="fa-solid fa-suitcase mr-2"></i>Asset Inventory</span>
                    <button type="button" class="btn btn-success admin-only" data-toggle="modal" data-target="#addAssetModal"><i class="fa-solid fa-plus mr-2"></i>Add Asset</button>
                </div>
                <div id="catSummaryWrap" class="cat-summary-wrap"></div>
                <div class="card">
                    <div class="card-body">
                        <table id="assetTable" class="table table-bordered table-striped table-hover" style="width: 100%">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th>ID</th>
                                    <th>Category</th>
                                    <th>Asset Name</th>
                                    <th>Status</th>
                                    <th>Image</th>
                                    <th class="asset-action-col">Action</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>

                <!-- Add Asset Modal -->
                <div class="modal fade" id="addAssetModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content border-0 shadow">
                            <div class="modal-header bg-dark text-white">
                                <h5 class="modal-title"><i class="fa-solid fa-plus mr-2"></i>Add Asset</h5>
                                <button type="button" class="close text-white" data-dismiss="modal"><span>&times;</span></button>
                            </div>
                            <div class="modal-body p-4">
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
                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text" for="assetStatus">Status</label>
                                            </div>
                                            <select class="custom-select" id="assetStatus" disabled="disabled">
                                                <option value="NA" selected="selected">NA — Not Assigned</option>
                                            </select>
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa-solid fa-image mr-1"></i>Image</span></div>
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="assetImage" accept="image/*" /><label class="custom-file-label" for="assetImage">Choose image</label>
                                            </div>
                                        </div>
                                        <img id="assetImagePreview" src="" alt="Preview" style="display: none; width: 80px; height: 80px; object-fit: cover; border-radius: 6px; border: 1px solid #dee2e6; margin-top: 6px;" /><small class="text-danger error-msg d-block"></small>
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
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content border-0 shadow">
                            <div class="modal-header bg-dark text-white">
                                <h5 class="modal-title"><i class="fa-solid fa-pen-to-square mr-2"></i>Edit Asset</h5>
                                <button type="button" class="close text-white" data-dismiss="modal"><span>&times;</span></button>
                            </div>
                            <div class="modal-body p-4">
                                <input type="hidden" id="editAssetId" />
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
                                            <div class="input-group-prepend"><span class="input-group-text">Asset Name</span></div>
                                            <input type="text" class="form-control" id="editAssetName" placeholder="Enter asset name" />
                                        </div>
                                        <small class="text-danger error-msg d-block"></small>
                                    </div>
                                </div>
                                <%--<div class="row mb-2">
                                    <div class="col-md-12">
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
                                </div>--%>
                                <div class="row mb-2" id="empChoose">
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md-12">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa-solid fa-images mr-1"></i>Images</span></div>
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" id="editAssetImages" accept="image/*" multiple="multiple" /><label class="custom-file-label" for="editAssetImages">Choose images (multiple allowed)</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="editAssetImagePreviewWrap" class="d-flex flex-wrap" style="gap: 8px; margin-top: 6px;"></div>
                            </div>
                            <div class="modal-footer border-0">
                                <div class="container d-flex justify-content-center">
                                    <button type="button" class="btn btn-secondary mr-2" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-danger mr-2 admin-only" id="deleteAssetBtn"><i class="fa-solid fa-trash mr-2"></i>Delete</button>
                                    <button type="button" class="btn btn-success admin-only" id="updateAssetBtn"><i class="fa-solid fa-check mr-2"></i>Update</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Image Carousel Modal -->
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
                                    <a class="carousel-control-prev" href="#assetCarousel" role="button" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
                                    <a class="carousel-control-next" href="#assetCarousel" role="button" data-slide="next"><span class="carousel-control-next-icon"></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Asset History -->
            <div id="section-history" class="page-section mt-4" style="display: none;">
                <div class="shadow p-3 mb-4 bg-white rounded"><span><i class="fa-solid fa-clock-rotate-left mr-2"></i>Asset History</span></div>
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
    <!-- Scripts -->
    <!-- jQuery Core -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- jQuery UI -->
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <!-- Bootstrap 4-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- JSZip -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <!-- pdfmake Core -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <!-- pdfmake Fonts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <!-- DataTables Core -->
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.min.js"></script>
    <!-- DataTables Bootstrap 4 -->
    <script src="https://cdn.datatables.net/2.0.8/js/dataTables.bootstrap4.min.js"></script>
    <!-- DataTables Buttons Core -->
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.min.js"></script>
    <!-- Buttons Bootstrap 4 -->
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.bootstrap4.min.js"></script>
    <!-- Buttons HTML5 Export -->
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
    <!-- Buttons Print -->
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>
    <!-- Buttons Column Visibility -->
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.colVis.min.js"></script>
    <!-- DataTables Select -->
    <script src="https://cdn.datatables.net/select/2.0.3/js/dataTables.select.min.js"></script>
    <!-- Select Bootstrap 4 -->
    <script src="https://cdn.datatables.net/select/2.0.3/js/select.bootstrap4.min.js"></script>
    <!-- DataTables SearchPanes -->
    <script src="https://cdn.datatables.net/searchpanes/2.3.1/js/dataTables.searchPanes.min.js"></script>
    <!-- SearchPanes Bootstrap 4 -->
    <script src="https://cdn.datatables.net/searchpanes/2.3.1/js/searchPanes.bootstrap4.min.js"></script>
    <!-- DataTables StateRestore -->
    <script src="https://cdn.datatables.net/staterestore/1.4.3/js/dataTables.stateRestore.min.js"></script>
    <!-- DataTables SearchBuilder -->
    <script src="https://cdn.datatables.net/searchbuilder/1.7.1/js/dataTables.searchBuilder.min.js"></script>
    <!-- SearchBuilder Bootstrap 4 -->
    <script src="https://cdn.datatables.net/searchbuilder/1.7.1/js/searchBuilder.bootstrap4.min.js"></script>
    <!-- Select2 -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script>
        $(document).ready(function () {

            // role apply admin and manager
            function applyRole() {
                if (isAdmin) {
                    $(".admin-only").show();
                    $(".toggle-password").show();
                    $("#roleLabel").text("ADMIN").removeClass("manager").addClass("admin");
                    if (empTable && $.fn.DataTable.isDataTable("#empTable")) empTable.column(".emp-action-col").visible(true);
                    if (assetTable && $.fn.DataTable.isDataTable("#assetTable")) assetTable.column(".asset-action-col").visible(true);
                    if (assignedTable && $.fn.DataTable.isDataTable("#assignedTable")) assignedTable.column(4).visible(true);
                } else {
                    $(".admin-only").hide();
                    $(".toggle-password").hide();
                    $("#roleLabel").text("MANAGER").removeClass("admin").addClass("manager");
                    if (empTable && $.fn.DataTable.isDataTable("#empTable")) empTable.column(".emp-action-col").visible(false);
                    if (assetTable && $.fn.DataTable.isDataTable("#assetTable")) assetTable.column(".asset-action-col").visible(false);
                    if (assignedTable && $.fn.DataTable.isDataTable("#assignedTable")) assignedTable.column(4).visible(false);
                }
            }

            // system date format

            function getLocaleDateFormat() {
                const locale = navigator.language || navigator.userLanguage || 'en-GB';
                const testDate = new Date(2025, 0, 31);

                const formatted = new Intl.DateTimeFormat(locale, {
                    year: 'numeric', month: '2-digit', day: '2-digit'
                }).format(testDate);

                const separatorMatch = formatted.match(/[^0-9]/);
                const sep = separatorMatch ? separatorMatch[0] : '/';

                const parts = formatted.split(sep);
                let format = '';
                parts.forEach(function (part) {
                    const num = parseInt(part, 10);
                    if (num === 31) format += 'dd' + sep;
                    else if (num === 1) format += 'mm' + sep;
                    else if (num === 2025) format += 'yy';
                });

                return format || ('dd' + sep + 'mm' + sep + 'yy');
            }

            // state
            let empTable = null;
            let assetTable = null;
            let assignedTable = null;
            let isAdmin = true;
            let addEmpModalReady = false;

            applyRole();
            $("#roleToggle").on("change", function () {
                isAdmin = !$(this).prop("checked");
                applyRole();
            });

            // dropdown data
            const deptRoles = {
                "IT": ["Software Engineer", "QA Engineer", "DevOps Engineer", "Frontend Developer", "Backend Developer"],
                "HR": ["HR Manager", "Recruiter", "Payroll Specialist", "HR Coordinator"],
                "Finance": ["Accountant", "Financial Analyst", "Auditor", "Tax Consultant"],
                "Marketing": ["Marketing Manager", "Content Writer", "SEO Specialist", "Brand Strategist"],
                "Operations": ["Operations Manager", "Logistics Coordinator", "Supply Chain Analyst", "Warehouse Supervisor"]
            };
            const locationData = [
                {
                    text: "Tamil Nadu",
                    children: [{ id: "Chennai", text: "Chennai" }, { id: "Coimbatore", text: "Coimbatore" }, { id: "Madurai", text: "Madurai" }, { id: "Salem", text: "Salem" }]
                },
                {
                    text: "Karnataka",
                    children: [{ id: "Bangalore", text: "Bangalore" }, { id: "Mysore", text: "Mysore" }, { id: "Mangalore", text: "Mangalore" }]
                },
                {
                    text: "Maharashtra",
                    children: [{ id: "Mumbai", text: "Mumbai" }, { id: "Pune", text: "Pune" }, { id: "Nagpur", text: "Nagpur" }]
                },
                {
                    text: "Delhi",
                    children: [{ id: "New Delhi", text: "New Delhi" }, { id: "Dwarka", text: "Dwarka" }, { id: "Rohini", text: "Rohini" }]
                },
                {
                    text: "Telangana",
                    children: [{ id: "Hyderabad", text: "Hyderabad" }, { id: "Warangal", text: "Warangal" }, { id: "Nizamabad", text: "Nizamabad" }]
                }
            ];
            const seedAssets = [
                { id: "AST001", category: "Laptop", name: "Dell Inspiron 15", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST002", category: "Laptop", name: "HP EliteBook 840", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST003", category: "Laptop", name: "Lenovo ThinkPad E14", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST004", category: "Laptop", name: "Apple MacBook Air M2", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST005", category: "Laptop", name: "Asus VivoBook 15", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST006", category: "Monitor", name: "LG 24\" Full HD", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST007", category: "Monitor", name: "Dell UltraSharp 27\"", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST008", category: "Monitor", name: "Samsung 32\" Curved", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST009", category: "Monitor", name: "Acer Nitro 24\" FHD", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST010", category: "Monitor", name: "BenQ GW2480 24\"", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST011", category: "Keyboard", name: "Logitech MK270 Wireless", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST012", category: "Keyboard", name: "HP K1000 Wired", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST013", category: "Keyboard", name: "Dell KB216 Wired", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST014", category: "Keyboard", name: "Redragon K552 Mechanical", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST015", category: "Keyboard", name: "Logitech K380 Bluetooth", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST016", category: "Mouse", name: "HP X200 Wireless", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST017", category: "Mouse", name: "Logitech M185 Wireless", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST018", category: "Mouse", name: "Dell MS116 Wired", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST019", category: "Mouse", name: "Redragon M711 Gaming", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST020", category: "Mouse", name: "Razer DeathAdder V2", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST021", category: "Headset", name: "Jabra Evolve2 30", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST022", category: "Headset", name: "Sony WH-1000XM5", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST023", category: "Headset", name: "Logitech H390 USB", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST024", category: "Headset", name: "HP DHE-8009 Gaming", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] },
                { id: "AST025", category: "Headset", name: "JBL Quantum 100", status: "NA", assignedTo: "—", startDate: "—", returnDate: "—", image: "", images: [] }
            ];

            // local storage function 
            const getEmployees = () => JSON.parse(localStorage.getItem("employees") || "[]");
            const saveEmployees = d => localStorage.setItem("employees", JSON.stringify(d));
            const getAssets = () => JSON.parse(localStorage.getItem("assets") || "[]");
            const saveAssets = d => localStorage.setItem("assets", JSON.stringify(d));
            const getHistory = () => JSON.parse(localStorage.getItem("assetHistory") || "[]");
            const saveHistory = d => localStorage.setItem("assetHistory", JSON.stringify(d));

            if (!localStorage.getItem("assets")) saveAssets(seedAssets);
            // generate ID function
            const generateEmpId = () => {
                const maxNum = getEmployees().reduce((max, e) => {
                    const n = parseInt((e.id || "EMP000").replace("EMP", ""), 10);
                    return isNaN(n) ? max : Math.max(max, n);
                }, 0);
                return "EMP" + String(maxNum + 1).padStart(3, "0");
            };
            const generateAssetId = () => {
                const maxNum = getAssets().reduce((max, a) => {
                    const n = parseInt((a.id || "AST000").replace("AST", ""), 10);
                    return isNaN(n) ? max : Math.max(max, n);
                }, 0);
                return "AST" + String(maxNum + 1).padStart(3, "0");
            };

            // age calculation function
            const parseDMY = (str) => {
                if (!str || str === "—") return null;
                const p = str.split(/[\/\-]/);
                if (p.length !== 3) return null;
                const d = new Date(+p[2], +p[1] - 1, +p[0]);
                return isNaN(d.getTime()) ? null : d;
            };
            const calcAge = (dob) => {
                const today = new Date();
                let age = today.getFullYear() - dob.getFullYear();
                const m = today.getMonth() - dob.getMonth();
                if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) age--;
                return age;
            };
            const getMax18Date = () => {
                const d = new Date(); d.setFullYear(d.getFullYear() - 18);
                return d;
            };

            // datepicker function
            const initOrUpdateDatepicker = (selector, opts) => {
                $(selector).each(function () {
                    if ($(this).hasClass("hasDatepicker")) {
                        $.each(opts, (k, v) => $(this).datepicker("option", k, v));
                    }
                    else {
                        $(this).datepicker($.extend({
                            dateFormat: getLocaleDateFormat(),
                            changeMonth: true,
                            changeYear: true,
                            yearRange: "1950:+10"
                        }, opts));
                    }
                });
            };


            // navbar section ------------------------------------------------------------------------------------------------------------------------
            const overlay = $("#sidebarOverlay");
            const closeSidebar = () => {
                $("#sidenav").removeClass("show"); overlay.removeClass("active");
            };
            $("#sidebarToggleBtn").on("click", () => {
                $("#sidenav").addClass("show"); overlay.addClass("active");
            });
            $("#closeSidebarBtn").on("click", closeSidebar);
            overlay.on("click", closeSidebar);
            $(".sideNavToggle").on("click", function (e) {
                e.preventDefault();
                const menu = $(this).closest(".nav-item").find(".dropdown-menu");
                const isOpen = menu.hasClass("open");
                $(".dropdown-menu").removeClass("open");
                if (!isOpen) menu.addClass("open");
            });

            const allNavLinks = [
                $("#dashboardId"),
                $("#addEmployeeId"),
                $("#viewEmployeeId"),
                $("#assetAssignId"),
                $("#assetInventoryId"),
                $("#assetHistoryId")
            ];
            const showSection = (activeLink, sectionId, onShow) => {
                allNavLinks.forEach(l => l.removeClass("text-muted").addClass("text-light"));
                activeLink.removeClass("text-light").addClass("text-muted");
                $(".page-section").hide();
                $("#" + sectionId).show();
                closeSidebar();
                if (onShow) onShow();
            };
            $("#dashboardId").on("click",
                () => showSection($("#dashboardId"), "section-dashboard", loadDashboard));
            $("#addEmployeeId").on("click",
                () => showSection($("#addEmployeeId"), "section-addEmp"));
            $("#viewEmployeeId").on("click",
                () => showSection($("#viewEmployeeId"), "section-viewEmp", loadEmpTable));
            $("#assetAssignId").on("click",
                () => showSection($("#assetAssignId"), "section-assign", loadAssignedTable));
            $("#assetInventoryId").on("click",
                () => showSection($("#assetInventoryId"), "section-inventory", loadAssetTable));
            $("#assetHistoryId").on("click",
                () => showSection($("#assetHistoryId"), "section-history", loadHistory));
            showSection($("#dashboardId"), "section-dashboard", loadDashboard);

            // Datepicker initialize
            $(document).on("shown.bs.modal", "#addEmpModal", function () {
                addEmpModalReady = true;
                initOrUpdateDatepicker("#dob", {
                    maxDate: getMax18Date(),
                    yearRange: "1950:-18"
                });
            });
            $(document).on("shown.bs.modal", "#editEmpModal", function () {
                initOrUpdateDatepicker("#editDob", {
                    maxDate: getMax18Date(),
                    yearRange: "1950:-18"
                });
            });
            $(document).on("shown.bs.modal", "#assignModal", function () {
                const tomorrow = new Date();
                tomorrow.setDate(tomorrow.getDate() + 1);
                initOrUpdateDatepicker("#assignReturnDate", {
                    minDate: tomorrow
                });
            });

            // add employee section ----------------------------------------------------------------------------------------------------------------------

            // regex pattern
            const fnamePattern = /^[A-Za-z]+(['][A-Za-z]+)*'?$/;
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const passPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@!$%&])[A-Za-z\d@!$%&]{8,}$/;

            // error function
            const showError = (id, msg) => {
                $("#" + id).closest(".input-group").siblings(".error-msg").text(msg);
                $("#" + id).removeClass("is-valid").addClass("is-invalid");
            };
            const clearError = (id) => {
                $("#" + id).closest(".input-group").siblings(".error-msg").text("");
                $("#" + id).removeClass("is-invalid").addClass("is-valid");
            };
            const showEditError = (id, msg) => {
                $("#" + id).closest(".input-group").siblings(".error-msg").text(msg);
                $("#" + id).removeClass("is-valid").addClass("is-invalid");
            };
            const clearEditError = (id) => {
                $("#" + id).closest(".input-group").siblings(".error-msg").text("");
                $("#" + id).removeClass("is-invalid").addClass("is-valid");
            };

            // add Employee validation
            const validateFname = () => {
                const v = $("#fname").val();
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
                clearError("lname"); return true;
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
                const v = $("#dob").val().trim();
                if (!v) {
                    showError("dob", "Date of Birth is required!");
                    return false;
                }
                const dob = parseDMY(v);
                if (!dob) {
                    showError("dob", "Enter a valid date (DD/MM/YYYY)!");
                    return false;
                } const age = calcAge(dob);
                if (age < 18) {
                    showError("dob", `Must be at least 18 years old. Entered age: ${age}.`);
                    return false;
                }
                if (age > 60) {
                    showError("dob", `Age ${age} exceeds the maximum allowed age of 60.`);
                    return false;
                }
                clearError("dob"); return true;
            };
            const validateEmail = () => {
                const v = $("#email").val().trim().toLowerCase();
                if (!v) {
                    showError("email", "Email is required!");
                    return false;
                }
                if (!emailPattern.test(v)) {
                    showError("email", "Enter a valid email!");
                    return false;
                }
                const exists = getEmployees().some(e => e.email.toLowerCase() === v);
                if (exists) {
                    showError("email", "This email is already registered!");
                    return false;
                }
                clearError("email");
                return true;
            };
            const validateContact = () => {
                const v = $("#contact").val();
                if (!v.trim()) {
                    showError("contact", "Contact is required!");
                    return false;
                }
                if (!/^[0-9]{10}$/.test(v)) {
                    showError("contact", "Enter a valid 10-digit number!");
                    return false;
                } const exists = getEmployees().some(e => e.contact === v.trim());
                if (exists) {
                    showError("contact", "This contact number is already registered!");
                    return false;
                }
                clearError("contact");
                return true;
            };
            const validatePass = () => {
                const v = $("#pass").val();
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
                if (!v) {
                    errEl.text("Department is required!");
                    $("#dept").removeClass("is-valid").addClass("is-invalid");
                    return false;
                }
                errEl.text("");
                $("#dept").removeClass("is-invalid").addClass("is-valid");
                return true;
            };
            const validateRole = () => {
                if ($("#deptrole").prop("disabled")) {
                    $("#deptrole").closest(".input-group").siblings(".error-msg").text("Select a department first!");
                    return false;
                }
                const v = $("#deptrole").val();
                const errEl = $("#deptrole").closest(".input-group").siblings(".error-msg");
                if (!v) {
                    errEl.text("Role is required!");
                    $("#deptrole").removeClass("is-valid").addClass("is-invalid");
                    return false;
                }
                errEl.text("");
                $("#deptrole").removeClass("is-invalid").addClass("is-valid");
                return true;
            };
            const validateLocation = () => {
                if (!addEmpModalReady) return true;
                const v = $("#location").val();
                const errEl = $("#location").closest(".col-md-12").find(".error-msg");
                if (!v || v.length === 0) {
                    errEl.text("Location is required!");
                    return false;
                }
                errEl.text("");
                return true;
            };

            $("#fname").on("input", validateFname); $("#lname").on("input", validateLname);
            $("input[name='gender']").on("change", validateGender); $("#dob").on("change", validateDob);
            $("#email").on("input", validateEmail);
            $("#contact").on("keydown", function (e) {
                const ok = ["Backspace", "Delete", "ArrowLeft", "ArrowRight", "Tab"];
                if (!ok.includes(e.key) && !/^[0-9]$/.test(e.key)) e.preventDefault();
            }).on("input", function () {
                if (this.value.length > 10) this.value = this.value.slice(0, 10); validateContact();
            });
            $("#pass").on("input", validatePass); $("#cpass").on("input", validateCpass);

            Object.keys(deptRoles).forEach(d => $("#dept").append(`<option value="${d}">${d}</option>`));
            $("#dept").on("change", function () {
                const sel = $(this).val();
                $("#deptrole").html('<option value="">Select Role</option>').prop("disabled", true).removeClass("is-valid is-invalid");
                $("#deptrole").closest(".input-group").siblings(".error-msg").text("");
                if (!sel) {
                    validateDept();
                    return;
                }
                deptRoles[sel].forEach(r => $("#deptrole").append(`<option value="${r}">${r}</option>`));
                $("#deptrole").prop("disabled", false); validateDept();
            });
            $("#deptrole").on("change", validateRole);

            $("#location").select2({
                theme: "classic",
                placeholder: "Select Location(s)",
                allowClear: true,
                data: locationData,
                multiple: true,
                dropdownParent: $("#addEmpModal")
            }).val([]).trigger("change");

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
                const fn = $("#fname").val().trim();
                const ln = $("#lname").val().trim();
                const emp = {
                    id: generateEmpId(),
                    firstname: fn,
                    lastname: ln,
                    fullname: `${fn} ${ln}`,
                    gender: $("input[name='gender']:checked").val(),
                    dob: $("#dob").val().trim(),
                    email: $("#email").val().trim().toLowerCase(),
                    contact: $("#contact").val().trim(),
                    password: $("#pass").val().trim(),
                    department: $("#dept").val(),
                    role: $("#deptrole").val(),
                    location: $("#location").val() || [],
                    joindate: new Date().toLocaleDateString("en-GB"),
                    enddate: "",
                    status: "Active"
                };
                const emps = getEmployees();
                emps.push(emp);
                saveEmployees(emps);
                $("#addEmpModal").modal("hide");
                Swal.fire({
                    title: "Success",
                    icon: "success",
                    text: `${emp.fullname} added successfully!`
                }).then(() => {
                    if (empTable && $.fn.DataTable.isDataTable("#empTable")) {
                        loadEmpTable();
                    }
                });

            });
            // reset form on modal close
            $("#addEmpModal").on("hidden.bs.modal", function () {
                addEmpModalReady = false;
                $("#fname,#lname,#dob,#email,#contact,#pass,#cpass").val("").removeClass("is-valid is-invalid");
                $("input[name='gender']").prop("checked", false);
                $("#dept").val("").removeClass("is-valid is-invalid");
                $("#deptrole").html('<option value="">Select Role</option>').prop("disabled", true).removeClass("is-valid is-invalid");
                $("#location").val([]).trigger("change");
                $(".error-msg").text("").removeClass("text-success").addClass("text-danger");
                $("#pass,#cpass").attr("type", "password");
                $(".toggle-password i").removeClass("fa-eye-slash").addClass("fa-eye");
            });

            // Dashboad section ---------------------------------------------------------------------------------------------------------------------
            function loadDashboard() {
                checkEmployeeRelieveDates();
                const employees = getEmployees();
                const assets = getAssets();
                $("#totalEmp").text(employees.length);
                $("#totalAssets").text(assets.length);
                $("#activeEmp").text(employees.filter(e => e.status === "Active").length);
                $("#inactiveEmp").text(employees.filter(e => e.status === "Inactive").length);
                $("#assignedAssets").text(assets.filter(a => a.status === "A").length);
                $("#unassignedAssets").text(assets.filter(a => a.status === "NA").length);
            }

            // releive date check
            function checkEmployeeRelieveDates() {
                const today = new Date();
                today.setHours(0, 0, 0, 0);
                const emps = getEmployees();
                let changed = false;
                emps.forEach((emp, idx) => {
                    if (emp.status === "Active" && emp.enddate && emp.enddate !== "") {
                        const relieveDate = parseDMY(emp.enddate);
                        if (relieveDate && relieveDate <= today) {
                            emps[idx].status = "Inactive";
                            changed = true;
                        }
                    }
                });

                if (changed) {
                    saveEmployees(emps);
                }
            }

            // edit Employee validation
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
                const dob = parseDMY(v);
                if (!dob) {
                    showEditError("editDob", "Enter a valid date!");
                    return false;
                } const age = calcAge(dob);
                if (age < 18) {
                    showEditError("editDob", `Must be at least 18. Entered age: ${age}.`);
                    return false;
                } if (age > 60) {
                    showEditError("editDob", `Age ${age} exceeds maximum of 60.`);
                    return false;
                }
                clearEditError("editDob");
                return true;
            };
            const validateEditEmail = () => {
                const v = $("#editEmail").val().trim();
                const id = $("#editEmpId").val();
                if (!v) {
                    showEditError("editEmail", "Email required!");
                    return false;
                }
                if (!emailPattern.test(v)) {
                    showEditError("editEmail", "Invalid email!");
                    return false;
                }
                const exists = getEmployees().some(e => e.id !== id && e.email.toLowerCase() === v.toLowerCase());
                if (exists) {
                    showEditError("editEmail", "Email already in use by another employee!");
                    return false;
                }
                clearEditError("editEmail");
                return true;
            };
            const validateEditContact = () => {
                const v = $("#editContact").val().trim();
                const id = $("#editEmpId").val();
                if (!v) {
                    showEditError("editContact", "Contact required!");
                    return false;
                }
                if (!/^[0-9]{10}$/.test(v)) {
                    showEditError("editContact", "Enter 10 digits!");
                    return false;
                }
                const exists = getEmployees().some(e => e.id !== id && e.contact === v);
                if (exists) {
                    showEditError("editContact", "Contact already in use!");
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
                if (!v) {
                    errEl.text("Department required!");
                    $("#editDept").removeClass("is-valid").addClass("is-invalid");
                    return false;
                }
                errEl.text("");
                $("#editDept").removeClass("is-invalid").addClass("is-valid");
                return true;
            };
            const validateEditRole = () => {
                if ($("#editRole").prop("disabled")) {
                    $("#editRole").closest(".input-group").siblings(".error-msg").text("Select department first!");
                    return false;
                }
                const v = $("#editRole").val();
                const errEl = $("#editRole").closest(".input-group").siblings(".error-msg");
                if (!v) {
                    errEl.text("Role required!"); $("#editRole").removeClass("is-valid").addClass("is-invalid");
                    return false;
                }
                errEl.text("");
                $("#editRole").removeClass("is-invalid").addClass("is-valid");
                return true;
            };
            const validateEditLoc = () => {
                const v = $("#editLocation").val();
                const errEl = $("#editLocation").closest(".col-md-6").find(".error-msg");
                if (!v || v.length === 0) {
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
            }).on("input", function () {
                if (this.value.length > 10) this.value = this.value.slice(0, 10);
                validateEditContact();
            });
            $("#editPassword").on("input", validateEditPass);
            $("#editCpass").on("input", validateEditCpass);
            $("#editLocation").on("change", validateEditLoc);

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
                placeholder: "Select Location(s)",
                allowClear: true,
                data: locationData,
                multiple: true,
                dropdownParent: $("#editEmpModal")
            }).val([]).trigger("change");

            // populate edit form
            const populateEditModal = (emp, mode) => {
                $("#editEmpId").val(emp.id);
                $("#editMode").val(mode);
                const isChild = mode === "child";
                const isParent = mode === "parent";
                const allDisabled = !isAdmin;
                $("#editFname").val(emp.firstname || "").prop("disabled", allDisabled || isChild);
                $("#editLname").val(emp.lastname || "").prop("disabled", allDisabled || isChild);
                $("input[name='editGender']").prop("disabled", allDisabled || isChild);
                if ((emp.gender || "").toLowerCase() === "male") $("#editMale").prop("checked", true);
                else if ((emp.gender || "").toLowerCase() === "female") $("#editFemale").prop("checked", true);
                else $("input[name='editGender']").prop("checked", false);
                $("#editDob").val(emp.dob || "").prop("disabled", allDisabled || isChild);
                $("#editEmail").val(emp.email || "").prop("disabled", allDisabled || isChild);
                $("#editContact").val(emp.contact || "").prop("disabled", allDisabled || isChild);
                $("#editPassword").val(emp.password || "").prop("disabled", allDisabled || isChild);
                $("#editCpass").val(emp.password || "").prop("disabled", allDisabled || isChild);
                $(".toggle-password").prop("disabled", allDisabled || isChild);
                $("#editStatus").val(emp.status || "Active").prop("disabled", allDisabled || isChild);
                $("#editDept").val(emp.department || "").prop("disabled", allDisabled || isParent);
                if (emp.department && deptRoles[emp.department]) {
                    $("#editRole").html('<option value="">Select Role</option>');
                    deptRoles[emp.department].forEach(r => $("#editRole").append(`<option value="${r}">${r}</option>`));
                    $("#editRole").val(emp.role || "").prop("disabled", allDisabled || isParent);
                } else { $("#editRole").html('<option value="">Select Role</option>').prop("disabled", true); }
                const locArr = Array.isArray(emp.location) ? emp.location : (emp.location ? [emp.location] : []);
                $("#editLocation").val(locArr).trigger("change").prop("disabled", allDisabled || isParent);
                $("#editJoinDate").val(emp.joindate || "");
                $("#editEndDate").val(emp.enddate || "").prop("disabled", allDisabled || isParent);
                const joinDateObj = parseDMY(emp.joindate);
                const minRelieve = joinDateObj ? new Date(joinDateObj.getTime() + 86400000) : new Date();
                initOrUpdateDatepicker("#editEndDate", {
                    minDate: minRelieve
                });
                if (allDisabled) {
                    $("#editFname,#editLname,#editDob,#editEmail,#editContact,#editPassword,#editCpass").closest(".input-group").css("opacity", "0.6");
                    $("input[name='editGender']").closest(".row").css("opacity", "0.6");
                    $("#editDept,#editRole").addClass("opacity-50");
                    $("#editLocation + .select2-container").css("opacity", "0.5");
                    $("#editJoinDate,#editEndDate").prop("disabled", true).closest(".input-group").css("opacity", "0.6");
                } else if (isParent) {
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

            // reset form on modal close
            $("#editEmpModal").on("hidden.bs.modal", function () {
                $("#editFname,#editLname,#editDob,#editEmail,#editContact,#editPassword,#editCpass,#editJoinDate,#editEndDate").val("").prop("disabled", false).removeClass("is-valid is-invalid");
                $("input[name='editGender']").prop("checked", false).prop("disabled", false);
                $("#editDept").val("").prop("disabled", false).removeClass("is-valid is-invalid");
                $("#editRole").html('<option value="">Select Role</option>').prop("disabled", true).removeClass("is-valid is-invalid");
                $("#editLocation").val([]).trigger("change").prop("disabled", false);
                $(".error-msg").text("").removeClass("text-success").addClass("text-danger");
                $("#editFname,#editLname,#editDob,#editEmail,#editContact,#editPassword,#editCpass").closest(".input-group").css("opacity", "1");
                $("input[name='editGender']").closest(".row").css("opacity", "1");
                $("#editDept,#editRole").removeClass("opacity-50");
                $("#editLocation + .select2-container").css("opacity", "1");
                $("#editPassword,#editCpass").attr("type", "password");
                $(".toggle-password i").removeClass("fa-eye-slash").addClass("fa-eye");
                $("#editStatus").val("Active").prop("disabled", false);
            });

            // dtatable definitions
            const childFormat = (d) => {
                const loc = Array.isArray(d.location) ? (d.location.join(", ") || "—") : (d.location || "—");
                const actionHeader = isAdmin ? `<th rowspan="2" class="text-center align-middle">Action</th>` : "";
                const actionCell = isAdmin ? `<td><button type="button" class="btn btn-sm btn-outline-primary childEditBtn" data-id="${d.id}">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                    </button>
                                            </td>` : "";
                return `<table class="table table-sm table-bordered table-striped child-table">
                <thead class="thead-dark text-center"><tr>
                    <th rowspan="2" class="text-center align-middle">Location</th>
                    <th colspan="2" class="text-center align-middle">Position</th>
                    <th rowspan="2" class="text-center align-middle">Join Date</th>
                    <th rowspan="2" class="text-center align-middle">Relieve Date</th>
                    ${actionHeader}
                </tr><tr>
                    <th class="text-center align-middle">Department</th>
                    <th class="text-center align-middle">Role</th>
                </tr></thead>
                <tbody><tr class="text-center">
                    <td>${loc}</td>
                    <td>${d.department || "—"}</td>
                    <td>${d.role || "—"}</td>
                    <td>${d.joindate || "—"}</td>
                    <td>${d.enddate || "—"}</td>
                    ${actionCell}
                </tr></tbody>
            </table>`;
            };

            const empDtDom =
                '<"row align-items-center mb-1"<"col-auto"<"dt-filter-btn">><"col-auto"<"dt-filter2-btn">>>' +
                '<"row"<"col-md-12 mb-2"P>>' +
                '<"row"<"col-md-12 mb-2"Q>>' +
                '<"row align-items-center mb-2"<"col-md-2 mt-n3"l><"col-md-1"<"dt-state-btn">><"col-md-1"<"dt-load-btn">><"col-md-8 d-flex justify-content-end"<"dt-export-btn">f>>' +
                '<"d-none"B>t<"d-flex justify-content-between align-items-center pt-2"ip>';

            const dtDom =
                '<"row"<"col-12"<"dt-filter-btn">>>' +
                '<"row"<"col-md-12 mb-2"P>>' +
                '<"row align-items-center mb-2"<"col-md-2 mt-n3"l><"col-md-1"<"dt-state-btn">><"col-md-1"<"dt-load-btn">><"col-md-8 d-flex justify-content-end"<"dt-export-btn">f>>' +
                '<"d-none"B>t<"d-flex justify-content-between align-items-center pt-2"ip>';

            const empDtButtons = [
                {
                    text: '<i class="fa-solid fa-filter mr-1"></i> Filters',
                    className: "btn btn-sm mb-2",
                    action: () => $(".dtsp-panesContainer").slideToggle(200)
                },
                {
                    text: '<i class="fa fa-search mr-1"></i> Condition',
                    className: "btn btn-sm mb-2",
                    action: () => $('.dtsb-searchBuilder').slideToggle(200)
                },
                {
                    extend: "collection",
                    text: '<i class="fa-solid fa-bars" style="color:#fff;"></i> Export',
                    className: "btn btn-sm mb-3",
                    buttons: [
                        {
                            extend: "copyHtml5",
                            text: '<i class="fa-solid fa-copy mr-1"></i> Copy',
                            className: "btn btn-sm",
                            exportOptions: { columns: ':not(.no-export)' }

                        },
                        {
                            extend: "excelHtml5",
                            text: '<i class="fa-solid fa-file-excel mr-1"></i> Excel',
                            className: "btn btn-sm",
                            exportOptions: { columns: ':not(.no-export)' }

                        },
                        {
                            extend: "pdfHtml5",
                            text: '<i class="fa-solid fa-file-pdf mr-1"></i> PDF',
                            className: "btn btn-sm",
                            exportOptions: { columns: ':not(.no-export)' }
                        },
                        {
                            extend: "csvHtml5",
                            text: '<i class="fa-solid fa-file-csv mr-1"></i> CSV',
                            className: "btn btn-sm",
                            exportOptions: { columns: ':not(.no-export)' }
                        },
                        {
                            extend: "print",
                            text: '<i class="fa-solid fa-print mr-1"></i> Print',
                            className: "btn btn-sm",
                            exportOptions: { columns: ':not(.no-export)' }
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

            const dtButtons = [
                {
                    text: '<i class="fa-solid fa-filter mr-1"></i> Filters',
                    className: "btn btn-sm mb-2",
                    action: () => $(".dtsp-panesContainer").slideToggle(200)
                },
                {
                    extend: "collection",
                    text: '<i class="fa-solid fa-bars" style="color:#fff;"></i> Export',
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

            // load datatable
            function loadEmpTable() {
                checkEmployeeRelieveDates();
                const employees = getEmployees();
                if (empTable && $.fn.DataTable.isDataTable("#empTable")) {
                    empTable.clear().rows.add(employees).draw();
                    applyRole();
                    return;
                }
                if ($.fn.DataTable.isDataTable("#empTable")) {
                    $("#empTable").DataTable().destroy();
                    $("#empTable tbody").empty();
                }
                empTable = $("#empTable").DataTable({
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
                    searchBuilder: {
                        columns: [1, 2, 6,]
                    },
                    dom: empDtDom,
                    buttons: empDtButtons,
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
                            render: d => {
                                const cls = d === "Active" ? "status-active"
                                    : "status-inactive"; const ico = d === "Active"
                                        ? '<i class="fa-solid fa-circle-check mr-1"></i>'
                                        : '<i class="fa-solid fa-circle-xmark mr-1"></i>';
                                return `<span class="${cls}">${ico}${d || "—"}</span>`;
                            }
                        },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            searchPanes: { show: false },
                            className: "text-center align-middle emp-action-col",
                            render: d => `<button type="button" class="btn btn-sm btn-outline-primary parentEditBtn" data-id="${d.id}">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                            </button>`
                        },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            searchPanes: { show: false },
                            className: "text-center align-middle",
                            render: d => `<button type="button" class="btn btn-sm btn-outline-info profileBtn" data-id="${d.id}">
                                            <i class="fa-solid fa-user"></i>
                                            </button>`
                        }
                    ],
                    initComplete: function () {
                        const c = $(this.api().table().container());
                        const b = c.find(".dt-buttons button");
                        c.find(".dt-filter-btn").append(b.eq(0).detach());
                        c.find(".dt-filter2-btn").append(b.eq(1).detach());
                        c.find(".dt-export-btn").append(b.eq(2).detach());
                        c.find(".dt-state-btn").append(b.eq(3).detach());
                        c.find(".dt-load-btn").append(b.eq(4).detach());

                        $(".dtsp-panesContainer").hide();
                        $(".dtsb-searchBuilder").hide();
                    }
                });
                applyRole();
                empTable.on("click", "tbody td.dt-control", function (e) {
                    const tr = e.target.closest("tr");
                    const row = empTable.row(tr);
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

            $("#empTable").on("click", ".parentEditBtn", function () {
                const emp = getEmployees().find(e => e.id === $(this).data("id"));
                if (!emp) return; populateEditModal(emp, "parent");
                $("#editEmpModal").modal("show");
            });

            // employee child edit
            $(document).on("click", ".childEditBtn", function () {
                const emp = getEmployees().find(e => e.id === $(this).data("id"));
                if (!emp) return;
                populateEditModal(emp, "child");
                $("#editEmpModal").modal("show");
            });

            //  employee profile
            $("#empTable").on("click", ".profileBtn", function () {
                const emp = getEmployees().find(e => e.id === $(this).data("id"));
                if (!emp) return;
                const loc = Array.isArray(emp.location) ? (emp.location.join(", ") || "—") : (emp.location || "—");
                const dobDate = parseDMY(emp.dob);
                const ageStr = dobDate ? `${calcAge(dobDate)} years` : "—";
                Swal.fire({
                    title: emp.fullname,
                    icon: "info",
                    width: 520,
                    html: `<table class="table table-sm table-bordered text-left mt-2">
                            <tr><th style="width:40%">Employee ID</th><td>${emp.id}</td></tr>
                            <tr><th>Gender</th><td>${emp.gender || "—"}</td></tr>
                            <tr><th>Date of Birth</th><td>${emp.dob || "—"} (${ageStr})</td></tr>
                            <tr><th>Email</th><td>${emp.email || "—"}</td></tr>
                            <tr><th>Contact</th><td>${emp.contact || "—"}</td></tr>
                            <tr><th>Department</th><td>${emp.department || "—"}</td></tr>
                            <tr><th>Role</th><td>${emp.role || "—"}</td></tr>
                            <tr><th>Location</th><td>${loc}</td></tr>
                            <tr><th>Join Date</th><td>${emp.joindate || "—"}</td></tr>
                            <tr><th>Relieve Date</th><td>${emp.enddate || "—"}</td></tr>
                            <tr><th>Status</th><td>${emp.status || "—"}</td></tr>
                        </table>`, confirmButtonText: "Close"
                });
            });

            // update employee
            $("#updateEmpBtn").on("click", function () {
                debugger;
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
                    if (emps[idx].status === "Inactive" && emps[idx].enddate === "") {
                        debugger;
                        const todayvalStr = new Date().toLocaleDateString("en-GB");
                        emps[idx].enddate = todayvalStr;
                    }
                    else {
                        emps[idx].enddate = "";
                    }

                } else {
                    const ok = [
                        validateEditDept(),
                        validateEditRole(),
                        validateEditLoc()
                    ];
                    if (!ok.every(Boolean)) return;
                    emps[idx].department = $("#editDept").val();
                    emps[idx].role = $("#editRole").val();
                    emps[idx].location = $("#editLocation").val() || [];
                    const relieveVal = $("#editEndDate").val().trim();
                    emps[idx].enddate = relieveVal;

                    if (relieveVal) {
                        const relieveDate = parseDMY(relieveVal);
                        const today = new Date();
                        today.setHours(0, 0, 0, 0);

                        if (relieveDate && relieveDate <= today) {
                            emps[idx].status = "Inactive";
                            Swal.fire({
                                icon: "info",
                                title: "Status Auto-Updated",
                                text: "Relieve date reached. Employee set to Inactive.",
                                timer: 3000,
                                showConfirmButton: false
                            });
                        } else {
                            emps[idx].status = $("#editStatus").val();
                            Swal.fire({
                                icon: "info",
                                title: "Relieve Date Saved",
                                text: `Employee will be set Inactive on ${relieveVal}.`,
                                timer: 3000,
                                showConfirmButton: false
                            });
                        }
                    } else {
                        emps[idx].status = $("#editStatus").val();
                    }

                }
                saveEmployees(emps);
                $("#editEmpModal").modal("hide");
                if (empTable && $.fn.DataTable.isDataTable("#empTable")) {
                    loadEmpTable();
                }
                Swal.fire({
                    icon: "success",
                    title: "Updated!",
                    text: `${emps[idx].fullname} updated successfully.`
                });
            });

            // employee delete
            $("#deleteEmpBtn").on("click", function () {
                const id = $("#editEmpId").val();
                const emps = getEmployees();
                const emp = emps.find(e => e.id === id);
                if (!emp) return;
                const blockedAssets = getAssets().filter(a =>
                    (a.status === "A" || a.status === "UM") &&
                    (a.assignedEmpId === emp.id || a.assignedTo === emp.fullname)
                );
                if (blockedAssets.length > 0) {
                    const assetList = blockedAssets.map(a => `${a.name} (${a.id}) — ${a.status === "A"
                        ? "Assigned"
                        : "Under Maintenance"}`).join("\n");
                    Swal.fire({
                        icon: "warning",
                        title: "Cannot Delete",
                        html: `<b>${emp.fullname}</b> still has assets linked:<br><br><pre style="text-align:left;font-size:0.85rem">${assetList}</pre>Please return or reassign all assets before deleting.`
                    }); return;
                }
                Swal.fire({
                    title: "Delete Employee?",
                    text: `Delete ${emp.fullname}? This cannot be undone.`,
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#dc3545",
                    confirmButtonText: "Delete"
                })
                    .then(r => {
                        if (r.isConfirmed) {
                            saveEmployees(emps.filter(e => e.id !== id));
                            $("#editEmpModal").modal("hide");
                            loadEmpTable();
                            Swal.fire({
                                icon: "success",
                                title: "Deleted!",
                                text: `${emp.fullname} removed.`
                            });
                        }
                    });
            });

            // asset Assign section 

            function loadAssignedTable() {
                const today = new Date();
                today.setHours(0, 0, 0, 0);
                const todayStr = new Date().toLocaleDateString("en-GB");
                const allAssets = getAssets();

                const autoReturnedToday = JSON.parse(localStorage.getItem("autoReturnedToday") || "[]");
                const autoReturnedDate = localStorage.getItem("autoReturnedDate") || "";
                const currentDate = todayStr;

                if (autoReturnedDate !== currentDate) {
                    localStorage.setItem("autoReturnedToday", "[]");
                    localStorage.setItem("autoReturnedDate", currentDate);
                }

                const processedToday = JSON.parse(localStorage.getItem("autoReturnedToday") || "[]");
                let autoReturned = false;

                allAssets.forEach((a, idx) => {
                    if (a.status === "A" && a.returnDate && a.returnDate !== "—") {
                        const retDate = parseDMY(a.returnDate);
                        if (retDate && retDate <= today && !processedToday.includes(a.id)) {
                            const hist = getHistory();
                            hist.unshift({
                                type: "return",
                                msg: `${a.name} (${a.id}) auto-returned from ${a.assignedTo} (${a.assignedEmpId || "—"}) on ${todayStr} (return date reached)`,
                                asset: a.name,
                                assetId: a.id,
                                employee: a.assignedTo,
                                empId: a.assignedEmpId || "—",
                                date: todayStr
                            });
                            saveHistory(hist);
                            allAssets[idx].status = "NA";
                            allAssets[idx].assignedTo = "—";
                            allAssets[idx].assignedEmpId = "";
                            allAssets[idx].startDate = "—";
                            allAssets[idx].returnDate = "—";
                            processedToday.push(a.id);
                            autoReturned = true;
                        }
                    }
                });

                if (autoReturned) {
                    localStorage.setItem("autoReturnedToday", JSON.stringify(processedToday));
                    saveAssets(allAssets);
                    loadDashboard();
                }

                const assignedAssets = allAssets.filter(a => a.status === "A");

                if (assignedTable && $.fn.DataTable.isDataTable("#assignedTable")) {
                    assignedTable.clear().rows.add(assignedAssets).draw();
                    assignedTable.column(4).visible(isAdmin);
                    initInlineDatepickers();
                    return;
                }
                if ($.fn.DataTable.isDataTable("#assignedTable")) {
                    $("#assignedTable").DataTable().destroy();
                    $("#assignedBody").empty();
                }

                assignedTable = $("#assignedTable").DataTable({
                    data: assignedAssets,
                    pageLength: 10,
                    ordering: true,
                    searching: true,
                    info: true,
                    language: {
                        search: "",
                        searchPlaceholder: "Search assigned assets...",
                        emptyTable: "No assets currently assigned",
                        zeroRecords: "No matching records",
                        info: "Showing _START_ to _END_ of _TOTAL_ assigned",
                        lengthMenu: "Show _MENU_"
                    },
                    columns: [
                        {
                            data: "name",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "assignedTo",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "startDate",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            render: function (d, type, row) {
                                if (type !== 'display') return d;
                                return `<div class="inline-date-wrap">
                                    <input type="text"
                                           class="inline-start-date"
                                           data-id="${row.id}"
                                           value="${d || '—'}"
                                           placeholder="DD/MM/YYYY"
                                           autocomplete="off"
                                           readonly />
                                    <i class="fa-solid fa-calendar-days inline-cal-icon inline-start-cal" data-id="${row.id}"></i>
                                </div>`;
                            }
                        },
                        {
                            data: "returnDate",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            render: function (d, type, row) {
                                if (type !== 'display') return d;
                                return `<div class="inline-date-wrap">
                                    <input type="text"
                                           class="inline-return-date"
                                           data-id="${row.id}"
                                           value="${d || '—'}"
                                           placeholder="DD/MM/YYYY"
                                           autocomplete="off" />
                                    <i class="fa-solid fa-calendar-days inline-cal-icon inline-return-cal" data-id="${row.id}"></i>
                                </div>`;
                            }
                        },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            className: "text-center align-middle",
                            render: d => `<button type="button" class="btn btn-sm btn-warning returnAssetBtn" data-id="${d.id}">
                            <i class="fa-solid fa-rotate-left mr-1"></i>Return
                            </button>`
                        }
                    ],
                    initComplete: function () { }
                });

                assignedTable.column(4).visible(isAdmin);
                initInlineDatepickers();
            }
            //row datepicker
            function initInlineDatepickers() {
                $("#assignedTable").find(".inline-start-date").each(function () {
                    if ($(this).hasClass("hasDatepicker")) return;

                    $(this).datepicker({
                        dateFormat: 'dd/mm/yy',
                        changeMonth: true,
                        changeYear: true,
                        yearRange: "2000:+5",
                        onSelect: function (dateStr) {
                            const assetId = $(this).data("id");
                            const assets = getAssets();
                            const idx = assets.findIndex(a => a.id === assetId);
                            if (idx === -1) return;

                            const retVal = assets[idx].returnDate;
                            if (retVal && retVal !== "—") {
                                const retDate = parseDMY(retVal);
                                const newStart = parseDMY(dateStr);
                                if (retDate && newStart && newStart >= retDate) {
                                    Swal.fire({
                                        icon: "warning",
                                        title: "Invalid Start Date",
                                        text: "Start date must be before the return date!",
                                        timer: 2500,
                                        showConfirmButton: false
                                    });
                                    $(this).val(assets[idx].startDate || "—");
                                    return;
                                }
                            }

                            assets[idx].startDate = dateStr;
                            saveAssets(assets);

                            Swal.fire({
                                icon: "success",
                                title: "Start Date Updated",
                                text: `Start date set to ${dateStr}`,
                                timer: 1800,
                                showConfirmButton: false
                            });
                        }
                    });
                });

                const tomorrow = new Date();
                tomorrow.setDate(tomorrow.getDate() + 1);
                tomorrow.setHours(0, 0, 0, 0);

                $("#assignedTable").find(".inline-return-date").each(function () {
                    if ($(this).hasClass("hasDatepicker")) return;

                    $(this).datepicker({
                        dateFormat: 'dd/mm/yy',
                        changeMonth: true,
                        changeYear: true,
                        yearRange: "2000:+5",
                        minDate: tomorrow,
                        onSelect: function (dateStr) {
                            const assetId = $(this).data("id");
                            const assets = getAssets();
                            const idx = assets.findIndex(a => a.id === assetId);
                            if (idx === -1) return;
                            const startVal = assets[idx].startDate;
                            if (startVal && startVal !== "—") {
                                const startDate = parseDMY(startVal);
                                const newRet = parseDMY(dateStr);
                                if (startDate && newRet && newRet <= startDate) {
                                    Swal.fire({
                                        icon: "warning",
                                        title: "Invalid Return Date",
                                        text: "Return date must be after the start date!",
                                        timer: 2500,
                                        showConfirmButton: false
                                    });
                                    $(this).val(assets[idx].returnDate || "—");
                                    return;
                                }
                            }
                            assets[idx].returnDate = dateStr;
                            saveAssets(assets);
                            const selectedDate = parseDMY(dateStr);
                            const today = new Date();
                            today.setHours(0, 0, 0, 0);

                            if (selectedDate && selectedDate <= today) {
                                const todayStr = new Date().toLocaleDateString("en-GB");
                                const hist = getHistory();
                                hist.unshift({
                                    type: "return",
                                    msg: `${assets[idx].name} (${assets[idx].id}) auto-returned from ${assets[idx].assignedTo} (${assets[idx].assignedEmpId || "—"}) on ${todayStr} (return date reached)`,
                                    asset: assets[idx].name,
                                    assetId: assets[idx].id,
                                    employee: assets[idx].assignedTo,
                                    empId: assets[idx].assignedEmpId || "—",
                                    date: todayStr
                                });
                                saveHistory(hist);
                                assets[idx].status = "NA";
                                assets[idx].assignedTo = "—";
                                assets[idx].assignedEmpId = "";
                                assets[idx].startDate = "—";
                                assets[idx].returnDate = "—";
                                saveAssets(assets);
                                loadAssignedTable();
                                loadDashboard();

                                Swal.fire({
                                    icon: "success",
                                    title: "Asset Auto-Returned!",
                                    html: `Return date reached. Asset has been returned and <b>history updated</b>.`,
                                    timer: 2500,
                                    showConfirmButton: false
                                });

                            } else {
                                const todayStr = new Date().toLocaleDateString("en-GB");
                                const hist = getHistory();
                                hist.unshift({
                                    type: "scheduled",
                                    msg: `${assets[idx].name} (${assets[idx].id}) return scheduled on ${dateStr} for ${assets[idx].assignedTo} (${assets[idx].assignedEmpId || "—"}) — set on ${todayStr}`,
                                    asset: assets[idx].name,
                                    assetId: assets[idx].id,
                                    employee: assets[idx].assignedTo,
                                    empId: assets[idx].assignedEmpId || "—",
                                    date: todayStr,
                                    returnDate: dateStr
                                });
                                saveHistory(hist);
                                loadDashboard();

                                Swal.fire({
                                    icon: "info",
                                    title: "Return Date Set",
                                    html: `Asset will be auto-returned on <b>${dateStr}</b>.<br><small class="text-muted">History entry recorded.</small>`,
                                    timer: 2200,
                                    showConfirmButton: false
                                });
                            }
                        }
                    });
                });
            }

            $(document).on("click", ".inline-start-cal", function () {
                const id = $(this).data("id");
                $("#assignedTable").find(`.inline-start-date[data-id="${id}"]`).datepicker("show");
            });

            $(document).on("click", ".inline-return-cal", function () {
                const id = $(this).data("id");
                $("#assignedTable").find(`.inline-return-date[data-id="${id}"]`).datepicker("show");
            });

            // return asset button
            $(document).on("click", ".returnAssetBtn", function () {
                const assetId = $(this).data("id");
                const assets = getAssets();
                const idx = assets.findIndex(a => a.id === assetId);
                if (idx === -1) return;
                const asset = assets[idx];
                Swal.fire({
                    title: "Return Asset?",
                    html: `Return <b>${asset.name}</b> from <b>${asset.assignedTo}</b>?`,
                    icon: "question",
                    showCancelButton: true,
                    confirmButtonColor: "#ffc107",
                    confirmButtonText: "Return"
                }).then(r => {
                    if (!r.isConfirmed) return;
                    const hist = getHistory();
                    const todayStr = new Date().toLocaleDateString("en-GB");
                    hist.unshift({
                        type: "return",
                        msg: `${asset.name} (${asset.id}) returned from ${asset.assignedTo} (${asset.assignedEmpId || "—"}) on ${todayStr}`,
                        asset: asset.name,
                        assetId: asset.id,
                        employee: asset.assignedTo,
                        empId: asset.assignedEmpId || "—",
                        date: todayStr
                    });
                    saveHistory(hist);
                    assets[idx].status = "NA";
                    assets[idx].assignedTo = "—";
                    assets[idx].assignedEmpId = "";
                    assets[idx].startDate = "—";
                    assets[idx].returnDate = "—";
                    saveAssets(assets);
                    loadAssignedTable();
                    loadDashboard();
                    Swal.fire({
                        icon: "success",
                        title: "Returned!",
                        text: `${asset.name} has been returned and is now available.`,
                        timer: 2500,
                        showConfirmButton: false
                    });
                });
            });

            //assign form validations
            $("#assignModal").on("show.bs.modal", function () {
                const emps = getEmployees();
                const assets = getAssets();
                $("#assignEmployee").html('<option value="">Select Employee</option>');
                emps.filter(e => e.status === "Active").forEach(emp =>
                    $("#assignEmployee").append(`<option value="${emp.id}">${emp.fullname} — ${emp.department} (${emp.id})</option>`));
                const cats = [...new Set(assets.filter(a => a.status === "NA").map(a => a.category))];
                $("#assignCategory").html('<option value="">Select Category</option>');
                cats.forEach(c => $("#assignCategory").append(`<option value="${c}">${c}</option>`));
                $("#assignAsset").html('<option value="">Select Asset</option>').prop("disabled", true);
                $("#assignStartDate").val(new Date().toLocaleDateString("en-GB")); $("#assignReturnDate").val("");
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

            $("#assignEmployee").on("change", function () {
                validateAssignEmp();
                const empId = $(this).val();
                const empName = $(this).find("option:selected").text().split(" — ")[0];
                const count = getAssets().filter(a => a.assignedTo === empName && a.status === "A").length;
                const warnEl = $(this).closest(".input-group").siblings(".error-msg");
                if (empId && count >= 3) warnEl.removeClass("text-danger").addClass("text-warning").text(`Warning: ${empName} already has ${count} asset(s) assigned.`);
            });

            const validateAssignEmp = () => {
                const v = $("#assignEmployee").val();
                const err = $("#assignEmployee").closest(".input-group").siblings(".error-msg");
                if (!v) {
                    err.text("Select an employee!").removeClass("text-warning").addClass("text-danger");
                    $("#assignEmployee").removeClass("is-valid").addClass("is-invalid");
                    return false;
                }
                $("#assignEmployee").removeClass("is-invalid").addClass("is-valid");
                return true;
            };
            const validateAssignCat = () => {
                const v = $("#assignCategory").val();
                const err = $("#assignCategory").closest(".input-group").siblings(".error-msg");
                if (!v) {
                    err.text("Select a category!");
                    $("#assignCategory").removeClass("is-valid").addClass("is-invalid");
                    return false;
                }
                err.text("");
                $("#assignCategory").removeClass("is-invalid").addClass("is-valid");
                return true;
            };
            const validateAssignAst = () => {
                if ($("#assignAsset").prop("disabled")) {
                    $("#assignAsset").closest(".input-group").siblings(".error-msg").text("Select category first!");
                    return false;
                }
                const v = $("#assignAsset").val();
                const err = $("#assignAsset").closest(".input-group").siblings(".error-msg");
                if (!v) {
                    err.text("Select an asset!");
                    $("#assignAsset").removeClass("is-valid").addClass("is-invalid");
                    return false;
                }
                err.text("");
                $("#assignAsset").removeClass("is-invalid").addClass("is-valid");
                return true;
            };
            $("#assignCategory").on("change", validateAssignCat);
            $("#assignAsset").on("change", validateAssignAst);

            // assign button
            $("#confirmAssignBtn").on("click", function () {
                const ok = [
                    validateAssignEmp(),
                    validateAssignCat(),
                    validateAssignAst()
                ];
                if (!ok.every(Boolean)) return;
                const retVal = $("#assignReturnDate").val().trim();
                if (retVal) {
                    const retDate = parseDMY(retVal);
                    const tomorrow = new Date();
                    tomorrow.setDate(tomorrow.getDate() + 1);
                    tomorrow.setHours(0, 0, 0, 0);
                    const errEl = $("#assignReturnDate").closest(".input-group").siblings(".error-msg");
                    if (!retDate) {
                        errEl.text("Enter a valid return date (DD/MM/YYYY)!");
                        $("#assignReturnDate").addClass("is-invalid");
                        return;
                    }
                    if (retDate < tomorrow) {
                        errEl.text("Return date must be at least tomorrow!");
                        $("#assignReturnDate").addClass("is-invalid");
                        return;
                    }
                    errEl.text("");
                    $("#assignReturnDate").removeClass("is-invalid").addClass("is-valid");
                }

                const empId = $("#assignEmployee").val();
                const assetId = $("#assignAsset").val();
                const emp = getEmployees().find(e => e.id === empId);
                if (!emp) {
                    Swal.fire({
                        icon: "error",
                        title: "Employee not found!",
                        text: "Please reselect the employee."
                    });
                    return;
                }
                if (emp.status !== "Active") {
                    Swal.fire({
                        icon: "error",
                        title: "Employee Inactive!",
                        text: `${emp.fullname} is no longer active and cannot be assigned an asset.`
                    });
                    return;
                }

                const assets = getAssets();
                const idx = assets.findIndex(a => a.id === assetId);
                if (idx === -1) {
                    Swal.fire({
                        icon: "error",
                        title: "Asset not found!",
                        text: "Please reselect the asset."
                    });
                    return;
                }
                if (assets[idx].status !== "NA") {
                    Swal.fire({
                        icon: "warning",
                        title: "Asset Unavailable!",
                        text: `${assets[idx].name} is no longer available. Please select another asset.`
                    });
                    return;
                }

                const startDate = $("#assignStartDate").val().trim();
                const returnDate = retVal;

                assets[idx].status = "A";
                assets[idx].assignedTo = emp.fullname;
                assets[idx].assignedEmpId = emp.id;
                assets[idx].startDate = startDate;
                assets[idx].returnDate = returnDate || "—";
                saveAssets(assets);

                const hist = getHistory();
                const today = new Date().toLocaleDateString("en-GB");
                hist.unshift({
                    type: "assign",
                    msg: `${assets[idx].name} (${assets[idx].id}) assigned to ${emp.fullname} (${emp.id}) on ${today}`,
                    asset: assets[idx].name,
                    assetId: assets[idx].id,
                    employee: emp.fullname,
                    empId: emp.id,
                    date: today,
                    returnDate: returnDate || "—"
                });
                saveHistory(hist);

                $("#assignModal").modal("hide");
                loadAssignedTable();
                loadDashboard();
                Swal.fire({
                    icon: "success",
                    title: "Assigned!",
                    html: `<b>${assets[idx].name}</b> assigned to <b>${emp.fullname}</b> successfully.`
                });
            });

            //reset form on modal close
            $("#assignModal").on("hidden.bs.modal", function () {
                $("#assignEmployee,#assignCategory").val("");
                $("#assignAsset").html('<option value="">Select Asset</option>').prop("disabled", true);
                $("#assignReturnDate").val("");
                $("#assignStartDate").val(new Date().toLocaleDateString("en-GB"));
                $("#assignEmployee,#assignCategory,#assignAsset").removeClass("is-valid is-invalid");
                $(".error-msg").text("").removeClass("text-warning").addClass("text-danger");
            });

            // asset Inventory section ----------------------------------------------------------------------------------------------------------------------------
            const renderStatus = (s) => {
                if (s === "A") return `<span class="status-active"><i class="fa-solid fa-circle-check mr-1"></i>A</span>`;
                if (s === "NA") return `<span class="status-inactive"><i class="fa-solid fa-circle-xmark mr-1"></i>NA</span>`;
                if (s === "UM") return `<span class="text-warning font-weight-bold"><i class="fa-solid fa-triangle-exclamation mr-1"></i>UM</span>`;
                return s || "—";
            };

            // asset summary card
            const buildCatSummary = () => {
                const assets = getAssets();
                const cats = [...new Set(assets.map(a => a.category))];
                let html = "";
                cats.forEach(cat => {
                    const ca = assets.filter(a => a.category === cat);
                    const total = ca.length;
                    const assigned = ca.filter(a => a.status === "A").length;
                    const notAssig = ca.filter(a => a.status === "NA").length;
                    const underM = ca.filter(a => a.status === "UM").length;
                    html += `<div class="cat-card">
                    <div class="cat-name">${cat}</div>
                    <div class="cat-stat-header"><span class="cat-sh-cell">Total</span><span class="cat-sh-cell">In-stock</span><span class="cat-sh-cell">Assigned</span></div>
                    <div class="cat-stat-row"><span class="cat-sv-cell">${total}</span><span class="cat-sv-cell">${notAssig}</span><span class="cat-sv-cell">${assigned}</span></div>
                    <hr class="cat-divider" />
                    <div class="cat-detail-row"><span class="cat-detail-label">Under Maintenance</span><span class="cat-detail-val">${underM}</span></div>
                </div>`;
                });
                $("#catSummaryWrap").html(html);
            };
            // asset inventory table
            function loadAssetTable() {
                buildCatSummary();
                const assets = getAssets();
                if (assetTable && $.fn.DataTable.isDataTable("#assetTable")) {
                    assetTable.clear().rows.add(assets).draw();
                    buildCatSummary();
                    applyRole();
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
                    columnDefs: [{
                        targets: [4, 5],
                        searchPanes: { show: false }
                    }],
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
                            render: d => renderStatus(d)
                        },
                        {
                            data: "image",
                            orderable: false,
                            searchable: false,
                            searchPanes: { show: false },
                            className: "text-center align-middle",
                            render: (d, type, row) => `<button type="button" class="btn btn-sm btn-outline-secondary viewImgBtn" data-id="${row.id}">
                                                        <i class="fa-solid fa-image"></i>
                                                        </button>`
                        },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            searchPanes: { show: false },
                            className: "text-center align-middle asset-action-col",
                            render: d => `<button type="button" class="btn btn-sm btn-outline-primary editAssetBtn" data-id="${d.id}">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                            </button>`
                        }
                    ],
                    initComplete: function () {
                        const c = $(this.api().table().container());
                        const b = c.find(".dt-buttons button");
                        c.find(".dt-filter-btn").append(b.eq(0).detach());
                        c.find(".dt-export-btn").append(b.eq(1).detach());
                        c.find(".dt-state-btn").append(b.eq(2).detach());
                        c.find(".dt-load-btn").append(b.eq(3).detach());

                        $(".dtsp-panesContainer").hide();
                    }
                });
                applyRole();
            }

            // image button click
            $("#assetTable").on("click", ".viewImgBtn", function () {
                const asset = getAssets().find(a => a.id === $(this).data("id"));
                if (!asset) return;
                const imgs = Array.isArray(asset.images) ? asset.images.filter(s => s) : (asset.image ? [asset.image] : []);
                let slides = "";
                if (imgs.length > 0) {
                    imgs.forEach((src, i) => {
                        slides += `<div class="carousel-item ${i === 0 ? "active" : ""}">
                                    <img src="${src}" class="d-block w-100" alt="${asset.name} image ${i + 1}" style="max-height:400px;object-fit:contain;" />
                                    <div class="carousel-caption d-none d-md-block" style="background:rgba(0,0,0,0.4);border-radius:4px;"><small>${i + 1} / ${imgs.length}</small>
                                    </div>
                                </div>`;
                    });
                }
                else {
                    slides = `<div class="carousel-item active text-center py-5">
                                <i class="fa-solid fa-image fa-5x text-muted"></i>
                                <p class="mt-3 text-muted">No image available for ${asset.name}</p>
                            </div>`;
                }
                $("#carouselInner").html(slides);
                $("#assetCarouselModal").modal("show");
            });

            // add asset validatoion
            const validateAssetCat = () => {
                const v = $("#assetCategory").val();
                const err = $("#assetCategory").closest(".input-group").siblings(".error-msg");
                if (!v) {
                    err.text("Category required!");
                    $("#assetCategory").removeClass("is-valid").addClass("is-invalid");
                    return false;
                }
                err.text("");
                $("#assetCategory").removeClass("is-invalid").addClass("is-valid");
                return true;
            };
            const validateAssetName = () => {
                const v = $("#assetName").val().trim();
                const cat = $("#assetCategory").val();
                if (!v) {
                    showError("assetName", "Asset name required!");
                    return false;
                }
                const dup = getAssets().some(a => a.name.toLowerCase() === v.toLowerCase() && a.category === cat);
                if (dup) {
                    showError("assetName", "Asset with this name already exists in this category!");
                    return false;
                }
                clearError("assetName");
                return true;
            };
            const validateAssetStat = () => {
                const v = $("#assetStatus").val();
                const err = $("#assetStatus").closest(".input-group").siblings(".error-msg");
                if (!v) {
                    err.text("Status required!");
                    $("#assetStatus").removeClass("is-valid").addClass("is-invalid");
                    return false;
                }
                err.text("");
                $("#assetStatus").removeClass("is-invalid").addClass("is-valid");
                return true;
            };
            const validateEditAssetCat = () => {
                const v = $("#editAssetCategory").val();
                const err = $("#editAssetCategory").closest(".input-group").siblings(".error-msg");
                if (!v) {
                    err.text("Category required!");
                    $("#editAssetCategory").removeClass("is-valid").addClass("is-invalid");
                    return false;
                }
                err.text("");
                $("#editAssetCategory").removeClass("is-invalid").addClass("is-valid");
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

            $("#assetImage").on("change", function () {
                const file = this.files[0];
                const label = $(this).siblings(".custom-file-label");
                if (!file) {
                    label.text("Choose image");
                    $("#assetImagePreview").hide().attr("src", "");
                    return;
                }
                label.text(file.name);
                const reader = new FileReader();
                reader.onload = e => $("#assetImagePreview").attr("src", e.target.result).show();
                reader.readAsDataURL(file);
            });

            //add asset button
            $("#saveAssetBtn").on("click", function () {
                const ok = [
                    validateAssetCat(),
                    validateAssetName()
                ];
                if (!ok.every(Boolean)) return;
                const assets = getAssets();
                const file = $("#assetImage")[0].files[0];
                const doSave = (img) => {
                    const asset = {
                        id: generateAssetId(),
                        category: $("#assetCategory").val(),
                        name: $("#assetName").val().trim(),
                        status: "NA",
                        assignedTo: "—",
                        startDate: "—",
                        returnDate: "—",
                        image: img,
                        images: img ? [img] : []
                    };
                    const assets = getAssets();
                    assets.push(asset);
                    saveAssets(assets);
                    loadAssetTable(); $("#addAssetModal").modal("hide");
                    Swal.fire({
                        icon: "success",
                        title: "Added!",
                        text: `${asset.name} added successfully.`
                    });
                };
                if (file) {
                    const r = new FileReader();
                    r.onload = e => doSave(e.target.result);
                    r.readAsDataURL(file);
                } else doSave("");
            });
            $("#addAssetModal").on("hidden.bs.modal", function () {
                $("#assetCategory,#assetStatus").val("");
                $("#assetName").val("");
                $("#assetCategory,#assetStatus,#assetName").removeClass("is-valid is-invalid");
                $("#assetImage").val("");
                $(".custom-file-label").text("Choose image");
                $("#assetImagePreview").hide().attr("src", "");
                $(".error-msg").text("");
            });

            // Edit Asset button
            $("#assetTable").on("click", ".editAssetBtn", function () {
                const asset = getAssets().find(a => a.id === $(this).data("id"));
                if (!asset) return;
                $("#editAssetId").val(asset.id);
                $("#editAssetCategory").val(asset.category);
                $("#editAssetName").val(asset.name);
                $("#editAssetStatus").val(asset.status);
                const editPreviewWrap = $("#editAssetImagePreviewWrap");
                editPreviewWrap.empty();
                const imgs = Array.isArray(asset.images) ? asset.images : (asset.image ? [asset.image] : []);
                imgs.forEach((src, i) => {
                    if (!src) return;
                    editPreviewWrap.append(`<div class="position-relative" style="display:inline-block;">
                    <img src="${src}" style="width:70px;height:70px;object-fit:cover;border-radius:4px;border:1px solid #dee2e6;" />
                    <button type="button" class="btn btn-danger btn-sm position-absolute removeEditImgBtn" data-index="${i}" style="top:-6px;right:-6px;padding:1px 5px;font-size:0.65rem;line-height:1;">&times;</button>
                    </div>`);
                });
                $("#editAssetModal").modal("show");
            });

            // edit image
            $("#editAssetImages").on("change", function () {
                const files = Array.from(this.files);
                $(this).siblings(".custom-file-label").text(files.length > 0
                    ? `${files.length} image(s) selected`
                    : "Choose images");
                if (!files.length) return;
                const wrap = $("#editAssetImagePreviewWrap");
                files.forEach(file => {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        const total = wrap.find("img").length;
                        wrap.append(`<div class="position-relative" style="display:inline-block;"><img src="${e.target.result}" style="width:70px;height:70px;object-fit:cover;border-radius:4px;border:1px solid #dee2e6;" /><button type="button" class="btn btn-danger btn-sm position-absolute removeEditImgBtn" data-index="${total}" style="top:-6px;right:-6px;padding:1px 5px;font-size:0.65rem;line-height:1;">&times;</button></div>`);
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

            // $("#editAssetModal").on('show.bs.modal', function () {
            //     $("#empChoose").hide();
            // });

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

                const newStatus = $("#editAssetStatus").val();
                // currentWork
                // if (newStatus == "Assigned") {
                //     $('#empChoose').append($('$("#assetID")').clone()).show();
                // }


                if ((newStatus === "NA" || newStatus === "UM") && assets[idx].status === "A" && assets[idx].assignedTo !== "—") {
                    const hist = getHistory();
                    const todayStr = new Date().toLocaleDateString("en-GB");
                    hist.unshift({
                        type: "return",
                        msg: `${assets[idx].name} (${assets[idx].id}) returned from ${assets[idx].assignedTo} (${assets[idx].assignedEmpId || "—"}) on ${todayStr}`,
                        asset: assets[idx].name,
                        assetId: assets[idx].id,
                        employee: assets[idx].assignedTo,
                        empId: assets[idx].assignedEmpId || "—",
                        date: todayStr
                    });
                    saveHistory(hist);
                    assets[idx].assignedTo = "—";
                    assets[idx].assignedEmpId = "";
                    assets[idx].startDate = "—";
                    assets[idx].returnDate = "—";
                }

                const finalImages = [];
                $("#editAssetImagePreviewWrap img").each(function () {
                    finalImages.push($(this).attr("src"));
                });

                assets[idx].category = $("#editAssetCategory").val();
                assets[idx].name = $("#editAssetName").val().trim();
                assets[idx].status = newStatus;
                assets[idx].images = finalImages;
                assets[idx].image = finalImages.length > 0 ? finalImages[0] : "";

                try {
                    saveAssets(assets);
                } catch (e) {
                    Swal.fire({
                        icon: "warning",
                        title: "Storage Full!",
                        text: "Could not save changes. Remove some images to free up space."
                    });
                    return;
                }

                $("#editAssetModal").modal("hide");
                loadAssetTable();
                Swal.fire({
                    icon: "success",
                    title: "Updated!",
                    text: `${assets[idx].name} updated successfully.`
                });
            });
            //reset form on modal close
            $("#editAssetModal").on("hidden.bs.modal", function () {
                $("#editAssetId").val("");
                $("#editAssetCategory").val("");
                $("#editAssetName").val("");
                $("#editAssetStatus").val("A");
                $("#editAssetImages").val("");
                $(".custom-file-label").text("Choose images");
                $("#editAssetImagePreviewWrap").empty();
                $("#editAssetCategory,#editAssetName").removeClass("is-valid is-invalid");
                $(".error-msg").text("");
            });

            // delete asset
            $("#deleteAssetBtn").on("click", function () {
                const id = $("#editAssetId").val();
                const assets = getAssets();
                const asset = assets.find(a => a.id === id);
                if (!asset) return;
                if (asset.status === "A") {
                    Swal.fire({
                        icon: "warning",
                        title: "Cannot Delete",
                        text: `"${asset.name}" is currently assigned to ${asset.assignedTo}. Return before deleting.`
                    }); return;
                }
                Swal.fire({
                    title: "Delete Asset?",
                    html: `Delete <b>${asset.name}</b> (${asset.id})? This cannot be undone.`,
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#dc3545",
                    confirmButtonText: "Delete"
                })
                    .then(r => {
                        if (!r.isConfirmed) return;
                        saveAssets(assets.filter(a => a.id !== id));
                        const hist = getHistory();
                        const today = new Date().toLocaleDateString("en-GB");
                        hist.unshift({
                            type: "delete",
                            msg: `${asset.name} (${asset.id}) deleted from inventory on ${today}`,
                            asset: asset.name,
                            assetId: asset.id,
                            date: today
                        });
                        saveHistory(hist);
                        $("#editAssetModal").modal("hide");
                        loadAssetTable(); Swal.fire({
                            icon: "success",
                            title: "Deleted!",
                            text: `${asset.name} removed from inventory.`
                        });
                    });
            });

            // Asset History section -----------------------------------------------------------------------------------------
            function loadHistory() {
                const hist = getHistory();
                $("#historyBody").empty();
                if (!hist.length) {
                    $("#historyBody").html('<tr><td colspan="2" class="text-muted text-center py-3">No history yet. Assign or return an asset to see records here.</td></tr>');
                    return;
                }
                hist.forEach((item, i) => {
                    const badge = item.type === "return"
                        ? '<span class="badge badge-danger mr-2">Returned</span>'
                        : item.type === "delete"
                            ? '<span class="badge badge-dark mr-2">Deleted</span>'
                            : item.type === "scheduled"
                                ? '<span class="badge badge-info mr-2">Scheduled</span>'
                                : '<span class="badge badge-success mr-2">Assigned</span>';
                    $("#historyBody").append(`<tr><td class="text-center align-middle">${i + 1}</td><td class="text-left">${badge}${item.msg}</td></tr>`);
                });
            }

        });
    </script>
</body>
</html>
