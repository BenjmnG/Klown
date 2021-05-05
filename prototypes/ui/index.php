<!DOCTYPE html>
<html lang="fr">
<?php include('partials/head.php') ?>
<body id="index" class="bgk">
	<?php include('partials/topbar.php') ?>
	<main>
		<nav>
			<ul>
				<li><a href="/categorie.php">Catégorie A</a></li>
				<li><a href="/categorie.php">Catégorie B</a></li>
			</ul>
		</nav>
		<video id="video-blanc" mute autoplay loop >
			<source src="assets/video/blanc.webm" type="video/webm">
		</video>
		<video id="video-rouge" mute autoplay loop >
			<source src="assets/video/rouge.webm" type="video/webm">
		</video>
	</main>
	<?php include('partials/footer.php') ?>
	<script src="assets/js/utilities.js" type="text/javascript"></script>
	<script src="assets/js/global.js" type="text/javascript"></script>
</body>
</html>

