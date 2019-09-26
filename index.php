<?php
  include 'controller/QuestController.php';
  
?>

<!DOCTYPE html>
<html lang="fr" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QCM</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
    crossorigin="anonymous">
    <link rel="stylesheet" href="public/css/index.css">
    <link rel="stylesheet" href="public/css/admin.css">
  </head>
  <body>
      <div class="py-5">
        <div class="row mx-0">
          <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
          <div class="col-lg-5 col-md-8 col-sm-10 col-xs-12 col-0 mx-auto">
            <div class="bg-light shadow rounded p-4">
              <div class="text-center my-4">
                <img src="./public/img/logoetudiant.png" width="150" height="150" class="rounded-circle shadow">
              </div>
              <form action="view/validation-admin.php" method="post">
                  <h2 class="h4 text-center">CONNEXION AU QCM</h2>
                  <hr>
                  <div class="my-4 form-group">
                    <label class="font-weight-bold">Nom de l'equipe</label><br>
                    <input class="form-control" type="text" placeholder="Entrer le nom d'utilisateur" name="nom_team" required/>
                  </div>
                  <div class="my-4 form-group">
                    <label class="font-weight-bold">Mot de passe</label><br>
                    <input class="form-control" type="password" placeholder="Entrer le mot de passe" name="password" required/>
                  </div>
                  <div>
                    <button class="btn btn-dark btn-block bg-red border-0" name="submit" type="submit">Envoyer</button>
                  </div>
              </form>
            </div>
          </div>
          <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
        </div>
      </div>

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
