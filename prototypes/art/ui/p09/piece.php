<!DOCTYPE html>
<html lang="fr">
<?php include('partials/head.php') ?>
<body id="piece" class="bgw">
	<?php include('partials/topbar.php') ?>
	<?php include('partials/side.php') ?>
	<main>
		<section id="carrousel">
			<h2 class="sr-only">Carrousel</h2>
			<!--<input type="radio" name="i-s" id="i-s-1" hidden checked>
			<input type="radio" name="i-s" id="i-s-2" hidden>
			<input type="radio" name="i-s" id="i-s-3" hidden>
	
			<nav class="controls">
				<label for="i-s-1"></label>
				<label for="i-s-2"></label>
				<label for="i-s-3"></label>
			</nav>-->

			<div class="siema">
				<figure id=s-1>
					<img src="assets/svg/example.svg">
				</figure>
				<figure id=s-2>
					<img src="assets/svg/example2.svg">
				</figure>
				<figure id=s-3>
					<img src="assets/svg/example.svg">
				</figure>
			</div>
			
			<button class="prev"></button>
			<button class="next"></button>
			
			<a id="to-details" href ="#details">Plus d'information ⋁</a>

		</section>

		<header id="details">
			<p>Catégorie</p>
			<h1>Titre</h1>
			<ul class="secondary">
				<li>Detail</li>
				<li>Detail</li>
			</ul>
		</header>

		<div id="content">
			<!-- PLACE content here-->

			<h1>Processus</h1>
			
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Auctor pharetra ac montes, id sit in tortor. Hendrerit fames cras urna augue magna  purus viverra. Feugiat ornare nec nunc, elit. Purus molestie lectus convallis ac. Rhoncus, non vivamus facilisi cras dolor lacus velit.
			Nisl eu sed fames et interdum euismod mi etiam. Lacus sem mattis cras varius molestie tristique id turpis. Felis libero mattis purus vitae, velit non. Scelerisque bibendum imperdiet leo euismod eu. Dis nisl, adipiscing nibh nam aenean. Pretium sed nulla dictum dictumst a. Etiam quam condimentum dui id urna, sollicitudin dictumst ullamcorper elit. Varius turpis pellentesque sed nunc cursus in morbi neque, libero. Laoreet nulla volutpat in nisi, venenatis. Tellus, arcu, aliquet leo adipiscing nulla pretium tellus consequat. Egestas velit cras nunc, et nunc leo, rutrum ut. Orci, urna, luctus nulla amet urna. Placerat mauris faucibus parturient duis phasellus turpis in.</p>
			
			<figure>
				<img src="assets/svg/example.svg">
				<figcaption>Srus molestie lectus convallis ac. Facilisi cras dolor lacus velit</figcaption>
			</figure>

			<p>Rctus nulla amet urna. Placerat mauris faucibus parturient duis phasellus turpis in.
			Amet nibh amet, mi, vulputate nam mauris. Donec cursus mauris magna amet donec.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Auctor pharetra ac montes, id sit in tortor. Hendrerit fames cras urna augue magna  purus viverra. Feugiat ornare nec nunc1, elit. Purus molestie lectus convallis ac. Rhoncus, non vivamus facilisi cras dolor lacus velit.
			Nisl eu sed fames et interdum euismod mi etiam. Lacus sem mattis cras varius molestie tristique id turpis. Felis libero mattis purus vitae, velit non. Scelerisque bibendum imperdiet leo euismod eu. Dis nisl, adipiscing nibh nam aenean. Pretium sed nulla dictum dictumst a. Etiam quam condimentum dui id urna, sollicitudin dictumst ullamcorper elit. Varius turpis pellentesque sed nunc cursus in morbi neque, libero. Laoreet nulla volutpat in nisi, venenatis. Tellus, arcu, aliquet leo adipiscing nulla pretium tellus consequat. Egestas velit cras nunc, et nunc leo, rutrum ut. Orci, urna, luctus nulla amet urna. Placerat mauris faucibus parturient duis phasellus turpis in.
			Amet nibh amet, mi, vulputate nam mauris. Donec cursus mauris magna amet donec.</p>

		</div>

		<?php include('partials/related.php') ?>	
		
	</main>

	<?php include('partials/footer.php') ?>	

	<script src="static/js/siema.min.js" type="text/javascript"></script>
	<script src="assets/js/utilities.js" type="text/javascript"></script>
	<script src="assets/js/global.js" type="text/javascript"></script>
	<script src="assets/js/_piece.js" type="text/javascript"></script>
</body>
</html>

