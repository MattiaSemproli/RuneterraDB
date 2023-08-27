<!DOCTYPE HTML>

<html>

	<head>
		<title>RuneterraDB | Ranking</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		<link rel="stylesheet" href="../assets/css/centerBox.css" />
        <link rel="stylesheet" href="../assets/css/ranking.css" />
		<noscript>
			<link rel="stylesheet" href="../assets/css/noscript.css" />
		</noscript>
	</head>

	<body>

		<header id="header" class="alt">
			<nav>
				<a href="#menu">Menu</a>
			</nav>
		</header>

		<nav id="menu">
			<div class="inner">
				<h2>Menu</h2>
				<ul class="links">
					<li><a href="index.html">Home</a></li>
				</ul>
				<a href="#" class="close">Close</a>
			</div>
		</nav>

        <?php
            //php variables for db connection.h
            $dbservername = "localhost";
            $dbusername = "root";
            $dbpassword = "MpMs";
            $dbname = "runeterradb";
            /**
             * Open a connection.
             */
            $conn = new mysqli($dbservername, $dbusername, $dbpassword, $dbname);
            if (!$conn) {
                die("Connessione al database fallita: " . mysqli_connect_error());
            }

            $sql = "SELECT summoner.username, avg(numberOfTry) as average
                    FROM summoner 
                    JOIN game on summoner.username = game.username
                    group by summoner.username";
            
            $result = mysqli_query($conn, $sql);
            if (mysqli_num_rows($result) > 0) {
                echo "<table><tr><th>Username</th><th>Average of tries</th></tr>";
                // output data of each row
                while($row = mysqli_fetch_assoc($result)) {
                    echo "<tr><td>" . $row["username"]. "</td><td>" . $row["average"]. "</td></tr>";
                }
                echo "</table>";
                echo "<br>";
            } else {
                echo "0 results";
            }
            mysqli_close($conn);
        ?>

		<footer id="footer">
			<div class="inner">
				<ul class="copyright">
					<li>&copy; All rights reserved to Mattia Semproli & Martino Pagliarani</li>
				</ul>
			</div>
			</section>

			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrollex.min.js"></script>
			<script src="../assets/js/browser.min.js"></script>
			<script src="../assets/js/breakpoints.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>

	</body>

</html>