<!DOCTYPE html>
<html lang="fr">
<?php include('partials/head.php') ?>
<body id="index" class="pulse" data-cc="r" data-bg="w">
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
					<a href="/categorie.php" data-bg="w" data-cc="r" title="Accéder à la catégorie Transformation">Transformation</a>
					<div class="videoWrapper">
						<!--<iframe src="https://player.vimeo.com/video/170165536?autoplay=1&color=ffffff&title=0&byline=0&portrait=0&autoplay=1&background=1&muted=1" style="position:absolute;top:0;left:0;width:100%;height:100%;" frameborder="0" allow="autoplay; fullscreen; picture-in-picture; muted" allowfullscreen></iframe>
					</div>-->
				</li>
			</ul>
		</nav>
	</main>
	<?php @include("partials/strobos.php")?>
	<script src="assets/js/utilities.js" type="text/javascript"></script>
	<script src="assets/js/global.js" type="text/javascript"></script>
	<script src="assets/js/_index.js" type="text/javascript"></script>
	<script src="https://player.vimeo.com/api/player.js"></script>
</body>
</html>

