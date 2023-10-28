// var fn = function() {
//   window.location.reload();
// };
// var tm = 10000;
// setTimeout(fn,tm);

// var reloadMessages = function () {
//   var message_id = $('.message').last().data("id");
//   console.log(message_id)
//   var group_id = $(".current-group").data("group-id");
//   console.log(group_id)
//   $.ajax({
//     // ルーティングで設定した通りのURLを指定
//     url: '/groups/' + group_id + '/api/messages',
//     // ルーティングで設定した通りのhttpメソッドをgetに指定
//     type: 'get',
//     dataType: 'json',
//     // dataオプションでリクエストに値を含める
//     data: {
//       id: message_id
//     }
//   })
// };


// var fn = function() {
//   alert("10秒経過しました（" + i + "回目）");
//   i++;
// };
// var tm = 10000;
// var i = 1;
// setInterval(fn,tm);
const milliseconds = 5000
const sync = () => {
  $.ajax({
    type: 'GET',
    url: $(location).attr('href'),
    dataType: 'script'
  })
}
const interval = setInterval(sync, milliseconds)
$(document).on('turbolinks:before-cache turbolinks:before-render', () => {clearTimeout(interval);});
// console.log("OK")