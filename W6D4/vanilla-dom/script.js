document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const handleFavoriteSubmit = (e) => {
    e.preventDefault();
    const favInput = document.querySelector('.favorite-input');
    const fav = favInput.value;
    favInput.value = "";

    const newLi = document.createElement("li");
    newLi.textContent = fav;

    const favList = document.getElementById("sf-places");
    favList.appendChild(newLi);
  };

  const listSubmitButton = document.querySelector('.favorite-submit');
  listSubmitButton.addEventListener("click", handleFavoriteSubmit);



  // adding new photos

  // --- your code here!
  const showPhotoForm = (e) => {
    const photoFormDiv = document.querySelector('.photo-form-container');
    if (photoFormDiv.className === "photo-form-container") {
      photoFormDiv.className = "photo-form-container hidden";
    } else {
      photoFormDiv.className = "photo-form-container";
    }
  }

  const photoFormShowButton = document.querySelector('.photo-show-button');
  photoFormShowButton.addEventListener("click", showPhotoForm);


  const handlePhotoSubmit = (e) => {
    e.preventDefault();

    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";

    const newImg = document.createElement("img");
    newImg.src = photoUrl;

    const newPhotoLi = document.createElement("li");
    newPhotoLi.appendChild(newImg);

    const photoList = document.querySelector('.dog-photos');
    photoList.appendChild(newPhotoLi);
  }
});
