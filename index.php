<?php
  include 'controller/QuestController.php';
  
?>

<!DOCTYPE html>
<html lang="fr" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QCM</title>
    <link rel="stylesheet" href="public/css/index.css">
    <link rel="stylesheet" href="public/css/admin.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
    crossorigin="anonymous">
  </head>
  <body class="d-flex w-100 justify-content-center text-center">
       <center><h1><font size="+3" >CAROLO EXPRESS</font></h1><br><br><br>

      <div class="form">
       <form action="view/validation-admin.php" method="post">
        <div>
         <center><font size="+2">CONNEXION AU QCM</font></center>
        </div><br>
        <div>
         <label><b>Nom de l'equipe</b></label>
         <input type="text" placeholder="Entrer le nom d'utilisateur" name="nom_team" required/><br>
        </div><br>
        <div>
        <label><b>Mot de passe</b></label>
        <input type="text" placeholder="Entrer le mot de passe" name="password" required/><br>
        </div><br>
        <div>
         <input name="submit" type="submit" value="Envoyer" />
        </div>
       </form>
      </div><br>

        
    


    <!--<div class="container-fluid d-flex flex-wrap col-12 justify-content-center">
      <div class="row w-100 d-flex">
      <h1 class="col-12">Quizz du Carolo Express</h1>
      </div>
    
      <div class="row w-100 justify-content-center">
        <a href="view/new_qcm.php">Créer QCM</a> 
      </div>
      <div class="row d-flex row-wrap justify-content-around">
        <?php// include_once 'view/qcm.php'; ?>
      </div>
    </div>-->


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
    crossorigin="anonymous"></script>
  </body>
</html>
