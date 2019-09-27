<?php
include_once '../controller/QuestController.php';
if(!isset($_SESSION['nom_team'])){
    header('Location: index.php');
}
$questcontroller = new QuestController;
$result = $questcontroller->affiche_quizz(93);

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
</head>

<body>
    <div class="main position-fixed"></div>
    <div class="my-5">
        <div class="row mx-0">
        <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
            <div class="col-lg-6 col-md-8 col-sm-10 col-xs-12 col-0">
                <div class="bg-light shadow rounded p-4">
                    <div class="progress" style="">
                        <div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="text-center my-4">
                        <img src="../public/img/logoetudiant.png" width="150" height="150" class="rounded-circle shadow">
                    </div>
                    <form class="" method="post">
                        <h2 class="h4 text-center">
                            <span class="badge badge-pill badge-dark" style="padding: .5rem 1rem;">
                                Étape <span class="cStep">?</span> / <span class="mStep">?</span>
                            </span>
                        </h2>
                        <hr>
                        <div class="my-4 alert-holder">

                        </div>
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
                    <div class="finish text-center">
                        <h3 class="h5">C'est terminé !</h3>
                        <p class="responses"><span class="count">0</span> Bonnes réponses</p>
                        <p class="timer">Temps: <span class="time">0</span></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
        </div>
    </div>
    <!-- <div class=">
        <div class="map">

        </div>
    </div> -->
    <div class="map">
        <!-- <h3>Erreur quand la map est en display none</h3> -->
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
                <iframe class="shadow-lg"
                    width="100%" height="400" frameborder="0"
                    scrolling="no" marginheight="0" marginwidth="0"
                    src="https://www.openstreetmap.org/export/embed.html?bbox=4.679832458496095%2C49.75884086990659%2C4.751501083374023%2C49.78442298138881&amp;layer=transportmap" 
                    style="">
                </iframe>
            </div>
            <div class="col-lg-3 col-md-2 col-sm-1 col-xs-0 col-0"></div>
        </div>
    </div>





    <!-- <p class="px-5">Lorsque vous arrivez sur un des endroits situé sur la carte, vous avez accès à un code
                           permettant d'acceder à la question correspondante.
                           Vous avez le choix entre 3 reponses. Attention toutefois, une fois la question validée vous ne pourrez pas revenir sur votre choix.
                           Le chrono de votre groupe se déclenchera à l'entrée du premier code et s'arretera à la validation de la derniere reponse.
                        </p>
                        <hr> -->








    <!-- <div class="affiche d-flex flex-wrap text-center justify-content-center column"> -->


        <?php
        for ($j = 0; $j < sizeof($result); $j++) {
            ?>
            <!-- <div class="main_question w-100">
                <label for="inputName"></label><br>
                <input type="name" class="form-control" id="code" placeholder="Entrez votre code"><br>
                <br><br>
                <h1 class="error text-danger" style="font size=+3">Mauvais code, Essayez de nouveau</h1>
                <button class="btn btn-secondary" value="fonctions.php" data-id="<?= $result[$j]['id'] ?>" onclick="test(this)"> Envoi du code </button>
                <hr>
                <hr>


            </div> -->
        <?php
        }
        ?>
        <!-- <hr> -->
        <!--</div>-->
        <!-- <hr>
        <button type="submit" name="endqcm">Valider mes réponses</button>
        <hr> -->
        <!-- </form> -->
        <!-- </div>-->




        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
        </script>
        <script>
            const team = `<?= $_SESSION['nom_team']; ?>`;
        </script>
        <script src="../public/js/process.js"></script>
        <script>

            function showMap() {
                $('.blur').fadeOut();
                // $('.map').find('iframe').css('opacity','1');
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