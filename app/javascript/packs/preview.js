/* global $*/

// if (document.URL.match(/new/)){
// /document.addEventListener('DOMContentLoaded',() => {
//     document.getElementById('post_image').addEventListener('change', (e) =>{
//       console.log(e);
//     });
// });
// }

// document.addEventListener('DOMContentLoaded', () => {
// // $(document).on('turbolinks:load', () => {
//   const createImageHTML = (blob) => {
//     const imageElement = document.getElementById('new-image');
//     const blobImage = document.createElement('img');
//     blobImage.setAttribute('class', 'new-img')
//     blobImage.setAttribute('src', blob);
//     console.log(blobImage)
//     imageElement.appendChild(blobImage);

//   }
//   document.getElementById('post_image').addEventListener('change', (e) =>{
//     // console.log(e);
//     const file = e.target.files[0];
//     const blob = window.URL.createObjectURL(file);
    
//     console.log(blob);

//     createImageHTML(blob);
//   });
// })