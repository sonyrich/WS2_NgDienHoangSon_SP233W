<%-- 
    Document   : search
    Created on : Apr 15, 2023, 9:12:58 AM
    Author     : se140372
--%>

<%@page import="java.util.List"%>
<%@page import="sonndh.registration.RegistrationDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search JSP Page</title>
    </head>
    <body>
        <h1>Search Page</h1>
        <form action="MainController">
            Search Value
            <input type="text" name="txtSearchValue" value="" /><br/>
            <input type="submit" value="Search" name="btAction" />
        </form>

        <%
            String searchValue = request.getParameter("txtSearchValue");
            if (searchValue != null) {
                List<RegistrationDTO> result
                        = (List<RegistrationDTO>) request.getAttribute("SEARCHRESULT");
                if (result != null) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Lastname</th>
                    <th>Role</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 0;
                    for (RegistrationDTO dto : result) {
                %>
                <tr>
                    <td>
                        <%= ++count%>
                    </td>
                    <td>
                        <%= dto.getUsername()%>
                    </td>
                    <td>
                        <%= dto.getPassword()%>
                    </td>
                    <td>
                        <%= dto.getLastname()%>
                    </td>
                    <td>
                        <%= dto.isRole()%>
                    </td>
                </tr>
                <%
                    }
                %>

            </tbody>
        </table>

        <%
        } else {//else if
        %>
        <h2>No Record is matched</h2>
        <%
                }
            }//end search value

        %>
    </body>
</html>
