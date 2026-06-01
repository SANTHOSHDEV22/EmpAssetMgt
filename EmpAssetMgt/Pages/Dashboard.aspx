<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EmpAssetMgt.Pages.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <!---Bootstrap4--->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <!---Fontawesome--->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="shadow p-3 mb-5 bg-white rounded">
                <h3><i class="fa-solid fa-arrow-trend-up mr-2"></i>Dashboard</h3>
            </div>
        </div>
        <div class="container-fluid">
            <table class="table table-bordered table-stripped table-hover">
                <thead class="thead-dark text-center">
                    <tr>
                        <th>Total Employees</th>
                        <th>Total Assets</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <tr>
                        <td style="font-size:5rem;">20</td>
                        <td style="font-size:5rem;">20</td>
                    </tr>
                </tbody>
            </table>
            <table class="table table-bordered table-stripped table-hover mt-3">
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
                        <td style="font-size:5rem;">10</td>
                        <td style="font-size:5rem;">10</td>
                        <td style="font-size:5rem;">10</td>
                        <td style="font-size:5rem;">10</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>
    <!-- 1. jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- 2. Bootstrap 4 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- 3. SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>
