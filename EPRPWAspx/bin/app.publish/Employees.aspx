<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Employees.aspx.vb" Inherits="EPRPWAspx.Employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- column -->
    <div class="col-12">
        <div class="card">
            <div class="card-body">

                <div class="form-group">

                    <div class="row">
                        <div class="col-xs-12 col-sm-2">
                            <h4 class="card-title">Employees</h4>
                        </div>

                    </div>
                </div>

                <div class="table-responsive">
                    <asp:GridView ID="GrdEmployees" runat="server" OnPageIndexChanging="GrdEmployees_PageIndexChanging" PagerSettings-Mode="Numeric" CssClass="table" AllowPaging="true"
                        PageSize="5" EmptyDataText="No Employee record found" AutoGenerateColumns="false" GridLines="None">
                        <Columns>

                            <asp:TemplateField HeaderText="Id">
                                <ItemTemplate>
                                    <asp:Literal ID="ltEmpId" runat="server" Text='<%# Eval("EmployeeID")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Literal ID="ltName" runat="server" Text='<%# Eval("EmpName")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Job Title">
                                <ItemTemplate>
                                    <asp:Literal ID="ltTitle" runat="server" Text='<%# Eval("JobTitle")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Department">
                                <ItemTemplate>
                                    <asp:Literal ID="ltDepartment" runat="server" Text='<%# Eval("Department")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Review Period">
                                <ItemTemplate>
                                    <asp:Literal ID="ltReview" runat="server" Text='<%# Eval("ReviewPeriod")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Manager">
                                <ItemTemplate>
                                    <asp:Literal ID="ltManager" runat="server" Text='<%# Eval("Manager")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="OverAll Rating">
                                <ItemTemplate>
                                    <asp:Literal ID="ltOverAll" runat="server" Text='<%# Eval("OverAllRating")%>'></asp:Literal>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <a href="Rating.aspx?EmpId=<%#Eval("EmployeeID") %>">review</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
    </div>
    <script>
        localStorage.setItem('user_name', 'Rohit');  
    </script>
</asp:Content>
