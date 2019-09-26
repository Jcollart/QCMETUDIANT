<?php
  include_once '../controller/QuestController.php';
  $questcontroller = new QuestController;
  $result = $questcontroller->affiche_quizz(93);
  ?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QCM CAROLO EXPRESS</title>
    <link rel="stylesheet" href="../public/css/index.css">
    <link rel="stylesheet" href="../public/css/admin.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<section>
<br>
    
    <div class="map">
    <h1>QCM CAROLO EXPRESS</h1>
    <center><img src="../public/img/map.jpg" /></center>
    </div>
    <br>
</section>

    <div class="affiche d-flex flex-wrap text-center justify-content-center column">


        <?php
            for($j = 0; $j < sizeof($result) ; $j++){
                ?>
                <div class="main_question w-100">
                    <label for="inputName"></label><br>
                    <input type="name" class="form-control" id="code" placeholder="Entrez votre code" ><br>
                    <br><br>
                    <h1 class="error text-danger" style="font size=+3">Mauvais code, Essayez de nouveau</h1>
                    <button class="btn btn-secondary" value="fonctions.php" data-id="<?= $result[$j]['id'] ?>"
                        onclick="test(this)"> Envoi du code </button>
<hr><hr>

                      
                </div>
        <?php
            }
        ?> 
 <hr>
  <!--</div>-->
    <hr>
     <button type="submit" name="endqcm">Valider mes réponses</button> 
<hr>
    <!-- </form> -->
   <!-- </div>-->




    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
    <script>
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
                success: function (res) {
                    console.log('on est allé dans la fonction');
                    if(res.length > 0){
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
                            html +='<button type="submit" name="question">Valider ma réponse</button></div></form>';

                    // html +=
                    // '<button type="submit" name="endqcm">Valider mes réponses</button></div></form>';

                    $(e).parent().html(html);
                    // console.log(res[i]['question']);

                    } else {
                        const error = $(e).parent().find('.error');
                        $(error).show();
                    }
                },
                error: function (res) {
                    console.log('on est pas rentré dans la fonction');
                },
            })
        }
    </script>

</body>

</html>