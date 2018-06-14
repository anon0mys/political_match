$(document).ready(() => {
  fetchPoliticianPictures();
});

const fetchPoliticianPictures = () => {
  let spans = $('.politician-image-id')
  let list = Object.values(spans)
  let politicianIds = list.map(element => {
    if(element.innerText) {
      return element.innerText
    };
  })

  politicianIds.forEach(function(id) {
    if(typeof id === 'undefined') return;
    fetch(`https://theunitedstates.io/images/congress/225x275/${id}.jpg`)
      .then(result => {
        appendImage(result.url)
      })
      .catch(error => console.error(error))
  })
};

const appendImage = (url) => {
  let string = url.split('.')[1].split('/')
  let divId = string[string.length - 1]
  $(`#${divId}`).html(`<image src=${url}></image>`)
}
