<!-- Side Navigation -->
<input id="toggle-sideNav" type="checkbox" hidden>
<nav id="sideNav" >

	<label for="toggle-sideNav">
		Pièces
	</label>

	<!-- Sort Options-->
	<!-- Sort Options Can be remove on Piece Pages -->
	<input id="medium-reset" type="radio" name="sort-by-medium" hidden checked>
	<input id="medium-1" type="radio" name="sort-by-medium" hidden>
	<input id="medium-2" type="radio" name="sort-by-medium" hidden>
	<input id="medium-3" type="radio" name="sort-by-medium" hidden>
	<input id="medium-4" type="radio" name="sort-by-medium" hidden>
	<input id="medium-5" type="radio" name="sort-by-medium" hidden>
	<ul  class="sort-options">
		<li data-for="medium-reset">
			<label for="medium-reset">
				<svg width="18" height="18" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    			<use href="#i-reset" />
    		</svg>
				<svg width="18" height="18" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    			<use href="#i-filter" />
    		</svg>
			</label>
		</li>
		<li data-for="medium-1"><label for="medium-1">Video</label></li>
		<li data-for="medium-2"><label for="medium-2">Peinture</label></li>
		<li data-for="medium-3"><label for="medium-3">Photo</label></li>
	</ul>	
	<!-- First Cat Container-->
	<ul class="cat-container noJS">
		<li class="cat" data-categorie="1" data-bg="w" data-cc="k">
			<input id="toggle-c1" name="toggle-c" type="radio" hidden checked>
			<label for="toggle-c1">Intériorisation</label>
			<ul class="item-container">
				<?php
					$img = array( 2, 3, 4, 5);
					$medium = array( 1, 2, 3);
					for ($i = 0; $i < 20; $i++){
						shuffle($img); shuffle($medium);
						echo '
						<li class="item" data-medium="'.$medium[0].'">
							<!-- Allow href if noJs, else REPLACE main content with transition -->
							<a href="/piece.php" data-target="/piece.php">
								<img class="cover" src="assets/svg/example'.$img[0].'.svg" style="filter: sepia(1);">
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
					$medium = array( 1, 2, 3);
					for ($i = 0; $i < 6; $i++){
						shuffle($img); shuffle($medium);
						echo '
						<li class="item" data-medium="'.$medium[0].'">
							<!-- Allow href if noJs, else REPLACE main content with transition -->
							<a href="/piece.php" data-target="/piece.php">
								<img class="cover" src="assets/svg/example'.$img[0].'.svg" style="filter: sepia(1);">
							</a>
						</li>';
					}
				?>
			</ul>
		</li>
		<li class="cat" data-categorie="3"  data-bg="k" data-cc="w">
			<input id="toggle-c3" name="toggle-c" type="radio" hidden>
			<label for="toggle-c3">Transformation</label>
			<ul class="item-container">
				<?php
					$img = array( 2, 3, 4, 5);
					$medium = array( 1, 2, 3);
					for ($i = 0; $i < 12; $i++){
						shuffle($img); shuffle($medium);
						echo '
						<li class="item" data-medium="'.$medium[0].'">
							<!-- Allow href if noJs, else REPLACE main content with transition -->
							<a href="/piece.php" data-target="/piece.php">
								<img class="cover" src="assets/svg/example'.$img[0].'.svg" style="filter: sepia(1);">
							</a>
						</li>';
					}
				?>
			</ul>
		</li>
	</ul>

	<!-- Following Can be remove on Piece Pages -->
	<button id="scrollTrigger">
		<svg viewBox="0 0 60 60"><use href="#arrow-R"></svg>
		</button>
</nav>