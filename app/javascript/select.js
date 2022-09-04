$(document).on('change', '#genre', function() {
  //選択肢たカテゴリーid情報を取得
  const select = $('#genre').val();

    //カテゴリー選択によって、サイズボックスの選択肢を変更
    if (select == 5) {
      $('#size option[value = 1]').css('display', 'none');
      $('#size option[value = 2]').css('display', 'none');
      $('#size option[value = 3]').css('display', 'none');
      $('#size option[value = 4]').css('display', 'none');
      $('#size option[value = 5]').css('display', 'none');
      $('#size option[value = 6]').css('display', 'none');
      $('#size option[value = 7]').css('display', 'block');
      $('#size option[value = 8]').css('display', 'block');
      $('#size option[value = 9]').css('display', 'block');
      $('#size option[value = 10]').css('display', 'block');
      $('#size option[value = 11]').css('display', 'block');
      $('#size option[value = 12]').css('display', 'block');
      $('#size option[value = 13]').css('display', 'block');
    } else {
      $('#size option[value = 7]').css('display', 'none');
      $('#size option[value = 8]').css('display', 'none');
      $('#size option[value = 9]').css('display', 'none');
      $('#size option[value = 10]').css('display', 'none');
      $('#size option[value = 11]').css('display', 'none');
      $('#size option[value = 12]').css('display', 'none');
      $('#size option[value = 13]').css('display', 'none');
      $('#size option[value = 1]').css('display', 'block');
      $('#size option[value = 2]').css('display', 'block');
      $('#size option[value = 3]').css('display', 'block');
      $('#size option[value = 4]').css('display', 'block');
      $('#size option[value = 5]').css('display', 'block');
      $('#size option[value = 6]').css('display', 'block');
    };
});