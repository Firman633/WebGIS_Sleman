<!DOCTYPE html>
<html lang="en">
	<?php include 'head.php'?> <!-- memanggil file head.php -->
	<script type="text/css">
		#map{
			width:100%;
			height:500px;
	}
	</script>
	<body class="nav-md">
	<div class="container body">
	  <div class="main_container">
	  	<?php include 'sidebar.php';?> <!-- memanggil file sidebar.php -->
	  	<?php include 'header.php';?> <!-- memanggil file header.php -->

        <!-- page content -->
        <div class="right_col" role="main">
          <?=$content?>
        </div>
        <?php include 'footer.php'?> <!-- memanggil file footer.php -->
	  </div>
	</div>
	<?php include 'javascript.php'?> <!-- memanggil file javascript.php -->
	<?php
		if (isset($js)) {
			echo $js;
	}
	?>
	</body>
</html>