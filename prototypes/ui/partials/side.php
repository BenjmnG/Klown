<!-- Side Navigation -->
<input id="toggle-sideNav" type="checkbox" hidden>
<nav id="sideNav" >

	<label for="toggle-sideNav">
		Pièces
	</label>

	<!-- Sort Options-->
	<!-- Sort Options Can be remove on Piece Pages -->
	<input id="c1-sort-0" type="radio" name="c1-sort-medium" hidden checked>
	<input id="c1-sort-1" type="radio" name="c1-sort-medium" hidden>
	<input id="c1-sort-2" type="radio" name="c1-sort-medium" hidden>
	<input id="c1-sort-3" type="radio" name="c1-sort-medium" hidden>
	<div class="sort-options">
		<p>Medium&nbsp;</p>
		<ul>
			<li data-for="sort-0"><label for="c1-sort-0">⦰</label></li>
			<li data-for="sort-1"><label for="c1-sort-1">Video</label></li>
			<li data-for="sort-2"><label for="c1-sort-2">Peinture</label></li>
			<li data-for="sort-3"><label for="c1-sort-3">Photo</label></li>
		</ul>
	</div>
	
	<!-- First Cat Container-->
	<ul class="cat-container noJS">
		<li class="cat" data-categorie="1" data-bg="w" data-cc="k">
			<input id="toggle-c1" name="toggle-c" type="radio" hidden checked>
			<label for="toggle-c1">Intériorisation</label>
			<ul class="item-container">
				<?php
					$img = array( 2, 3, 4, 5);
					$medium = array( video, Peinture, Photo);
					for ($i = 0; $i < 20; $i++){
						shuffle($img); shuffle($medium);
						echo '
						<li class="item" data-medium="'.$medium[0].'">
							<!-- Allow href if noJs, else REPLACE main content with transition -->
							<a href="/piece.php" data-target="/piece.php">
								<img class="cover" src="assets/svg/example'.$img[0].'.svg">
							</a>
						</li>';
					}
				?>
			</ul>
		</li>
		<li class="cat" data-categorie="2"  data-bg="w" data-cc="k">
			<input id="toggle-c2" name="toggle-c" type="radio" hidden>
			<label for="toggle-c2">Extériorisation</label>
			<ul class="item-container">
				<?php
					$img = array( 2, 3, 4, 5);
					for ($i = 0; $i < 6; $i++){
						shuffle($img);
						echo '
						<li class="item">
							<!-- Allow href if noJs, else REPLACE main content with transition -->
							<a href="/piece.php" data-target="/piece.php">
								<img class="cover" src="assets/svg/example'.$img[0].'.svg">
							</a>
						</li>';
					}
				?>
			</ul>
		</li>
	</ul>

	<!-- Following Can be remove on Piece Pages -->
	<button id="scrollContainer">
		<svg viewBox="0 0 60 60"><use href="#arrow-R"></svg>
		</button>
</nav>