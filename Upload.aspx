<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="Property_Hub.Upload" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload Property</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data" class="container mt-5">
        <h2 class="mb-4">Upload Property</h2>
        <div class="mb-3">
            <asp:Label ID="lblTitle" runat="server" Text="Title" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter property title"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="txtTitle"
                ErrorMessage="Title is required." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <asp:Label ID="lblLocation" runat="server" Text="Location" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Enter property location"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocation"
                ErrorMessage="Location is required." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <asp:Label ID="lblPrice" runat="server" Text="Price" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter property price"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice"
                ErrorMessage="Price is required." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <asp:Label ID="lblDescription" runat="server" Text="Description" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Enter property description"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                ErrorMessage="Description is required." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="mb-3">
            <asp:Label ID="lblImage" runat="server" Text="Image" CssClass="form-label"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvImage" runat="server" ControlToValidate="FileUpload1"
                ErrorMessage="Image is required." Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>
        <div class="d-grid gap-2">
            <asp:Button ID="UploadButton" runat="server" Text="Upload" CssClass="btn btn-primary btn-lg" OnClick="UploadFile" />
        </div>
        <!-- Message Label -->
        <div class="mt-3">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-center d-block"></asp:Label>
        </div>
    </form>
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
