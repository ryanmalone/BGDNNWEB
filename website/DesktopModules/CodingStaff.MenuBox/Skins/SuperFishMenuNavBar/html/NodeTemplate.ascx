<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NodeTemplate.ascx.cs" Inherits="CodingStaff.Modules.MenuBox.NodeTemplate" %>
<li class='<%=(IsActive ? "active deeper parent" : "") %> <%=(IsLast ? "" : "") %> <%=(IsFirst ? "" : "") %> <%= (HasChildren ? "deeper parent":"") %>'>
    <a href="<%= Node.NavigateURL %>"><%= Node.Text %></a>    
    <% if (HasChildren)
     {%>
         <ul class="">
             <asp:PlaceHolder runat="server" ID="phChildNodes"></asp:PlaceHolder>
         </ul>
   <%} %>
</li>
