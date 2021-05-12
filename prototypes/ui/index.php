<!DOCTYPE html>
<html lang="fr">
<?php include('partials/head.php') ?>
<body id="index" class="" data-cc="r" data-bg="w">
	<?php include('partials/topbar.php') ?>
	<main>
		<nav>
			<ul>
				<li>
					<a href="/categorie.php" data-bg="k" data-cc="w" title="Accéder à la catégorie Intériorisation">Intériorisation</a>
					<div class="videoWrapper">
						<video muted autoplay loop aria-hidden>
							<source src="static/video/blanc.mp4" type="video/mp4">
						</video>
					</div>
					<div class="over" aria-hidden></div>
				</li>
				<li>
					<a href="/categorie.php" data-bg="r" data-cc="w" title="Accéder à la catégorie Extériorisation">Extériorisation</a>
					<div class="videoWrapper">
						<video muted autoplay loop aria-hidden>
							<source src="static/video/rouge.mp4" type="video/mp4">
						</video>
					</div>
				<li>
					<a href="/categorie.php" data-bg="w" data-cc="r" title="Accéder à la catégorie Processus">Processus</a>
					<div class="videoWrapper"></div>
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

