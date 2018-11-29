using System.Collections.Generic;

namespace triviaquiz.api.Models.ViewModels
{
    public class LobbyViewModel
    {
        public string Id { get; set; }
        public string GameCode { get; set; }
        public List<PlayerViewModel> Players { get; set; } = new List<PlayerViewModel>();
        public List<CategoryViewModel> Categories { get; set; } = new List<CategoryViewModel>();
        public string GameMode { get; set; }
    }
}
