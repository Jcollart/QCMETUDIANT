<?php
  include 'controller/QuestController.php';
  $questcontroller = new QuestController;
  $bdd = new Connexion();
  $co = $bdd->openConnexion();

  if(isset($_POST['nom_team'],$_POST['password'])){
    $nom_team = $_POST['nom_team'];
    $password = $_POST['password'];

    $req = $co->prepare('SELECT id_etudiant, password FROM etudiant WHERE nom_team = :nom_team');
    $req->execute(array(
        'nom_team' => $nom_team));
    $resultat = $req->fetch();
    $req-> closeCursor();

    if ($_POST['password'] == $resultat['password']) {
      $_SESSION['id_etudiant'] = $resultat['id_etudiant'];
      $_SESSION['nom_team'] = $nom_team;
      header('Location: ./view/quizz.php');
    }
    else {
        $error = 'Mauvais identifiant ou mot de passe !';
    }

  }


  ?>

<!DOCTYPE html>
<html lang="fr" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QCM</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" integrity="sha256-+N4/V/SbAFiW1MPBCXnfnP9QSN3+Keu+NlB+0ev/YKQ=" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
    crossorigin="anonymous">
    <link rel="stylesheet" href="public/css/index.css">
    <link rel="stylesheet" href="public/css/admin.css">
  </head>
  <body>
  <div class="main position-fixed"></div>
      <div class="py-5">
        <div class="row mx-0">
          <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
          <div class="col-lg-5 col-md-8 col-sm-10 col-xs-12 col-0 mx-auto">
            <div class="bg-white shadow rounded p-4">
              Lisez attentivement le texte ci-dessous.<br>
              Les lieux à découvrir sont identifiés sur une carte à laquelle vous pourrez accéder une fois votre mot de passe et identifiant validés (ci-dessous). Celle-ci vous accompagnera tout au long de votre parcours. <strong>Vous devez impérativement vous rendre sur les 15 lieux identifiés pour valider votre participation au Carolo Express</strong>.<br><br>
              <strong>Sur chaque lieux, vous trouverez un code</strong> qui vous permettra de faire apparaître une question à laquelle vous devrez répondre. 3 réponses vous seront proposées. Cette opération sera à reconduire sur les 15 lieux identifiés.<br><br>
              Sachant que l’exercice consiste à découvrir les 15 lieux le plus rapidement possible (à pied), un compteur sera enclenché dès la validation de la première réponse. Le compteur s’arrêtera lorsque vous aurez validé la dernière réponse.<br>
              A vous de jouer en commençant par entrer le nom de l’équipe et le mot de passe communiqués lors de votre inscription au Carolo Express.<br><br>
              <p class="text-center font-weight-bold">Se connecter <br><i class="fas fa-chevron-down"></i></p>
            </div>
          </div>
          <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
        </div>
      </div>
      <div class="py-5">
        <div class="row mx-0">
          <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
          <div class="col-lg-5 col-md-8 col-sm-10 col-xs-12 col-0 mx-auto">
            <div class="bg-light shadow rounded p-4">
              <div class="text-center my-4">
                <h3 class="h4 text-red bold">Carolo Express</h3>
                <h4 class="h5 mb-4">Rentrée des étudiants 2019</h4>
                <img src="./public/img/logoetudiant.png" width="150" height="150" class="rounded-circle shadow">
              </div>
              <form action="" method="post">
                  <h2 class="h4 text-center">CONNEXION AU QCM</h2>
                  <hr>
                  <?php
                  if(isset($error)){
                    echo '<div class="alert alert-danger">'.$error.'</div>';
                  }
                  ?>
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
