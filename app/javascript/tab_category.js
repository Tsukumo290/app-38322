document.addEventListener('DOMContentLoaded', function(){
  const tabs = document.getElementsByClassName('tab-passive');
  for(let i = 0; i < tabs.length; i++) {
    tabs[i].addEventListener('click', tabSwitch, false);
  }

  // タブをクリックすると実行する関数
  function tabSwitch(){
    // タブのclassの値を変更
    document.getElementsByClassName('tab-active')[0].classList.remove('tab-active');
    this.classList.add('tab-active');
    // コンテンツのclassの値を変更
    document.getElementsByClassName('box-show')[0].classList.remove('box-show');
    const arrayTabs = Array.prototype.slice.call(tabs);
    const index = arrayTabs.indexOf(this);
    document.getElementsByClassName('tab-box')[index].classList.add('box-show');
  };
}, false);