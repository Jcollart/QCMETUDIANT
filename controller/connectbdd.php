<?php




try
{
    $pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
    //$bdd = new PDO('mysql:host=db783103355.hosting-data.io;dbname=db783103355', 'dbo783103355', '#Tampon08le2', $pdo_options);
    //$bdd = new PDO('mysql:host=ttsabrbrdecmz.mysql.db;dbname=ttsabrbrdecmz', 'ttsabrbrdecmz', 'rdeCMZ08', $pdo_options);
    $bdd = new PDO('mysql:host=localhost;dbname=qcm', 'root', '', $pdo_options);
}
catch(Exception $e)
{
    die('Erreur : '.$e->getMessage());
}

?>
