// document.querySelector('.sweet-wrong').onclick = function(){
//     sweetAlert("Oops...", "Something went wrong !!", "error");
// };
// document.querySelector('.sweet-message').onclick = function(){
//     swal("Hey, Here's a message !!")
// };
// document.querySelector('.sweet-text').onclick = function(){
//     swal("Hey, Here's a message !!", "It's pretty, isn't it?")
// };
// document.querySelector('.sweet-success').onclick = function(){
//     swal("Hey, Good job !!", "You clicked the button !!", "success")
// };
// document.querySelector('.sweet-confirm').onclick = function(){
//     swal({
//             title: "你确定要删除吗 ?",
//             text: "您将无法恢复此虚构文件 !!",
//             type: "警告",
//             showCancelButton: true,
//             confirmButtonColor: "#DD6B55",
//             confirmButtonText: "是的，删除它 !!",
//             closeOnConfirm: false
//         },
//         function(){
//             swal("删除 !!", "嘿，文件已被删除 !!", "成功");
//         });
// };

// document.querySelector('.sweet-image-message').onclick = function(){
//     swal({
//         title: "Sweet !!",
//         text: "Hey, Here's a custom image !!",
//         imageUrl: "assets/images/hand.jpg"
//     });
// };
// document.querySelector('.sweet-html').onclick = function(){
//     swal({
//         title: "Sweet !!",
//         text: "<span style='color:#ff0000'>Hey, you are using HTML !!<span>",
//         html: true
//     });
// };
// document.querySelector('.sweet-auto').onclick = function(){
//     swal({
//         title: "Sweet auto close alert !!",
//         text: "Hey, i will close in 2 seconds !!",
//         timer: 2000,
//         showConfirmButton: false
//     });
// };
// document.querySelector('.sweet-prompt').onclick = function(){
//     swal({
//             title: "Enter an input !!",
//             text: "Write something interesting !!",
//             type: "input",
//             showCancelButton: true,
//             closeOnConfirm: false,
//             animation: "slide-from-top",
//             inputPlaceholder: "Write something"
//         },
//         function(inputValue){
//             if (inputValue === false) return false;
//             if (inputValue === "") {
//                 swal.showInputError("You need to write something!");
//                 return false
//             }
//             swal("Hey !!", "You wrote: " + inputValue, "success");
//         });
// };
// document.querySelector('.sweet-ajax').onclick = function(){
//     swal({
//             title: "Sweet ajax request !!",
//             text: "Submit to run ajax request !!",
//             type: "info",
//             showCancelButton: true,
//             closeOnConfirm: false,
//             showLoaderOnConfirm: true,
//         },
//         function(){
//             setTimeout(function(){
//                 swal("Hey, your ajax request finished !!");
//             }, 2000);
//         });
// };
//
