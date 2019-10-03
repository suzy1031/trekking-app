$(function() {
  var $textarea = $('#textarea');
  var $textarea2 = $('#textarea2');
  var lineHeight = parseInt($textarea.css('lineHeight'));
  $textarea.on('input', function(e) {
    var lines = ($(this).val() + '\n').match(/\n/g).length;
    $(this).height(lineHeight * lines);
  });
  // Meal編集画面２個目のtextarea用Js
  $textarea2.on('input', function(e) {
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
// 削除する時に確認するwindowを表示
$(function() {
  $(".detail-delete-btn").click(function() {
  // キャンセルの時の処理
    if(!confirm('本当に削除しますか？')){
      return false;
    }else{
      // OKの時の処理
      location.href = '/posts';
    }
  });
});