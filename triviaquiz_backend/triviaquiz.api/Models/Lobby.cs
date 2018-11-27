using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace triviaquiz.api.Models
{
    public class Lobby
    {
        public string Id { get; set; }
        public string GameCode { get; set; }
        public List<Player> Players { get; set; } = new List<Player>();
        public LobbyState State { get; set; } = LobbyState.InLobby;
        public List<Category> Categories { get; set; } = new List<Category>();
        public GameMode GameMode { get; set; }
    }

    public enum LobbyState
    {
        InLobby,
        Playing,
        Paused,
        Answering,
        Finished
    }
}
