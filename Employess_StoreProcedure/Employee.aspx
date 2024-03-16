<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="Employess_StoreProcedure.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 70px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center">  
    <tr>  
        <td colspan="3" align="center" class="auto-style1">  
            <strong style="background-color: Yellow;color: Blue; text-align: center; font-style: oblique">Employess Details </strong>  
        </td>  
    </tr>  
    <tr>  
                            
        <td style="text-align:center">  
            <asp:TextBox runat="server" ID="txtFirstName" placeholder="Enter First Name.." ValidationGroup="add" CssClass="validate[required]"></asp:TextBox>  
        </td>  
    </tr>  
    <tr>  
          
        <td style="text-align:center">  
            <asp:TextBox runat="server" ID="txtLastName" placeholder="Enter Last Name.." ValidationGroup="add" CssClass="validate[required]"></asp:TextBox>  
        </td>  
    </tr>  
    <tr>  
         
        <td style="text-align:center">  
            <asp:TextBox runat="server" placeholder="Enter Phone Number.." ID="txtPhoneNumber" ValidationGroup="add" CssClass="validate[required,custom[phone]" ></asp:TextBox>  
        </td>  
        <td></td>  
    </tr>  
    <tr>  
         
        <td style="text-align:center">  
            <asp:TextBox runat="server" ID="txtEmailAddress" placeholder="Enter Email Address.." ValidationGroup="add" CssClass="validate[required,custom[email]"></asp:TextBox>  
        </td>  
    </tr>  
    <tr>  
        
        <td style="text-align:center">  
            <asp:TextBox runat="server" ID="txtSalary" placeholder="Enter Salary.." ValidationGroup="add" CssClass="validate[required,custom[number]"></asp:TextBox>  
        </td>  
    </tr>  
    <tr>  
        <td colspan="3" align="center">  
            <asp:Button runat="server" ID="btnAddEmployee" Text="Add" OnClick="btnAddEmployee_Click" class="button button4" ValidationGroup="add"/>  
            <asp:Button runat="server" ID="btnUpdate" Text="Update" class="button button4" OnClick="btnUpdate_Click"/>  
            <asp:Button runat="server" ID="btnReset" Text="Reset"  class="button button4" OnClick="btnReset_Click"/>  
        </td>  
    </tr>  
    <tr>  
        <td colspan="3" align="center" class="auto-style1">  
            <br />  
            <asp:Label runat="server" ID="lblMessage"></asp:Label>  
            <br />  
            <br />  
  
        </td>  
    </tr>
                <tr>  
    <td colspan="3">  
        <asp:GridView ID="grvEmployee" runat="server" AllowPaging="true" CellPadding="2" EnableModelValidation="True"  
                    ForeColor="red" GridLines="Both" ItemStyle-HorizontalAlign="center" EmptyDataText="There Is No Records In Database!" AutoGenerateColumns="false" Width="1100px"  
            HeaderStyle-ForeColor="blue"   OnPageIndexChanging="grvEmployee_PageIndexChanging" OnRowCancelingEdit="grvEmployee_RowCancelingEdit" OnRowDeleting="grvEmployee_RowDeleting" OnRowEditing="grvEmployee_RowEditing">  
            <HeaderStyle CssClass="DataGridFixedHeader" />  
            <RowStyle CssClass="grid_item" />  
            <AlternatingRowStyle CssClass="grid_alternate" />  
            <FooterStyle CssClass="DataGridFixedHeader" />  
            <Columns>  
                <asp:TemplateField HeaderText="EmpId">  
                     <HeaderStyle HorizontalAlign="Left" />  
                    <ItemStyle HorizontalAlign="Left" />  
                    <ItemTemplate>  
                        <asp:Label runat="server" ID="lblEmpId" Text='<%#Eval("id") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="FirstName">  
                     <HeaderStyle HorizontalAlign="Left" />  
                    <ItemStyle HorizontalAlign="Left" />  
                    <ItemTemplate>  
                        <asp:Label runat="server" ID="lblFirstName" Text='<%#Eval("FirstName") %>'></asp:Label>  
                    </ItemTemplate>  
                      
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="LastName">  
                     <HeaderStyle HorizontalAlign="Left" />  
                    <ItemStyle HorizontalAlign="Left" />  
                    <ItemTemplate>  
                        <asp:Label runat="server" ID="lblLastName" Text='<%#Eval("LastName") %>'></asp:Label>  
                    </ItemTemplate>  
                      
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Phone No.">  
                     <HeaderStyle HorizontalAlign="Left" />  
                    <ItemStyle HorizontalAlign="Left" />  
                    <ItemTemplate>  
                        <asp:Label runat="server" ID="lblPhoneNumber" Text='<%#Eval("PhoneNumber") %>'></asp:Label>  
                    </ItemTemplate>  
                      
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Email">  
                     <HeaderStyle HorizontalAlign="Left" />  
                    <ItemStyle HorizontalAlign="Left" />  
                    <ItemTemplate>  
                        <asp:Label runat="server" ID="lblEmailAddress" Text='<%#Eval("EmailAddress") %>'></asp:Label>  
                    </ItemTemplate>  
                      
                </asp:TemplateField>  
  
                <asp:TemplateField HeaderText="Salary">  
                     <HeaderStyle HorizontalAlign="Left" />  
                    <ItemStyle HorizontalAlign="Left" />  
                    <ItemTemplate>  
                        <asp:Label runat="server" ID="lblSalary" Text='<%#Eval("Salary") %>'></asp:Label>  
                    </ItemTemplate>  
                    
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Update">  
                     <HeaderStyle HorizontalAlign="Left" />  
                    <ItemStyle HorizontalAlign="Left" />  
                    <ItemTemplate>  
                        <asp:LinkButton runat="server" ID="btnEdit" Text="Edit" CommandName="Edit" ToolTip="Click here to Edit the record" />                                                                                         
                    </ItemTemplate>  
                     
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Delete">  
                    <HeaderStyle HorizontalAlign="Left" />  
                    <ItemStyle HorizontalAlign="Left" />  
                    <ItemTemplate>                                                                          
                            <asp:LinkButton runat="server" ID="btnDelete" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Are You Sure You want to Delete the Record?');" ToolTip="Click here to Delete the record" />  
                        </span>  
                    </ItemTemplate>                                         
                </asp:TemplateField>  
            </Columns>  
  
        </asp:GridView>  
    </td>  
</tr>
    </table>            
        </div>
    </form>
</body>
</html>
