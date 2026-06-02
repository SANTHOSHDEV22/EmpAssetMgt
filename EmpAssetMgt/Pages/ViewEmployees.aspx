<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewEmployee.aspx.cs" Inherits="EmpAssetMgt.Pages.ViewEmployee" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Employees</title>
    <link href="/EAM.css" rel="stylesheet" />
    <!--Bootstrap 4-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <!--Font Awesome 6-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <!--DataTables 2.3.8 Bootstrap4 Theme-->
    <link rel="stylesheet" href="https://cdn.datatables.net/2.3.8/css/dataTables.bootstrap4.min.css" />
    <!--DataTables Buttons Bootstrap4 Theme-->
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/3.2.6/css/buttons.bootstrap4.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid mt-4">
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
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </form>
    <!--jQuery 3.7.1-->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!--Bootstrap 4 JS Bundle-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!--SweetAlert2-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!--DataTables 2.3.8 Core-->
    <script src="https://cdn.datatables.net/2.3.8/js/dataTables.min.js"></script>
    <!--DataTables 2.3.8 Bootstrap4-->
    <script src="https://cdn.datatables.net/2.3.8/js/dataTables.bootstrap4.min.js"></script>
    <!--DataTables Buttons Core-->
    <script src="https://cdn.datatables.net/buttons/3.2.6/js/dataTables.buttons.min.js"></script>
    <!--DataTables Buttons Bootstrap4-->
    <script src="https://cdn.datatables.net/buttons/3.2.6/js/buttons.bootstrap4.min.js"></script>
    <!--JSZip for Excel export-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <!--DataTables Buttons HTML5-->
    <script src="https://cdn.datatables.net/buttons/3.2.6/js/buttons.html5.min.js"></script>
    <!--DataTables Buttons Print-->
    <script src="https://cdn.datatables.net/buttons/3.2.6/js/buttons.print.min.js"></script>
    <script>
        $(document).ready(function () {

            const getEmployees = () => {
                return JSON.parse(localStorage.getItem("employees") || "[]");
            };

            const saveEmployees = (data) => {
                localStorage.setItem("employees", JSON.stringify(data));
            };

            const childFormat = (d) => {
                const location = Array.isArray(d.location) ? d.location.join(", ") : (d.location || "—");
                return `
                    <table class="table table-sm table-bordered table-hover mb-0 child-table">
                        <thead class="thead-light text-center">
                            <tr>
                                <th>Location</th>
                                <th colspan="2">Position</th>
                                <th>Join Date</th>
                                <th>Relieve Date</th>
                                <th>Action</th>
                            </tr>
                            <tr>
                                <th></th>
                                <th>Department</th>
                                <th>Role</th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="text-center" data-id="${d.id}">
                                <td>${location}</td>
                                <td>${d.department || "—"}</td>
                                <td>${d.role || "—"}</td>
                                <td>${d.joindate || "—"}</td>
                                <td>${d.enddate || "—"}</td>
                                <td>
                                    <button type="button" class="btn btn-sm btn-outline-warning childEditBtn" data-id="${d.id}" title="Edit">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                `;
            };

            const loadTable = () => {
                const employees = getEmployees();

                if ($.fn.DataTable.isDataTable("#empTable")) {
                    $("#empTable").DataTable().destroy();
                    $("#empTable tbody").empty();
                }

                const table = $("#empTable").DataTable({
                    data: employees,
                    pageLength: 10,
                    ordering: true,
                    searching: true,
                    info: true,
                    autoWidth: false,
                    language: {
                        search: "",
                        searchPlaceholder: "Search employees...",
                        emptyTable: "No employees found",
                        zeroRecords: "No matching employees found",
                        info: "Showing _START_ to _END_ of _TOTAL_ employees",
                        lengthMenu: "Show _MENU_ employees"
                    },
                    layout: {
                        topStart: {
                            pageLength: { menu: [5, 10, 25, 50] }
                        },
                        topEnd: {
                            buttons: {
                                buttons: [
                                    {
                                        extend: "copy",
                                        text: '<i class="fa-solid fa-copy mr-1"></i> Copy',
                                        className: "btn btn-sm btn-outline-secondary"
                                    },
                                    {
                                        extend: "csv",
                                        text: '<i class="fa-solid fa-file-csv mr-1"></i> CSV',
                                        className: "btn btn-sm btn-outline-success"
                                    },
                                    {
                                        extend: "excel",
                                        text: '<i class="fa-solid fa-file-excel mr-1"></i> Excel',
                                        className: "btn btn-sm btn-outline-success"
                                    },
                                    {
                                        extend: "print",
                                        text: '<i class="fa-solid fa-print mr-1"></i> Print',
                                        className: "btn btn-sm btn-outline-info"
                                    }
                                ]
                            },
                            search: { placeholder: "Search employees..." }
                        },
                        bottomStart: "info",
                        bottomEnd: "paging"
                    },
                    columns: [
                        {
                            className: "dt-control",
                            orderable: false,
                            data: null,
                            defaultContent: ""
                        },
                        {
                            data: "fullname",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "gender",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "dob",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "email",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "contact",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            render: $.fn.dataTable.render.text()
                        },
                        {
                            data: "status",
                            className: "text-center align-middle",
                            defaultContent: "—",
                            render: (data) => {
                                const cls = data === "Active" ? "status-active" : "status-inactive";
                                const icon = data === "Active"
                                    ? '<i class="fa-solid fa-circle-check mr-1"></i>'
                                    : '<i class="fa-solid fa-circle-xmark mr-1"></i>';
                                return `<span class="${cls}">${icon}${data || "—"}</span>`;
                            }
                        },
                        {
                            data: null,
                            orderable: false,
                            searchable: false,
                            className: "text-center align-middle",
                            render: (data) => `
                                <button type="button" class="btn btn-sm btn-outline-primary parentEditBtn" data-id="${data.id}" title="Edit">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
                            `
                        }
                    ]
                });

                table.on("click", "tbody td.dt-control", function (e) {
                    const tr = e.target.closest("tr");
                    const row = table.row(tr);
                    if (row.child.isShown()) {
                        row.child.hide();
                        $(tr).removeClass("shown");
                    } else {
                        row.child(childFormat(row.data())).show();
                        $(tr).addClass("shown");
                    }
                });
            };

            loadTable();
        });
    </script>
</body>
</html>