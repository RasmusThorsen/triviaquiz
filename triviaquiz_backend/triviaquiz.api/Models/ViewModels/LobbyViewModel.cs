using System.Collections.Generic;

namespace triviaquiz.api.Models.ViewModels
{
    public class LobbyViewModel
    {
        public string Id { get; set; }
        public string GameCode { get; set; }
        public List<PlayerViewModel> Players { get; set; } = new List<PlayerViewModel>();
        public LobbyState State { get; set; } = LobbyState.InLobby;
        public List<Category> Categories { get; set; } = new List<Category>();
        public GameMode GameMode { get; set; }
    }
}
