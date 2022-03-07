import Sortable from "sortablejs"

const favs = document.querySelector("#favorites-dashboard")

const initSortable = () => {
  Sortable.create(favs, {
    ghostClass: "ghost",
    animation: 150,
  })
}

export { initSortable }
