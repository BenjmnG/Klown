<!DOCTYPE html>
<html lang="fr">
<?php include('partials/head.php') ?>
<body id="index" class="bgK ccW" data-bg="K" data-cc="W">
	<?php include('partials/topbar.php') ?>
	<main>
		<nav>
			<ul>
				<li>
					<a href="/categorie.php" data-bg="k" data-cc="w" title="Accéder à la catégorie Intériorisation">Intériorisation</a>
					<video muted autoplay loop aria-hidden>
						<source src="assets/video/blanc.webm" type="video/webm">
					</video>
				</li>
				<li>
					<a href="/categorie.php" data-bg="r" data-cc="k" title="Accéder à la catégorie Extériorisation">Extériorisation</a>
					<video muted autoplay loop aria-hidden>
						<source src="assets/video/rouge.webm" type="video/webm">
					</video>
				</li>
			</ul>
		</nav>
	</main>
	<?php include('partials/footer.php') ?>
	<script src="assets/js/utilities.js" type="text/javascript"></script>
	<script src="assets/js/global.js" type="text/javascript"></script>
	<script src="assets/js/_index.js" type="text/javascript"></script>
</body>
</html>

