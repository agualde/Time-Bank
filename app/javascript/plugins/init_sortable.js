import Sortable from "sortablejs"



const initSortable = () => {
  const favs = document.querySelector("#favorites-dashboard")
  if (favs) {
  Sortable.create(favs, {
    ghostClass: "ghost",
    animation: 150,
  })
  }
}

export { initSortable }
