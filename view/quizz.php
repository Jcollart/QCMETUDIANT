<?php
include_once '../controller/QuestController.php';
if (!isset($_SESSION['nom_team'])) {
    header('Location: index.php');
}

$questcontroller = new QuestController;
$result = $questcontroller->affiche_quizz(93);
$bdd = new Connexion();
$co = $bdd->openConnexion();

$req = $co->prepare('SELECT * FROM resultat WHERE nom_team = :nom_team');
$req->execute(array(
    'nom_team' => $_SESSION['nom_team']
));
$done = $req->fetch();
$class = $done != null ? 'active' : '';
$req->closeCursor();

$currentStep = 1;
$maxStep = 15;
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../public/img/logoetudiant.png" />
    <title>QCM CAROLO EXPRESS</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" integrity="sha256-+N4/V/SbAFiW1MPBCXnfnP9QSN3+Keu+NlB+0ev/YKQ=" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../public/css/index.css">
    <link rel="stylesheet" href="../public/css/admin.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.0.0/css/ol.css" type="text/css">
    <style type="text/css">
        #map {
            /* la carte DOIT avoir une hauteur sinon elle n'apparaît pas */
            height: 500px;
            width: 100%;
        }

        #map canvas {
            position: relative !important;
        }
    </style>
</head>

<body>
    <div class="main position-fixed"></div>
    <div class="my-5">
        <div class="row mx-0">
            <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
            <div class="col-lg-6 col-md-8 col-sm-10 col-xs-12 col-0">
                <div class="bg-light shadow rounded p-4">
                    <?php
                    if ($done == null) {
                        echo '
                            <div class="progress" style="">
                                <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            ';
                    }
                    ?>
                    <div class="text-center my-4">
                        <img src="../public/img/logoetudiant.png" width="150" height="150" class="rounded-circle shadow">
                    </div>
                    <?php
                    if ($done == null) {
                        ?>
                        <form class="" method="post">
                            <h2 class="h4 text-center">
                                <span class="badge badge-pill badge-dark" style="padding: .5rem 1rem;">
                                    Étape <span class="cStep">?</span> / <span class="mStep">?</span>
                                </span>
                            </h2>
                            <hr>
                            <div class="my-4 alert-holder"></div>
                            <div class="my-4 form-group holder">
                                <div class="text-center w-full">
                                    <div class="spinner-border text-danger" role="status">
                                        <span class="sr-only">Loading...</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button class="btn btn-dark btn-block bg-red border-0" name="submit" type="submit">Confirmer</button>
                            </div>
                        </form>
                    <?php
                    }
                    ?>
                    <div class="finish text-center bg-gradient rounded shadow p-2 <?= $class; ?>">
                        <h3 class="h5 font-weight-bold">Vous avez fini le quizz !</h3>
                        <p class="responses">Rendez-vous au point de départ pour voir votre classement.</p>
                        <p class="timer">
                            Temps écoulé:
                            <span class="time"><?= $done == null ? 0 : $done['final_time']; ?></span>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
        </div>
    </div>
    =
    <div class="map">
        <div class="row mx-0 mb-4">
            <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
            <div class="col-lg-6 col-md-8 col-sm-10 col-xs-12 col-0 position-relative">
                <div class="position-absolute blur">
                    <div class="d-flex align-items-center justify-content-center h-100 w-100">
                        <div class="text-center">

                            <button class="btn btn-light shadow" onclick="showMap()">Voir la carte</button>
                        </div>
                    </div>
                </div>
                <!-- <iframe class="shadow-lg" width="100%" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.openstreetmap.org/export/embed.html?bbox=4.679832458496095%2C49.75884086990659%2C4.751501083374023%2C49.78442298138881&amp;layer=transportmap" style="">
                </iframe> -->
                <div id="map"></div>
            </div>
            <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
        </div>
    </div>

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".defi" data-backdrop="static" data-keyboard="false">Small modal</button>

    <div class="modal fade defi" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content p-2">
                <h2 class="modal-title text-uppercase text-red font-weight-bold text-center" id="exampleModalLabel">Défi !</h2>
                <hr style="border: 1px solid red; width: 100%;">
                <div class="modal-body">
                    <div class="text-center w-100 position-relative" style="height: 150px;">
                        <img src="../public/img/eclair.png" width="150" height="150">
                        <div class="position-absolute w-100 defi-content font-weight-bold">
                            Prennez votre groupe en photo <span class="text-red">avec un autre téléphone</span> devant une boutique Orange et envoyer le sur Twitter avec le #carolomescouilles
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="button" class="btn btn-danger bg-red mt-4" data-dismiss="modal">Fait <i class="fas fa-check"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
    <script>
        // $('#myModal').modal({backdrop: 'static', keyboard: false}) 
        const team = `<?= $_SESSION['nom_team']; ?>`;
    </script>
    <script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.0.0/build/ol.js"></script>
    <script src="../public/js/map.js"></script>
    <script src="../public/js/process.js"></script>
    <script>
        function showMap() {
            $('.blur').fadeOut();
        }

        function test(e) {
            var code = $("#code").val();
            var id = $(e).data('id');
            $.ajax({
                url: "./fonctions.php",
                method: "post",
                data: {
                    code: code,
                    id: id
                },
                dataType: 'json',
                success: function(res) {
                    console.log('on est allé dans la fonction');
                    if (res.length > 0) {
                        var html = '';
                        for (i = 0; i < res.length; i++) {
                            if (i == 0) {
                                var tmp = res[0]['id'];
                                html += '<form class=" p-2" action="../modele/question.php" method="POST">';
                                html += '<div class=" t p-2" data-id="' + res[0]['id'] +
                                    '" onclick="test(this)"'; // 1
                                html += '<h2>';
                                html += res[0]['label_question'] + '</h2><br>';
                                html += '<h3>';
                                html += res[0]['question'] + '</h3><br></div>';
                            }

                            if (res[i]['id'] != tmp) {
                                tmp = res[i]['id'];
                                html += '<br><div class="" data-id="' + res[i]['id'] +
                                    '"  onclick="test(this)"><h2>'; // 1* 1
                                html += res[i]['label_question'] + '</h2><br>';
                                html += res[i]['question'] + '</h2><br>';
                                html += '<div class="form-check">'; // 2
                                html += '<input type="checkbox" class="form-check-input" name="answer"' + i +
                                    '"';
                                html += 'value="' + res[i]['valid'] + '">';
                                html += '<label class="form-check-label" for="answer' + i + '">' + res[i][
                                    'reponse'
                                ] + '></label></div>'; // 2*
                            } else {
                                html += '<div class="form-check">'; // 2
                                html += '<input type="checkbox" class="form-check-input" name="answer' + i +
                                    '"';
                                html += 'value="' + res[i]['valid'] + '">';
                                html += '<label class="form-check-label" for="answer' + i + '">' + res[i][
                                    'reponse'
                                ] + '</label><br></div></div>'; // 2* 1*
                            }
                        }
                        html += '<button type="submit" name="question">Valider ma réponse</button></div></form>';

                        // html +=
                        // '<button type="submit" name="endqcm">Valider mes réponses</button></div></form>';

                        $(e).parent().html(html);
                        // console.log(res[i]['question']);

                    } else {
                        const error = $(e).parent().find('.error');
                        $(error).show();
                    }
                },
                error: function(res) {
                    console.log('on est pas rentré dans la fonction');
                },
            })
        }
    </script>

</body>

</html>