<!DOCTYPE html>
<html lang="fr">
<?php include('partials/head.php') ?>
<body id="piece" class="bgw">
	<?php include('partials/topbar.php') ?>
	<?php include('partials/side.php') ?>
	<main>
		<section id="carrousel" class="">
			<h2 class="sr-only">Carrousel</h2>

			<div class="siema">
				<figure id=s-1>
					<img src="assets/svg/example.svg" loading="lazy">
				</figure>
				<figure id=s-2>
					<img src="assets/svg/example2.svg" loading="lazy">
				</figure>
				<figure id=s-3>
					<img src="assets/svg/example.svg" loading="lazy">
				</figure>
			</div>
			
			<button class="prev"></button>
			<button class="next"></button>			

			<!--<video>
				<source src="assets/video/example.mp4" type="video/mp4" autoplay>
			</video>-->
			
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

