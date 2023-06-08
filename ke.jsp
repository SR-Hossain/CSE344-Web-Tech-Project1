<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Flip Card</title>
    <style>
        .flip-card {
            width: 100%;
            perspective: 1000px;
            cursor: pointer;
        }

        .flip-card-inner {
            width: 100%;
            height: 100vh;
            text-align: center;
            transition: transform 0.6s;
            transform-style: preserve-3d;
        }

        .flip-card.is-flipped .flip-card-inner {
            transform: rotateY(180deg);
        }

        .flip-card-front, .flip-card-back {
            width: 100%;
            height: 100vh;
            position: absolute;
            backface-visibility: hidden;
        }

        .flip-card-front {
            background-color: #bbb;
            color: black;
        }

        .flip-card-back {
            background-color: dodgerblue;
            color: white;
            transform: rotateY(180deg);
        }

        .section {
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            text-align: center;
        }

        .add-student-section {
            background-image:
                linear-gradient(to bottom, rgba(245, 246, 252, 0.52), black),
                url('res/student3.jpg');
            width: 100%;
            height: 100vh;
            object-fit: cover;
            background-size: cover;
            color: white;
            padding: 20px;
        }

        .assign-course-section {
            background-image:
                linear-gradient(to bottom, rgba(245, 246, 252, 0.52), black),
                url('res/teacher.jpg');
            width: 100%;
            height: 100vh;
            background-size: cover;
            color: white;
            padding: 20px;
        }

        .section-content {
            margin-bottom: 50px;
        }

        .section-content h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .section-content .button {
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background: #4e4376;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .section-content .button:hover {
            background: #2b5876;
        }

        .btn {
            min-width: 200px;
            border: none;
            border-radius: 10px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-size: 300% 100%;
            background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);
            box-shadow: 0 4px 15px 0 rgba(45, 54, 65, 0.75);
            cursor: pointer;
        }

        .btn:hover {
            background-position: 100% 0;
            transition: all .4s ease-in-out;
        }

        .btn:focus {
            outline: none;
        }
    </style>
</head>
<body>
    <div class="flip-card" onclick="flipCard(this)">
        <div class="flip-card-inner">
            <div class="flip-card-front">
                <div class="section add-student-section">
                    <div class="container">
                        <div class="section-content">
                            <h2>Add New Student</h2>
                            <p>Click to add a new student.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flip-card-back">
                <div class="section add-student-section">
                    <div class="container">
                        <div class="section-content">
                            <h1>Add New Student</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="flip-card" onclick="flipCard(this)">
        <div class="flip-card-inner">
            <div class="flip-card-front">
                <div class="section assign-course-section">
                    <div class="container">
                        <div class="section-content">
                            <h2>Assign Course</h2>
                            <p>Click the button below to manage teachers.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="flip-card-back">
                <div class="section assign-course-section">
                    <div class="container">
                        <div class="section-content">
                            <h1>Assign Course</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function flipCard(card) {
            card.classList.toggle('is-flipped');
        }
    </script>
</body>
</html>
