import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()

let channel = socket.channel("polls", {})

let polls = document.querySelectorAll("table tbody tr")

polls.forEach(poll => {
  let upButton = poll.querySelector("#up-button")
  let downButton = poll.querySelector("#down-button")

  upButton.onclick = function (event) {
    channel.push("vote:up", {poll_id: upButton.value})
  }

  downButton.onclick = function (event) {
    channel.push("vote:down", {poll_id: downButton.value})
  }
})

channel.on("vote:up", ({id, up_votes}) => {
  polls.forEach(poll => {
    if (poll.id == id.toString()) {
      poll.querySelector("#up-votes").textContent = up_votes
    }
  })
})

channel.on("vote:down", ({id, down_votes}) => {
  polls.forEach(poll => {
    if (poll.id == id.toString()) {
      poll.querySelector("#down-votes").textContent = down_votes
    }
  })
})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

export default socket
