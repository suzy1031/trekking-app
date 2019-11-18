$(function() {
  $(".toggle-icon").click(function() {
    $('#nav-container').toggleClass("pushed");
  });

  var $textarea = $('#textarea');
  var $textarea2 = $('#textarea2');
  var $textarea3 = $('#textarea3');
  var lineHeight = parseInt($textarea.css('lineHeight'));
  $textarea.on('input', function(e) {
    var lines = ($(this).val() + '\n').match(/\n/g).length;
    $(this).height(lineHeight * lines);
  });
  // 2個目のtextarea用Js
  $textarea2.on('input', function(e) {
    var lines = ($(this).val() + '\n').match(/\n/g).length;
    $(this).height(lineHeight * lines);
  });
    // 3個目のtextarea用Js
    $textarea3.on('input', function(e) {
      var lines = ($(this).val() + '\n').match(/\n/g).length;
      $(this).height(lineHeight * lines);
    });
  //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
  $('.photo-form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".preview");
        t = this;

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }

    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        //既存のプレビューを削除
        $preview.empty();
        // .prevewの領域の中にロードした画像を表示するimageタグを追加
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "300px",
                  class: "preview",
                  title: file.name
              }));
      };
    })(file);

    reader.readAsDataURL(file);
  });
  // posts#new 山メシ画像用
  $('.photo-form2').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $(".preview2");
        t = this;
    if(file.type.indexOf("image") < 0){
      return false;
    }
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
                  src: e.target.result,
                  width: "300px",
                  class: "preview2",
                  title: file.name
              }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
  // 編集する時に画像をpreviewさせる=>変更後の画像をpreviewさせる
  $(function() {
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#img_prev').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    }
    $("#post_img").change(function(){
      readURL(this);
    });
  });
});