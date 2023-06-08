<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.Paths" %>
<!DOCTYPE html>
<html>
<head>
    <title>SUST</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        <script>
            function showErrorPopup() {
                alert("Username or password is incorrect. Please try again.");
            }
        </script>
        @font-face {
            font-family: 'CoolFont';
            src: url('Adlery-Swash-trial.ttf') format('truetype');
        }
        body {
            background-repeat: repeat !important;
            background-image: url("res/background.jpg") !important;
            background-size: cover;
        }
        /* Header */
        .header {
            display: flex;
            align-items: center;
            background-color: #333;
            color: white;
            padding: 20px;
        }
        .header img {
            height: 50px;
            margin-right: 10px;
        }
        /* "Hello, World!" text */
        .hello-world {
            height: 80vh;
            font-size: 20px;
            color: #333;
            text-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            padding: 50px;
            font-family: 'Courier New', monospace;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        /* Login box */
        .login-box {
            background: none;
            padding: 20px;
            margin: auto;
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .login-box:before {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            border-radius: 10px;
            border: 2px solid rgba(255, 255, 255, 0.7);
            z-index: -1;
            animation: glow 1.5s ease-in-out infinite;
        }
        .form-control{
            background: none;
        }
        @keyframes glow {
            0% {
                box-shadow: 0 0 5px 0 blue;
            }
            100% {
                box-shadow: 0 0 5px 0 blue;
            }
        }
    </style>

</head>
<body>
    <div class="header">
        <img src="logo.png" alt="Logo">
        <h1>SUST</h1>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 hello-world">
                <p>This webpage is made by Syed Sazid Hossain Rezvi(2019331054) and Fahim Zaman(2019331012)</p>
            </div>
            <div class="col-md-6 d-flex align-items-center">
                <div class="login-box">
                    <h2>Login</h2>
                    <% if (request.getParameter("error") != null) { %>
                        <p style="color:red">Invalid username or password!</p>
                    <% } %>
                    <form action="login" method="post">
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


<%--    <% if (request.getParameter("error") != null) { %>
        <script>
            alert("Username or password is incorrect. Please try again.")
        </script>
    <% } %>--%>

    <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="errorModalLabel">Login Error</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Username or password is incorrect. Please try again.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
