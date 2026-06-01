<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="assetAssign.aspx.cs" Inherits="EmpAssetMgt.Pages.assetAssign" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asset Assign</title>
    <!---Bootstrap4--->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <!---Fontawesome--->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="shadow p-3 mb-5 bg-white rounded d-flex algin-items-center justify-content-between">
                <span class="mt-2"><i class="fa-solid fa-user mr-2"></i>Asset Assign</span>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addEmpmodal">
                    <i class="fa-solid fa-plus mr-2"></i>Assign
                </button>
            </div>
            <div class="container-fluid">
                <table class="table table-bordered table-stripped table-hover">
                    <thead class="thead-dark text-center algin-items-center">
                        <tr>
                            <th rowspan="2">ID</th>
                            <th rowspan="2">Category</th>
                            <th rowspan="2">Asset Name</th>
                            <th rowspan="2">Status</th>
                            <th rowspan="2">Assigned To</th>
                            <th colspan="2">Assigned</th>
                        </tr>
                        <tr>
                            <th>Start Date</th>
                            <th>Return Date</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                    </tbody>
                </table>
            </div>
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
