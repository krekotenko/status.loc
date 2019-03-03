<div class="sidebar">

	<h2><?php echo $random_name; ?></h2>

    <ul class="nav nav-tabs nav-stacked">
		<?php
		foreach($random_products as $prod){
			echo "<li><a href='".$prod['href']."'>".$prod['name']."</a></li>";
		}
		?>
    </ul>
</div>