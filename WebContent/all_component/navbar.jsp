<%@ page import="com.User.UserDetails" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><i class="fa-solid fa-graduation-cap"></i> DigiNotesGuru</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="home.jsp"><i
                                class="fa-solid fa-house"></i> Home</a></li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="addNotes.jsp"><i
                                class="fa-solid fa-plus-circle"></i> Add Notes</a></li>
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="showNotes.jsp"><i
                                class="fa-solid fa-book"></i> Show Notes</a></li>
            </ul>

            <%-- Checking if user is logged in --%>
            <% UserDetails user = (UserDetails) session.getAttribute("UserD"); %>
            <% if (user != null) { %>
                <a href="#" class="btn btn-outline-black my-2 my-sm-0 mr-2" data-bs-toggle="modal" data-bs-target="#exampleModal"
                   type="button"><i class="fa-solid fa-user-graduate"></i> <%= user.getName() %></a>
                <a href="LogoutServlet" class="btn btn-outline-black my-2 my-sm-0 mr-2" type="submit"><i
                                class="fa-solid fa-user-plus"></i> Logout</a>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">User Profile</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="container text-center">
                                    <table class="table">
                                        <tbody>
                                         <tr>
                                                <th>ID</th>
                                                <td><%=user.getId()%></td>
                                            </tr>
                                            <tr>
                                                <th>Full Name</th>
                                                <td><%= user.getName() %></td>
                                            </tr>
                                            <tr>
                                                <th>Email</th>
                                                <td><%= user.getEmail() %></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div>
                                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <% } else { %>
                <a href="login.jsp" class="btn btn-outline-black my-2 my-sm-0 mr-2" type="button"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                <a href="register.jsp" class="btn btn-outline-black my-2 my-sm-0 mr-2" type="button"><i class="fa-solid fa-user-plus"></i> Register</a>
            <% } %>
        </div>
    </div>
</nav>
