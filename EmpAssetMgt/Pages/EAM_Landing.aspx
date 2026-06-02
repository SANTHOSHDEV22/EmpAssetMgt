<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EAM_Landing.aspx.cs" Inherits="EmpAssetMgt.Pages.EAM_Landing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EAM</title>
    <link href="/EAM.css" rel="stylesheet" />
    <!---Bootstrap4--->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <!---Fontawesome--->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />

</head>
<body>
    <form id="form1" runat="server">
        <header>
            <nav class="navbar navbar-light bg-dark">
                <a href="#" class="navbar-brand h2 text-light">EAM</a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav" aria-controls="sidenav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
            <div id="sidenav" class="collapse navbar-collapse bg-dark">
                <div class="navbar-nav bg-dark">
                    <ul class="navbar-nav mr-auto ml-4">
                        <li class="nav-item active pb-3 pt-3">
                            <a href="#" id="dashboardId" class="nav-link text-light"><i class="fa-solid fa-arrow-trend-up mr-2"></i>Dashboard</a>
                        </li>
                        <li class="nav-item dropdown pb-3">
                            <a href="#" class="nav-link sideNavToggle text-light" type="button">
                                <i class="fa-solid fa-user fa-sm mr-2"></i>Employees
        <i class="fa-solid fa-chevron-down fa-xs ml-2 toggleIcon"></i>
                            </a>
                            <div class="dropdown-menu">
                                <a href="#" id="addEmployeeId" class="dropdown-item nav-link">
                                    <i class="fa-solid fa-plus fa-xs ml-4 mr-2"></i>Add
                                </a>
                                <a href="#" class="dropdown-item nav-link">
                                    <i class="fa-solid fa-eye fa-xs ml-4 mr-2"></i>View
                                </a>
                            </div>
                        </li>

                        <li class="nav-item dropdown pb-3">
                            <a href="#" class="nav-link sideNavToggle text-light" type="button">
                                <i class="fa-solid fa-suitcase fa-sm mr-2"></i>Assets
        <i class="fa-solid fa-chevron-down fa-xs ml-2 toggleIcon"></i>
                            </a>
                            <div class="dropdown-menu">
                                <a href="#" class="dropdown-item nav-link">
                                    <i class="fa-solid fa-user fa-xs ml-4 mr-2"></i>Assign
                                </a>
                                <a href="#" class="dropdown-item nav-link">
                                    <i class="fa-solid fa-suitcase fa-xs ml-4 mr-2"></i>Inventory
                                </a>
                                <a href="#" class="dropdown-item nav-link">
                                    <i class="fa-solid fa-clipboard fa-xs ml-4 mr-2"></i>History
                                </a>
                            </div>
                        </li>
                        <li class="nav-item pb-3">
                            <a href="#" class="nav-link text-light"><i class="fa-solid fa-file fa-sm mr-2"></i>Reports</a>
                        </li>
                        <li class="nav-item pb-3">
                            <a href="#" class="nav-link text-light"><i class="fa-solid fa-gear fa-sm mr-2"></i>Settings</a>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <div class="container-fluid mt-4" id="pageScreen">
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
            let dashboard = $("#dashboardId");
            let addEmp = $("#addEmployeeId");
            let viewEmp = $("#viewEmployeeId");
            let page = `
                <div class="embed-responsive embed-responsive-21by9 multiPage">
                    <iframe id="currentPage" class="embed-responsive-item" src="" allowfullscreen="allowfullscreen"></iframe>
                </div>
            `;
            let pageLoc = $("#pageScreen");

            $(".sideNavToggle").on("click", function (e) {
                e.preventDefault();
                let parentItem = $(this).closest(".nav-item");
                let menu = parentItem.find(".dropdown-menu");
                let isOpen = menu.hasClass("open");
                $(".dropdown-menu").removeClass("open");
                $(".sideNavToggle").removeClass("active");
                if (!isOpen) {
                    menu.addClass("open");
                    $(this).addClass("active");
                }
            });

            dashboard.on("click", () => {
                dashboard.removeClass("text-light").addClass("text-muted");
                pageLoc.html(page);
                $(".multiPage #currentPage").attr("src", "Dashboard.aspx");
                $(".navbar-collapse").collapse("hide");
            });

            addEmp.on("click", () => {
                addEmp.removeClass("text-light").addClass("text-muted");
                pageLoc.html(page);
                $(".multiPage #currentPage").attr("src", "AddUser.aspx");
                $(".navbar-collapse").collapse("hide");
            });

            viewEmp.on("click", () => {
                viewEmp.removeClass("text-light").addClass("text-muted");
                pageLoc.html(page);
                $(".multiPage #currentPage").attr("src", "ViewEmployee.aspx");
                $(".navbar-collapse").collapse("hide");
            });
        });
    </script>
</body>
</html>
