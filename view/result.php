<?php
include_once '../controller/QuestController.php';
$questcontroller = new QuestController;
$results = $questcontroller->showResults();
$avg = $questcontroller->avgResults();
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QCM CAROLO EXPRESS</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" integrity="sha256-+N4/V/SbAFiW1MPBCXnfnP9QSN3+Keu+NlB+0ev/YKQ=" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../public/css/index.css">
    <link rel="stylesheet" href="../public/css/admin.css">
</head>

<body>
    <div class="main position-fixed"></div>

    <div class="py-5 access-connect">
        <div class="row mx-0">
          <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
          <div class="col-lg-5 col-md-8 col-sm-10 col-xs-12 col-0 mx-auto">
            <div class="bg-light shadow rounded p-4">
              <div class="text-center my-4">
                <img src="../public/img/logoetudiant.png" width="150" height="150" class="rounded-circle shadow">
              </div>
                  <h2 class="h4 text-center">CONNEXION</h2>
                  <hr>
                  <div class="my-4 form-group">
                    <label class="font-weight-bold">Code d'accès</label><br>
                    <input class="form-control" id="code" type="password" placeholder="**********" name="password" required/>
                  </div>
                  <div>
                    <button class="btn btn-dark btn-block bg-red border-0" name="submit" type="submit" onclick="admin()">Voir les résultats</button>
                  </div>
            </div>
          </div>
          <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
        </div>
      </div>


    <div class="bg-white mx-auto my-5 p-4 shadow-lg result-container">
        <div class="text-center my-4">
            <img src="../public/img/logoetudiant.png" width="150" height="150" class="rounded-circle shadow">
        </div>
        <div class="row no-gutters bg-red text-light font-weight-bold" style="border-bottom: 2px solid black;">
            <div class="col-lg-5 col-md-5 col-sm-5 col-12 py-2 text-center">Nom de l'équipe</div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-12 py-2 text-center">Nombre de bonnes réponses</div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-12 py-2 text-center">Temps du parcours</div>
        </div>
        <div class="result">
            <?php
                for($i = 0 ; $i < sizeof($results) ; $i++){
                    echo '
                    <div class="row no-gutters">
                    <div class="col-lg-5 col-md-5 col-sm-5 col-6 py-2 text-center">'.$results[$i]['nom_team'].'</div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-3 py-2 text-center">'.$results[$i]['good'].'</div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-3 py-2 text-center">'.date('H:i:s', strtotime($results[$i]['final_time'])).'</div>
                    </div>
                    ';
                }
            ?>
        </div>
        <hr>
        <div class="text-center">
            Moyenne des réponses :
            <?php
            if($avg["AVG(good)"] >= 7){
                echo '<span class="text-success font-weight-bold">';
            } else {
                echo '<span class="text-danger font-weight-bold">';
            }
            echo number_format($avg["AVG(good)"],2).'</span>'
            ?>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
    <script>
        function admin(){
            const code = $('#code').val();
            $.ajax({
                url: "./fonctions.php",
                method: "post",
                data: {
                    code: code,
                    admin: true
                },
                success: function(res) {
                    if(res.indexOf("success") != -1){
                        $('.access-connect').fadeOut(function(){
                            $('.result-container').fadeIn();
                        });
                    } else {

                    }
                },
                error: function(){
                    console.log('Erreur ajax');
                }
            });
        }

    </script>
</body>

</html>