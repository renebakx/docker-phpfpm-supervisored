<center>
<h1>Welcome visitor</h1>
<p>
This server is called <strong><?= gethostname();?></strong> on IP <strong><?= $_SERVER['SERVER_ADDR'];?></strong>
</p>
<p>
Current PHP Version: <strong><?= phpversion();?></strong> Webserver Version : <strong><?= $_SERVER['SERVER_SOFTWARE'];?></strong>
</center>
<?php phpinfo(INFO_VARIABLES); ?>
<?php phpinfo(INFO_MODULES); ?>
<hr/>
<?php phpinfo(INFO_GENERAL); ?>